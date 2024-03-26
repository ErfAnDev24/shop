import 'package:digikala/models/Product.dart';
import 'package:digikala/models/SelectedCartItem.dart';

class CartEvent {}

class RequestCartEvent extends CartEvent {}

class AddProductToCart extends CartEvent {
  Product product;
  AddProductToCart(this.product);
}

class InitPaymentRequestEvent extends CartEvent {}

class SendPaymentRequestEvent extends CartEvent {}

class DeleteFromCartEvent extends CartEvent {
  int index;
  DeleteFromCartEvent(this.index);
}
