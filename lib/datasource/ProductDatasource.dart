import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/Product.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:dio/dio.dart';

abstract class IProductDatasource {
  Future<List<Product>> productList();

  Future<List<Product>> bestSellerList();

  Future<List<Product>> mostViewedList();
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
}
