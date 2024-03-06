import 'package:digikala/models/Category.dart';
import 'package:either_dart/either.dart';

class CategoryState {}

class InitCategortyState extends CategoryState {}

class LoadingCategoryState extends CategoryState {}

class ResponseCategoryState extends CategoryState {
  final Either<String, List<Category>> categoryList;
  ResponseCategoryState(this.categoryList);
}
