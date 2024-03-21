import 'package:digikala/bloc/productScreenBloc/ProductEvent.dart';
import 'package:digikala/bloc/productScreenBloc/ProductState.dart';
import 'package:digikala/datasource/ProductDatasource.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/Category.dart';
import 'package:digikala/repository/CategoryRepository.dart';
import 'package:digikala/repository/ProductDetailsRepository.dart';
import 'package:digikala/repository/ProductRepository.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final repository = locator.get<IProductRepository>();

  ProductBloc() : super(ProductLoadingState()) {
    on<ProductRequestEvent>((event, emit) async {
      var response = await repository.productListByCategoryId(event.categoryId);

      emit(ProductResponseState(response));
    });
  }
}
