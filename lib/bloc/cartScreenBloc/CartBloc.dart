import 'package:digikala/bloc/cartScreenBloc/CartEvent.dart';
import 'package:digikala/bloc/cartScreenBloc/CartState.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/SelectedCartItem.dart';
import 'package:digikala/repository/CartRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final repository = locator.get<ICartRepository>();

  CartBloc() : super(CartLoadingState()) {
    on<RequestCartEvent>((event, emit) {
      var response = repository.selecetedCartItemList();
      emit(ResponseCartState(response));
    });

    on<AddProductToCart>((event, emit) {
      String price =
          (event.product.price - event.product.discount_price).toString();
      String off = (100 -
              (((event.product.price - event.product.discount_price) /
                          event.product.price) *
                      100)
                  .round())
          .toString();
      SelectedCartItem selectedCartItem = SelectedCartItem(
          event.product.name,
          event.product.discount_price.toString(),
          off,
          price,
          event.product.price.toString(),
          event.product.imageURL);
      repository.addSelectedCartItem(selectedCartItem);
    });
  }
}
