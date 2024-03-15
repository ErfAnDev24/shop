class ProductImage {
  String collectionId;
  String id;
  String product_id;
  String imgaeURL;

  ProductImage(this.collectionId, this.id, this.product_id, this.imgaeURL);

  factory ProductImage.buildFromJsonObject(Map<String, dynamic> jsonObject) {
    return ProductImage(
        jsonObject['collectionId'],
        jsonObject['id'],
        jsonObject['product_id'],
        'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['image']}');
  }
}
