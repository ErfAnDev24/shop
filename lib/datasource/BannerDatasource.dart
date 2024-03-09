import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/Banner.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:dio/dio.dart';

abstract class IBannerDatasource {
  Future<List<Banner>> getBanners();
}

class BannerDatasourceImpl implements IBannerDatasource {
  final dio = locator.get<Dio>();

  @override
  Future<List<Banner>> getBanners() async {
    try {
      var response = await dio.get('collections/banner/records');

      var jsonObjectList = response.data['items'];

      List<Banner> bannerList = jsonObjectList
          .map<Banner>((jsonObject) => Banner.buildFromJsonObject(jsonObject))
          .toList();

      return bannerList;
    } catch (ex) {
      throw ApiException('getting banners has been failed!');
    }
  }
}
