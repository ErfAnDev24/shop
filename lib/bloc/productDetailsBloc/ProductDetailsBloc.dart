import 'package:digikala/bloc/productDetailsBloc/ProductDetailsEvent.dart';
import 'package:digikala/bloc/productDetailsBloc/ProductDetailsState.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/repository/ProductDetailsRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final repositry = locator.get<IProductDetailsRepository>();

  ProductDetailsBloc() : super(LoadingProductDetailsState()) {
    on<RequestProductDetailsEvent>((event, emit) async {
      var productImageList = await repositry.productImageList(event.product_id);
      var productVariantList =
          await repositry.productVariantList(event.product_id);
      emit(ResponseProductDetailsState(productImageList, productVariantList));
    });
  }
}
