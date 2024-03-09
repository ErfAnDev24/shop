import 'package:digikala/datasource/AuthenticationRemote.dart';
import 'package:digikala/datasource/BannerDatasource.dart';
import 'package:digikala/datasource/CategoryDatasource.dart';
import 'package:digikala/repository/AuthenticationRepository.dart';
import 'package:digikala/repository/BannerRepository.dart';
import 'package:digikala/repository/CategoryRepository.dart';
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
  locator.registerFactory<ICategoryDatasource>(() => CategoryDatasourceImpl());

  locator.registerFactory<ICategoryRepository>(() => CategoryRepositoryImpl());
  locator
      .registerFactory<IAuthenticationRemote>(() => AuthenticationRemoteImpl());

  locator.registerFactory<IAuthenticationRepository>(
      () => AuthenticationRepositoryImpl());

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  locator.registerFactory<IBannerDatasource>(() => BannerDatasourceImpl());

  locator.registerFactory<IBannerRepository>(() => BannerRepositoryImpl());
}
