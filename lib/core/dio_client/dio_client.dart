import 'package:alo_avto/core/constants/network_links.dart';
import 'package:alo_avto/core/dio_client/prestty_logger.dart';
import 'package:alo_avto/core/service/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static final DioClient _singleton = DioClient._internal();
  factory DioClient() => _singleton;

  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: NetworkLinks.baseUrl,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(PrettyDioLogger(requestHeader: true));

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final storage = SecureStorageService();
          final token = await storage.getAccessToken();

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onError: (e, handler) async {
          if (e.response?.statusCode == 401) {
            final refreshed = await _refreshToken();
            if (refreshed) {
              final storage = SecureStorageService();
              final newToken = await storage.getAccessToken();

              final req = e.requestOptions;
              req.headers['Authorization'] = 'Bearer $newToken';

              final retryResponse = await _dio.fetch(req);
              return handler.resolve(retryResponse);
            }
          }
          return handler.next(e);
        },
      ),
    );
  }

  static late final Dio _dio;

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> post(String path, {dynamic data, Options? options}) async {
    try {
      return await _dio.post(path, data: data, options: options);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> put(String path, {dynamic data, Options? options}) async {
    try {
      return await _dio.put(path, data: data, options: options);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> delete(String path, {dynamic data, Options? options}) async {
    try {
      return await _dio.delete(path, data: data, options: options);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<bool> _refreshToken() async {
    try {
      final storage = SecureStorageService();
      final refresh = await storage.getRefreshToken();
      if (refresh == null) return false;

      final response = await _dio.post(
        NetworkLinks.refresh,
        data: {'refresh': refresh},
      );

      final newAccess = response.data['access'];
      final newRefresh = response.data['refresh'];

      await storage.setAccessToken(newAccess);
      await storage.setRefreshToken(newRefresh);

      return true;
    } catch (_) {
      return false;
    }
  }

  void _handleError(Object error) {
    if (kDebugMode) {
      if (error is DioException) {
        print('❌ Dio Error: ${error.message}');
        print('➡️ Response: ${error.response?.data}');
      } else {
        print('❌ Unknown Error: $error');
      }
    }
  }
}
