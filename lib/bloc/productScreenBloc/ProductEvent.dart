class ProductEvent {}

class ProductRequestEvent extends ProductEvent {
  String categoryId;
  ProductRequestEvent(this.categoryId);
}
