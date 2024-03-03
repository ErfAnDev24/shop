import 'package:digikala/datasource/AuthenticationRemote.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

void initLocators() {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'https://startflutter.ir/api/'),
    ),
  );

  locator
      .registerFactory<IAuthenticationRemote>(() => AuthenticationRemoteImpl());
}
