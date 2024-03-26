class Comment {
  String collectionId;
  String avatar;
  String id;
  String product_id;
  String text;
  String username;
  String imageURL;

  Comment(this.collectionId, this.avatar, this.id, this.product_id, this.text,
      this.username, this.imageURL);

  factory Comment.buildFromJsonObject(Map<String, dynamic> jsonObject) {
    return Comment(
        jsonObject['expand']['user_id']['collectionId'],
        jsonObject['expand']['user_id']['avatar'],
        jsonObject['expand']['user_id']['id'],
        jsonObject['product_id'],
        jsonObject['text'],
        jsonObject['expand']['user_id']['username'],
        'http://startflutter.ir/api/files/${jsonObject['expand']['user_id']['collectionId']}/${jsonObject['expand']['user_id']['id']}/${jsonObject['expand']['user_id']['avatar']}');
  }
}
