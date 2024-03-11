import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/Product.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:dio/dio.dart';

abstract class IProductDatasource {
  Future<List<Product>> productList();
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
}
