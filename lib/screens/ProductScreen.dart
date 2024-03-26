import 'package:digikala/bloc/productScreenBloc/ProductBloc.dart';
import 'package:digikala/bloc/productScreenBloc/ProductEvent.dart';
import 'package:digikala/bloc/productScreenBloc/ProductState.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/widgets/ProductItem.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  String categoryId;
  String categoryName;
  ProductScreen(
      {super.key, required this.categoryId, required this.categoryName});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context)
        .add(ProductRequestEvent(widget.categoryId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEEEEEE),
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: const Color(0xffEEEEEE),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else if (state is ProductResponseState) {
              return state.productList.fold(
                (left) => Text(left),
                (right) => CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          width: 320,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Image(
                                    image: AssetImage('images/productIcon.png'),
                                  ),
                                  Text(
                                    '${widget.categoryName}',
                                    style: const TextStyle(
                                        color: CustomeColors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'vazir'),
                                  ),
                                  const Image(
                                    image: AssetImage('images/goInBlack.png'),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(25),
                      sliver: SliverGrid.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 210,
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemBuilder: (context, index) {
                          return Directionality(
                              textDirection: TextDirection.rtl,
                              child: ProductItem(product: right[index]));
                        },
                        itemCount: right.length,
                      ),
                    ),
                  ],
                ),
              );
            }

            return const Text('error');
          },
        ));
  }
}
