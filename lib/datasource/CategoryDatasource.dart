import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/Category.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:dio/dio.dart';

abstract class ICategoryDatasource {
  Future<List<Category>> getCategoryList();
}

class CategoryDatasourceImpl implements ICategoryDatasource {
  final dio = locator.get<Dio>();

  @override
  Future<List<Category>> getCategoryList() async {
    try {
      var response = await dio.get('collections/category/records');

      var jsonArray = response.data['items'];

      var categoryList = jsonArray
          .map<Category>(
              (jsonObject) => Category.buildObjectFromJson(jsonObject))
          .toList();

      return categoryList;
    } catch (ex) {
      throw ApiException('getting data from API faild!');
    }
  }
}
