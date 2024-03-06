import 'package:digikala/datasource/CategoryDatasource.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/Category.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:either_dart/either.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Category>>> getCategoryList();
}

class CategoryRepositoryImpl implements ICategoryRepository {
  final datasource = locator.get<ICategoryDatasource>();

  @override
  Future<Either<String, List<Category>>> getCategoryList() async {
    try {
      var response = await datasource.getCategoryList();

      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }
}
