import 'dart:developer';

import 'package:alo_avto/core/constants/network_links.dart';
import 'package:alo_avto/core/dio_client/dio_client.dart';
import 'package:alo_avto/core/failure/failure.dart';
import 'package:alo_avto/features/auth/data/model/login_model.dart';

class AuthDatasource {
  DioClient dio;
  AuthDatasource({required this.dio});

  Future<LoginModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final body = {"username": "Abdurashid", "password": "password321"};
      final response = await dio.post(NetworkLinks.userLogin, data: body);
      if (response.statusCode == 200) {
        return LoginModel.fromMap(response.data as Map<String, dynamic>);
      }
      throw Exception("Loginda xatolik");
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw CacheFailure(message: "$e,$s");
    }
  }
}
