import 'package:digikala/models/SelectedCartItem.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:hive_flutter/adapters.dart';

abstract class ICartDatasource {
  List<SelectedCartItem> selectedCartItemList();

  Future<void> addSelectedCartItem(SelectedCartItem selectedCartItem);
}

class CartDatasourceImpl extends ICartDatasource {
  var box = Hive.box<SelectedCartItem>('cartItems');

  @override
  List<SelectedCartItem> selectedCartItemList() {
    try {
      List<SelectedCartItem> itemList = box.values.toList();

      return itemList;
    } catch (ex) {
      throw ApiException('error in getting cartItems');
    }
  }

  @override
  Future<void> addSelectedCartItem(SelectedCartItem selectedCartItem) async {
    try {
      await box.add(selectedCartItem);
    } catch (ex) {
      throw ApiException('error in adding selectedCartItem to Box');
    }
  }
}
