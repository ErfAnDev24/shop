import 'package:digikala/datasource/ProductDatasource.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/Category.dart';
import 'package:digikala/models/Product.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:either_dart/either.dart';

abstract class IProductRepository {
  Future<Either<String, List<Product>>> productList();

  Future<Either<String, List<Product>>> bestSellerList();

  Future<Either<String, List<Product>>> mostViewedList();

  Future<Either<String, List<Product>>> productListByCategoryId(
      String categortyId);
  Future<Either<String, Category>> category(String categoryId);
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

  @override
  Future<Either<String, List<Product>>> bestSellerList() async {
    try {
      var response = await datasource.bestSellerList();
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }

  @override
  Future<Either<String, List<Product>>> mostViewedList() async {
    try {
      var response = await datasource.mostViewedList();
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }

  @override
  Future<Either<String, List<Product>>> productListByCategoryId(
      String categortyId) async {
    try {
      var response = await datasource.productListByCategoryId(categortyId);
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }

  @override
  Future<Either<String, Category>> category(String categoryId) async {
    try {
      var response = await datasource.category(categoryId);
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }
}
