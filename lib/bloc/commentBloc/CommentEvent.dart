class CommentEvent {}

class RequestCommentEvent extends CommentEvent {
  String productId;
  RequestCommentEvent(this.productId);
}
