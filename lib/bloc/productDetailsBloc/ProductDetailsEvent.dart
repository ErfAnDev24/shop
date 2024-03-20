class ProductDetailsEvent {}

class RequestProductDetailsEvent extends ProductDetailsEvent {
  String product_id;
  String categoryId;
  RequestProductDetailsEvent(this.product_id, this.categoryId);
}
