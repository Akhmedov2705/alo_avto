import 'dart:convert';

import 'package:alo_avto/features/auth/data/model/user_model.dart';

class LoginModel {
  String message;
  UserModel user;
  String access;
  String refresh;
  LoginModel({
    required this.message,
    required this.user,
    required this.access,
    required this.refresh,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'user': user.toJson(),
      'access': access,
      'refresh': refresh,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      message: map['message'] as String,
      user: UserModel.fromJson(map['user'] as Map<String, dynamic>),
      access: map['tokens']["access"] as String,
      refresh: map['tokens']["refresh"] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
