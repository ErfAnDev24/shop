import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/ProductImage.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:dio/dio.dart';

abstract class IProductDetailsDatasource {
  Future<List<ProductImage>> productImageList(String productId);
}

class ProductDetailsDatasourceImpl implements IProductDetailsDatasource {
  final dio = locator.get<Dio>();

  @override
  Future<List<ProductImage>> productImageList(String productId) async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="$productId"'};
      var response = await dio.get('collections/gallery/records',
          queryParameters: qParams);
      var jsonObjectList = response.data['items'];
      List<ProductImage> productImageList = jsonObjectList
          .map<ProductImage>(
              (jsonObject) => ProductImage.buildFromJsonObject(jsonObject))
          .toList();

      return productImageList;
    } catch (ex) {
      throw ApiException('error in getting productImage');
    }
  }
}
