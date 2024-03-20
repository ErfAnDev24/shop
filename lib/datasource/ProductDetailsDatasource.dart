import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/Category.dart';
import 'package:digikala/models/ProductImage.dart';
import 'package:digikala/models/ProductVariant.dart';
import 'package:digikala/models/Property.dart';
import 'package:digikala/models/Variant.dart';
import 'package:digikala/models/VariantType.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:dio/dio.dart';

abstract class IProductDetailsDatasource {
  Future<List<ProductImage>> productImageList(String productId);
  Future<List<Variant>> variantList(String productId);
  Future<List<VariantType>> typeList();
  Future<List<ProductVariant>> productVariantList(String productId);
  Future<List<Property>> propertyList(String productId);
  Future<Category> category(String categoryId);
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

  @override
  Future<List<Property>> propertyList(String productId) async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="at0y1gm0t65j62j"'};
      var response = await dio.get('collections/properties/records',
          queryParameters: qParams);
      var jsonObjectList = response.data['items'];
      List<Property> propertyList = jsonObjectList
          .map<Property>(
              (jsonObject) => Property.buildFromJsonObject(jsonObject))
          .toList();

      return propertyList;
    } catch (ex) {
      throw ApiException('error in getting properties');
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
