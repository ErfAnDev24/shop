import 'package:digikala/datasource/AuthenticationRemote.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:either_dart/either.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthenticationRepository {
  Future<Either<String, String>> register(
      String username, String password, String confirmPassword);

  Future<Either<String, String>> login(String identity, String password);
}

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  final datasource = locator.get<IAuthenticationRemote>();

  @override
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm) async {
    try {
      await datasource.register(username, password, passwordConfirm);
      return const Right('user has been created!');
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }

  @override
  Future<Either<String, String>> login(String identity, String password) async {
    try {
      await datasource.login(identity, password);
      String? token =
          locator.get<SharedPreferences>().getString('access-token');

      return Right(token!);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }
}
