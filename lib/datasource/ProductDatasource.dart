import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/Category.dart';
import 'package:digikala/models/Product.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:dio/dio.dart';

abstract class IProductDatasource {
  Future<List<Product>> productList();

  Future<List<Product>> bestSellerList();

  Future<List<Product>> mostViewedList();

  Future<List<Product>> productListByCategoryId(String categoryId);

  Future<Category> category(String categoryId);
}

class ProductDatasourceImpl implements IProductDatasource {
  final dio = locator.get<Dio>();

  @override
  Future<List<Product>> productList() async {
    try {
      var response = await dio.get('collections/products/records');

      var jsonObjectList = response.data['items'];

      List<Product> productList = jsonObjectList
          .map<Product>((jsonObject) => Product.buildFromJsonObject(jsonObject))
          .toList();

      return productList;
    } catch (ex) {
      throw ApiException('an error has been ouccred through getting products');
    }
  }

  @override
  Future<List<Product>> bestSellerList() async {
    try {
      Map<String, String> qParams = {'filter': 'popularity="Best Seller"'};

      var response = await dio.get('collections/products/records',
          queryParameters: qParams);

      var jsonObjectList = response.data['items'];

      List<Product> productList = jsonObjectList
          .map<Product>((jsonObject) => Product.buildFromJsonObject(jsonObject))
          .toList();

      return productList;
    } catch (ex) {
      throw ApiException('an error has been ouccred through getting products');
    }
  }

  @override
  Future<List<Product>> mostViewedList() async {
    try {
      Map<String, String> qParams = {'filter': 'popularity="Hotest"'};

      var response = await dio.get('collections/products/records',
          queryParameters: qParams);

      var jsonObjectList = response.data['items'];

      List<Product> productList = jsonObjectList
          .map<Product>((jsonObject) => Product.buildFromJsonObject(jsonObject))
          .toList();

      return productList;
    } catch (ex) {
      throw ApiException('an error has been ouccred through getting products');
    }
  }

  @override
  Future<List<Product>> productListByCategoryId(String categoryId) async {
    try {
      Response response;

      if (categoryId == 'qnbj8d6b9lzzpn8') {
        response = await dio.get('collections/products/records');
      } else {
        Map<String, String> qParams = {'filter': 'category="$categoryId"'};

        response = await dio.get('collections/products/records',
            queryParameters: qParams);
      }

      var jsonObjectList = response.data['items'];

      List<Product> productList = jsonObjectList
          .map<Product>((jsonObject) => Product.buildFromJsonObject(jsonObject))
          .toList();

      return productList;
    } catch (ex) {
      throw ApiException(
          'an error has been ouccred through getting products BY CATEGORY_ID');
    }
  }

  @override
  Future<Category> category(String categoryId) async {
    try {
      Map<String, String> qParams = {'filter': 'id="$categoryId"'};
      var response = await dio.get('collections/category/records',
          queryParameters: qParams);
      var jsonObjectList = response.data['items'];
      List<Category> category = jsonObjectList
          .map<Category>(
              (jsonObject) => Category.buildObjectFromJson(jsonObject))
          .toList();

      return category[0];
    } catch (ex) {
      throw ApiException('error in getting category title');
    }
  }
}
