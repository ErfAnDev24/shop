import 'package:digikala/datasource/ProductDetailsDatasource.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/ProductImage.dart';
import 'package:digikala/models/ProductVariant.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:either_dart/either.dart';

abstract class IProductDetailsRepository {
  Future<Either<String, List<ProductImage>>> productImageList(String productId);
  Future<Either<String, List<ProductVariant>>> productVariantList(
      String productId);
}

class ProductDetailsRepositoryImpl implements IProductDetailsRepository {
  final datasource = locator.get<IProductDetailsDatasource>();

  @override
  Future<Either<String, List<ProductImage>>> productImageList(
      String productId) async {
    try {
      var response = await datasource.productImageList(productId);
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }

  @override
  Future<Either<String, List<ProductVariant>>> productVariantList(
      String productId) async {
    try {
      var response = await datasource.productVariantList(productId);
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }
}
