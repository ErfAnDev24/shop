import 'package:digikala/models/Product.dart';

class CartEvent {}

class RequestCartEvent extends CartEvent {}

class AddProductToCart extends CartEvent {
  Product product;
  AddProductToCart(this.product);
}
