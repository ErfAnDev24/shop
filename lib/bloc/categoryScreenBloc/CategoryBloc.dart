import 'package:digikala/bloc/categoryScreenBloc/CategoryEvent.dart';
import 'package:digikala/bloc/categoryScreenBloc/CategoryState.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/repository/CategoryRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final repository = locator.get<ICategoryRepository>();

  CategoryBloc() : super(LoadingCategoryState()) {
    on<LoadingCategoryEvent>(
      (event, emit) async {
        var response = await repository.getCategoryList();
        emit(
          ResponseCategoryState(response),
        );
      },
    );
  }
}
