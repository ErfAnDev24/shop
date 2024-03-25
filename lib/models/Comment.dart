class Comment {
  String collectionId;
  String avatar;
  String id;
  String product_id;
  String text;
  String name;

  Comment(this.collectionId, this.avatar, this.id, this.name, this.product_id,
      this.text);

  factory Comment.buildFromJsonObject(Map<String, dynamic> jsonObject) {
    return Comment(
        jsonObject['expand']['user_id']['collectionId'],
        jsonObject['expand']['user_id']['avatar'],
        jsonObject['expand']['user_id']['id'],
        jsonObject['product_id'],
        jsonObject['text'],
        jsonObject['expand']['user_id']['name']);
  }
}
