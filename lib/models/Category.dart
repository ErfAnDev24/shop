class Category {
  String collectionId;

  String color;

  String icon;

  String id;

  String image;

  String title;

  Category(this.collectionId, this.color, this.icon, this.id, this.image,
      this.title);

  factory Category.buildObjectFromJson(Map<String, dynamic> jsonObject) {
    return Category(
        jsonObject['collectionId'],
        jsonObject['color'],
        'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['icon']}',
        jsonObject['id'],
        'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
        jsonObject['title']);
  }
}
