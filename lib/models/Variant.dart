class Variant {
  String id;
  int price_change;
  String product_id;
  String type_id;
  String value;

  Variant(
      this.id, this.price_change, this.product_id, this.type_id, this.value);

  factory Variant.buildFromJsonObject(Map<String, dynamic> jsonObject) {
    return Variant(jsonObject['id'], jsonObject['price_change'],
        jsonObject['product_id'], jsonObject['type_id'], jsonObject['value']);
  }
}
