class ProductDetailsEvent {}

class RequestProductDetailsEvent extends ProductDetailsEvent {
  String product_id;
  RequestProductDetailsEvent(this.product_id);
}
