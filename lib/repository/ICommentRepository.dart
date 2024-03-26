import 'package:digikala/datasource/CommentDatasource.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/Comment.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:either_dart/either.dart';

abstract class ICommentRepository {
  Future<Either<String, List<Comment>>> commentList(String productId);
  Future<Either<String, String>> addComment(String comment, String productId);
}

class CommentRepositoryImpl extends ICommentRepository {
  final datasource = locator.get<ICommentDatasource>();

  @override
  Future<Either<String, List<Comment>>> commentList(String productId) async {
    try {
      var response = await datasource.commentList(productId);

      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }

  @override
  Future<Either<String, String>> addComment(
      String comment, String productId) async {
    try {
      var response = await datasource.addComment(comment, productId);
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message);
    }
  }
}
