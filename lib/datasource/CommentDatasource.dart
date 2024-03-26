import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/Comment.dart';
import 'package:digikala/util/ApiException.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICommentDatasource {
  Future<List<Comment>> commentList(String productId);
  Future<String> addComment(String comment, String productId);
}

class CommentDatasourceImpl extends ICommentDatasource {
  final dio = locator.get<Dio>();
  final sharedPref = locator.get<SharedPreferences>();

  @override
  Future<List<Comment>> commentList(String productId) async {
    try {
      Map<String, String> qParams = {
        'filter': 'product_id="$productId"',
        'expand': 'user_id',
        'perPage': '500'
      };

      var response = await dio.get('collections/comment/records',
          queryParameters: qParams);
      var jsonObjectList = response.data['items'];
      List<Comment> commentList = jsonObjectList
          .map<Comment>((jsonObject) => Comment.buildFromJsonObject(jsonObject))
          .toList();

      commentList = commentList
          .where((element) => element.text != '' && element.username != '')
          .toList();

      return commentList;
    } catch (ex) {
      throw ApiException('error in getting comments');
    }
  }

  @override
  Future<String> addComment(String comment, String productId) async {
    String? user_id = sharedPref.getString('user_id');
    try {
      var response = await dio.post('collections/comment/records',
          data: {'text': comment, 'user_id': user_id, 'product_id': productId});

      if (response.statusCode == 200) {
        return 'نظر شما با موفقیت ثبت گردید';
      } else {
        return 'خطا در ثبت نظر';
      }
    } catch (ex) {
      throw ApiException(ex.toString());
    }
  }
}
