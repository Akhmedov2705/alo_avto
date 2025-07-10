import 'package:alo_avto/features/auth/data/repository/auth_repository.dart';
import 'package:alo_avto/features/auth/presentation/bloc/login_bloc/login_event.dart';
import 'package:alo_avto/features/auth/presentation/bloc/login_bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<AuthLoginEvent>(_onLogin);
  }

  Future<void> _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await repository.login(
      username: event.username,
      password: event.password,
    );

    if (result.isLeft) {
      emit(AuthSuccess(result.left));
    }
    emit(AuthFailure(result.right));
  }
}
