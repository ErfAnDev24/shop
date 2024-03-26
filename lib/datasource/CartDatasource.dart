import 'package:digikala/models/SelectedCartItem.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:hive_flutter/adapters.dart';

abstract class ICartDatasource {
  List<SelectedCartItem> selectedCartItemList();

  Future<void> addSelectedCartItem(SelectedCartItem selectedCartItem);

  Future<void> deleteFromCart(int index);

  Future<int> totalAmount();
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

  @override
  Future<void> deleteFromCart(int index) async {
    try {
      await box.deleteAt(index);
    } catch (ex) {
      throw ApiException('error in deleting selectedCartItem from Box');
    }
  }

  @override
  Future<int> totalAmount() async {
    try {
      List<SelectedCartItem> selectedCartItemList = await box.values.toList();
      int totalAmount = selectedCartItemList.fold(0,
          (previousValue, element) => previousValue + int.parse(element.price));
      return totalAmount;
    } catch (ex) {
      throw ApiException('error in adding selectedCartItem to Box');
    }
  }
}
