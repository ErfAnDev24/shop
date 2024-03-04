import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthenticationRemote {
  Future<void> register(
      String username, String password, String confirmPassword);

  Future<void> login(String identity, String password);
}

class AuthenticationRemoteImpl implements IAuthenticationRemote {
  final Dio dio = locator.get<Dio>();

  @override
  Future<void> register(
      String username, String password, String passwordConfirm) async {
    try {
      var response = await dio.post('collections/users/records', data: {
        'username': username,
        'password': password,
        'passwordConfirm': passwordConfirm,
      });
    } on Exception catch (ex) {
      throw ApiException('creating user has been faild!');
    }
  }

  @override
  Future<void> login(String identity, String password) async {
    try {
      var response = await dio.post(
        'collections/users/auth-with-password',
        data: {
          'identity': identity,
          'password': password,
        },
      );
      var sharePref = locator.get<SharedPreferences>();
      sharePref.setString('access-token', response.data['token']);
    } catch (ex) {
      throw ApiException('user login has been faild!');
    }
  }
}
