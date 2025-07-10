import 'package:alo_avto/core/failure/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:alo_avto/features/auth/data/model/login_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginModel loginModel;

  const AuthSuccess(this.loginModel);

  @override
  List<Object?> get props => [loginModel];
}

class AuthFailure extends AuthState {
  final Failure failure;

  const AuthFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
