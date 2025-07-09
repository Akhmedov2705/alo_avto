import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PrettyDioLogger extends Interceptor {
  final bool requestHeader;
  final bool requestBody;
  final bool responseHeader;
  final bool responseBody;
  final bool error;
  final bool compact;
  final int maxWidth;

  PrettyDioLogger({
    this.requestHeader = true,
    this.requestBody = true,
    this.responseHeader = false,
    this.responseBody = true,
    this.error = true,
    this.compact = true,
    this.maxWidth = 90,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      log('┌───────────────────────────────────────');
      log('│ 🛫 Request → ${options.method} ${options.baseUrl}${options.path}');
      if (requestHeader) {
        log('│ Headers: ${options.headers}');
      }
      if (requestBody && options.data != null) {
        _logLongText('│ Body: ${options.data}');
      }
      log('└───────────────────────────────────────');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      log('┌───────────────────────────────────────');
      log(
        '│ ✅ Response ← ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.baseUrl}${response.requestOptions.path}',
      );
      if (responseHeader) {
        log('│ Headers: ${response.headers.map}');
      }
      if (responseBody && response.data != null) {
        _logLongText('│ Body: ${response.data}');
      }
      log('└───────────────────────────────────────');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode && error) {
      log('┌───────────────────────────────────────');
      log('│ ❌ Error [${err.type}] → ${err.message}');
      if (err.response != null) {
        log('│ Status Code: ${err.response?.statusCode}');
        _logLongText('│ Error Body: ${err.response?.data}');
      }
      log('└───────────────────────────────────────');
    }
    super.onError(err, handler);
  }

  void _logLongText(String message) {
    final pattern = RegExp('.{1,$maxWidth}');
    pattern.allMatches(message).forEach((match) => log(match.group(0)!));
  }
}
