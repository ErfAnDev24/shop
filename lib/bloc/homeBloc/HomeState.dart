import 'package:digikala/models/Banner.dart';
import 'package:digikala/models/Category.dart';
import 'package:digikala/models/Product.dart';
import 'package:either_dart/either.dart';

class HomeState {}

class InitState extends HomeState {}

class LoadingHomeState extends HomeState {}

class HomeResponseState extends HomeState {
  Either<String, List<Category>> categoryList;
  Either<String, List<HomeBanner>> bannerList;
  Either<String, List<Product>> productList;
  HomeResponseState(this.categoryList, this.bannerList, this.productList);
}
