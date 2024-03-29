import 'package:digikala/bloc/cartScreenBloc/CartEvent.dart';
import 'package:digikala/bloc/cartScreenBloc/CartState.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/handler/PaymentHandler.dart';
import 'package:digikala/models/SelectedCartItem.dart';
import 'package:digikala/repository/CartRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final repository = locator.get<ICartRepository>();
  final paymentHandler = locator.get<PaymentHandler>();

  CartBloc() : super(CartLoadingState()) {
    on<RequestCartEvent>((event, emit) async {
      var response = repository.selecetedCartItemList();
      var totalAmount = await repository.totalAmount();
      emit(ResponseCartState(response, totalAmount));
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

    on<InitPaymentRequestEvent>((event, emit) {
      paymentHandler.initPaymentRequest();
      paymentHandler.verifyPaymentRequest();
    });

    on<SendPaymentRequestEvent>(
      (event, emit) {
        paymentHandler.sendPaymentRequest();
      },
    );

    on<DeleteFromCartEvent>(
      (event, emit) async {
        await repository.deleteFromCart(event.index);
        var response = repository.selecetedCartItemList();
        var totalAmount = await repository.totalAmount();
        emit(
          ResponseCartState(response, totalAmount),
        );
      },
    );
  }
}
