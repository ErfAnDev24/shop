import 'package:digikala/bloc/cartScreenBloc/CartBloc.dart';
import 'package:digikala/bloc/cartScreenBloc/CartEvent.dart';
import 'package:digikala/bloc/cartScreenBloc/CartState.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/util/StringExtention.dart';
import 'package:digikala/util/extentions.dart';
import 'package:digikala/widgets/CartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int totalAmount = 0;
  @override
  void initState() {
    BlocProvider.of<CartBloc>(context).add(RequestCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xffEEEEEE),
      ),
      backgroundColor: const Color(0xffEEEEEE),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadingState) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (state is ResponseCartState) {
            totalAmount = state.totalAmount;

            return state.selectedCartItemList.fold(
              (left) => Text(left),
              (right) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          width: 360,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 0,
                                  child: Image(
                                    image: AssetImage('images/appleLogo.png'),
                                  ),
                                ),
                                Text(
                                  'سبد خرید',
                                  style: TextStyle(
                                      color: CustomeColors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'vazir'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      sliver: SliverList.builder(
                        itemCount: right.length,
                        itemBuilder: (context, index) {
                          return CartItem(
                            selectedCartItem: right[index],
                            seletedIndex: index,
                          );
                        },
                      ),
                    ),
                    const SliverPadding(
                      padding: EdgeInsets.only(bottom: 90),
                    ),
                  ],
                );
              },
            );
          }

          return const Text('data');
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: GestureDetector(
          onTap: () {
            //BlocProvider.of<CartBloc>(context).add(InitPaymentRequestEvent()); //zarinpal is off

            //BlocProvider.of<CartBloc>(context).add(SendPaymentRequestEvent()); //zarinpal is off
          },
          child: Container(
            width: 380,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomeColors.green,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'تومان',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'vazir', fontSize: 18),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    totalAmount == 0 ? '0' : '${totalAmount.convertToPrice()}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'digits',
                        fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String? extractValueFromQuery(String url, String key) {
  int queryStartIndex = url.indexOf('?');
  if (queryStartIndex == -1) return null;

  String query = url.substring(queryStartIndex + 1);

  List<String> pairs = query.split('&');

  for (String pair in pairs) {
    List<String> keyValue = pair.split('=');
    if (keyValue.length == 2) {
      String currenyKey = keyValue[0];
      String value = keyValue[1];

      if (currenyKey == key) {
        return Uri.decodeComponent(value);
      }
    }
  }
}
