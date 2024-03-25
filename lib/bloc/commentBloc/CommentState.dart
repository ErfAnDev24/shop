import 'package:digikala/models/Comment.dart';
import 'package:either_dart/either.dart';

class CommentState {}

class CommentLoadingState extends CommentState {}

class CommentResponseState extends CommentState {
  Either<String, List<Comment>> commentList;
  CommentResponseState(this.commentList);
}
