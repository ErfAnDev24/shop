import 'package:digikala/datasource/AuthenticationRemote.dart';
import 'package:digikala/datasource/BannerDatasource.dart';
import 'package:digikala/datasource/CartDatasource.dart';
import 'package:digikala/datasource/CategoryDatasource.dart';
import 'package:digikala/datasource/ProductDatasource.dart';
import 'package:digikala/datasource/ProductDetailsDatasource.dart';
import 'package:digikala/repository/AuthenticationRepository.dart';
import 'package:digikala/repository/BannerRepository.dart';
import 'package:digikala/repository/CartRepository.dart';
import 'package:digikala/repository/CategoryRepository.dart';
import 'package:digikala/repository/ProductDetailsRepository.dart';
import 'package:digikala/repository/ProductRepository.dart';
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

  locator.registerFactory<IBannerDatasource>(() => BannerDatasourceImpl());

  locator.registerFactory<IBannerRepository>(() => BannerRepositoryImpl());

  locator.registerFactory<IProductDatasource>(() => ProductDatasourceImpl());

  locator.registerFactory<IProductRepository>(() => ProductRepositoryImpl());

  locator.registerFactory<IProductDetailsDatasource>(
      () => ProductDetailsDatasourceImpl());

  locator.registerFactory<IProductDetailsRepository>(
      () => ProductDetailsRepositoryImpl());

  locator.registerFactory<ICartDatasource>(() => CartDatasourceImpl());

  locator.registerFactory<ICartRepository>(() => CartRepositoryImpl());

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}
