import 'package:digikala/datasource/BannerDatasource.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/Banner.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:either_dart/either.dart';

abstract class IBannerRepository {
  Future<Either<String, List<HomeBanner>>> getBanners();
}

class BannerRepositoryImpl implements IBannerRepository {
  final datasource = locator.get<IBannerDatasource>();

  @override
  Future<Either<String, List<HomeBanner>>> getBanners() async {
    try {
      var bannerList = await datasource.getBanners();
      return Right(bannerList);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }
}
