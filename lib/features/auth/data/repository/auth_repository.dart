import 'package:alo_avto/core/either/either.dart';
import 'package:alo_avto/core/failure/failure.dart';
import 'package:alo_avto/features/auth/data/datasource/auth_datasource.dart';
import 'package:alo_avto/features/auth/data/model/login_model.dart';

class AuthRepository {
  final AuthDatasource datasource;
  AuthRepository({required this.datasource});
  Future<Either<LoginModel, Failure>> login({
    required String username,
    required String password,
  }) async {
    try {
      final LoginModel loginModel = await datasource.login(
        username: username,
        password: password,
      );

      return Left(loginModel);
    } catch (e, s) {
      return Right(CacheFailure(message: "$e,$s"));
    }
  }
}
