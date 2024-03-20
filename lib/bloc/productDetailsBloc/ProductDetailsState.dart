import 'package:digikala/models/Category.dart';
import 'package:digikala/models/ProductImage.dart';
import 'package:digikala/models/ProductVariant.dart';
import 'package:digikala/models/Property.dart';
import 'package:either_dart/either.dart';

abstract class ProductDetailsState {}

class LoadingProductDetailsState extends ProductDetailsState {}

class ResponseProductDetailsState extends ProductDetailsState {
  Either<String, List<ProductImage>> productImageList;
  Either<String, List<ProductVariant>> productVariantList;
  Either<String, List<Property>> propertyList;
  Either<String, Category> category;
  ResponseProductDetailsState(this.productImageList, this.productVariantList,
      this.propertyList, this.category);
}
