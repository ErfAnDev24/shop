import 'package:digikala/datasource/ProductDatasource.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/Product.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:either_dart/either.dart';

abstract class IProductRepository {
  Future<Either<String, List<Product>>> productList();
}

class ProductRepositoryImpl implements IProductRepository {
  final datasource = locator.get<IProductDatasource>();

  @override
  Future<Either<String, List<Product>>> productList() async {
    try {
      var response = await datasource.productList();
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }
}
