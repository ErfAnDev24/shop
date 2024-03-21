import 'package:digikala/models/Category.dart';
import 'package:digikala/models/Product.dart';
import 'package:either_dart/either.dart';

class ProductState {}

class ProductLoadingState extends ProductState {}

class ProductResponseState extends ProductState {
  Either<String, List<Product>> productList;

  ProductResponseState(this.productList);
}
