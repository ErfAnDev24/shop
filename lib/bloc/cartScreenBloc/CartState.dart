import 'package:digikala/models/SelectedCartItem.dart';
import 'package:either_dart/either.dart';

class CartState {}

class CartLoadingState extends CartState {}

class ResponseCartState extends CartState {
  Either<String, List<SelectedCartItem>> selectedCartItemList;
  int totalAmount;
  ResponseCartState(this.selectedCartItemList,this.totalAmount);
}
