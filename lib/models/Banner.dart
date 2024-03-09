class HomeBanner {
  String categoryId;
  String collectionId;
  String id;
  String imageURL;

  HomeBanner(this.categoryId, this.collectionId, this.id, this.imageURL);

  factory HomeBanner.buildFromJsonObject(Map<String, dynamic> jsonObject) {
    return HomeBanner(
      jsonObject['categoryId'],
      jsonObject['collectionId'],
      jsonObject['id'],
      'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
    );
  }
}
