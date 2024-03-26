class CommentEvent {}

class RequestCommentEvent extends CommentEvent {
  String productId;
  RequestCommentEvent(this.productId);
}

class AddCommentEvent extends CommentEvent {
  String productId;
  String comment;

  AddCommentEvent(this.productId, this.comment);
}
