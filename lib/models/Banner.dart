class Banner {
  String? categoryId;
  String? collectionId;
  String? id;
  String? imageURL;

  Banner(this.categoryId, this.collectionId, this.id, this.imageURL);

  factory Banner.buildFromJsonObject(Map<String, dynamic> jsonObject) {
    return Banner(
        jsonObject['categoryId'],
        jsonObject['collectionId'],
        jsonObject['id'],
        'http://startfultter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}');
  }
}
