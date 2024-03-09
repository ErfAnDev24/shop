import 'package:digikala/models/Banner.dart';
import 'package:digikala/models/Category.dart';
import 'package:either_dart/either.dart';

class HomeState {}

class LoadingBannerState extends HomeState {}

class ResponseBannerState extends HomeState {
  Either<String, List<HomeBanner>> bannerList;
  ResponseBannerState(this.bannerList);
}

class ResponseHomeCategoryListState extends HomeState {
  Either<String, List<Category>> categoryList;
  ResponseHomeCategoryListState(this.categoryList);
}
