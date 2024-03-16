import 'package:digikala/models/ProductImage.dart';
import 'package:digikala/models/ProductVariant.dart';
import 'package:either_dart/either.dart';

abstract class ProductDetailsState {}

class LoadingProductDetailsState extends ProductDetailsState {}

class ResponseProductDetailsState extends ProductDetailsState {
  Either<String, List<ProductImage>> productImageList;
  Either<String, List<ProductVariant>> productVariantList;

  ResponseProductDetailsState(this.productImageList, this.productVariantList);
}
