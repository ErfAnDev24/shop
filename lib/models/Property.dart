class Property {
  String title;
  String productId;
  String value;

  Property(this.title, this.productId, this.value);

  factory Property.buildFromJsonObject(Map<String, dynamic> jsonObject) {
    return Property(
        jsonObject['title'], jsonObject['product_id'], jsonObject['value']);
  }
}
