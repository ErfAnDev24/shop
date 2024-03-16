import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/ProductImage.dart';
import 'package:digikala/models/ProductVariant.dart';
import 'package:digikala/models/Variant.dart';
import 'package:digikala/models/VariantType.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:dio/dio.dart';

abstract class IProductDetailsDatasource {
  Future<List<ProductImage>> productImageList(String productId);
  Future<List<Variant>> variantList(String productId);
  Future<List<VariantType>> typeList();
  Future<List<ProductVariant>> productVariantList(String productId);
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

  @override
  Future<List<VariantType>> typeList() async {
    try {
      var response = await dio.get('collections/variants_type/records');
      var jsonObjectList = response.data['items'];
      List<VariantType> typeList = jsonObjectList
          .map<VariantType>(
              (jsonObject) => VariantType.buildFromJsonObject(jsonObject))
          .toList();

      return typeList;
    } catch (ex) {
      throw ApiException('error in getting variant types');
    }
  }

  @override
  Future<List<Variant>> variantList(String productId) async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="$productId"'};
      var response = await dio.get('collections/variants/records',
          queryParameters: qParams);
      var jsonObjectList = response.data['items'];
      List<Variant> productImageList = jsonObjectList
          .map<Variant>((jsonObject) => Variant.buildFromJsonObject(jsonObject))
          .toList();

      return productImageList;
    } catch (ex) {
      print(ex);
      throw ApiException('error in getting variants');
    }
  }

  @override
  Future<List<ProductVariant>> productVariantList(String productId) async {
    try {
      List<ProductVariant> productVariantList = [];

      List<Variant> variants = await variantList(productId);
      List<VariantType> variantTypeList = await typeList();

      for (var type in variantTypeList) {
        List<Variant> tempList =
            variants.where((element) => element.type_id == type.id).toList();
        productVariantList.add(ProductVariant(tempList, type));
      }

      return productVariantList;
    } on ApiException catch (ex) {
      throw ApiException(ex.message);
    }
  }
}
