import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:dio/dio.dart';

abstract class IAuthenticationRemote {
  Future<void> register(
      String username, String password, String confirmPassword);
}

class AuthenticationRemoteImpl implements IAuthenticationRemote {
  final Dio dio = locator.get<Dio>();

  @override
  Future<void> register(
      String username, String password, String confirmPassword) async {
    var response = await dio.post('/collections/users/records/', data: {
      'username': username,
      'password': password,
      'confirmPassword': confirmPassword,
    });

    if (response.statusCode != 200) {
      throw ApiException('registering user has been failed!');
    }
  }
}
