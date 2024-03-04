import 'package:digikala/datasource/AuthenticationRemote.dart';
import 'package:digikala/repository/AuthenticationRepository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

void initLocators() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'https://startflutter.ir/api/'),
    ),
  );

  locator
      .registerFactory<IAuthenticationRemote>(() => AuthenticationRemoteImpl());

  locator.registerFactory<IAuthenticationRepository>(
      () => AuthenticationRepositoryImpl());

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}
