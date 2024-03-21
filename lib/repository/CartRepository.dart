import 'package:digikala/datasource/CartDatasource.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/SelectedCartItem.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:either_dart/either.dart';

abstract class ICartRepository {
  Either<String, List<SelectedCartItem>> selecetedCartItemList();
  Future<Either<String, String>> addSelectedCartItem(
      SelectedCartItem selectedCartItem);
}

class CartRepositoryImpl extends ICartRepository {
  final datasource = locator.get<ICartDatasource>();

  @override
  Future<Either<String, String>> addSelectedCartItem(
      SelectedCartItem selectedCartItem) async {
    try {
      await datasource.addSelectedCartItem(selectedCartItem);
      return const Right('your selected item has been added');
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }

  @override
  Either<String, List<SelectedCartItem>> selecetedCartItemList() {
    try {
      var response = datasource.selectedCartItemList();
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }
}
