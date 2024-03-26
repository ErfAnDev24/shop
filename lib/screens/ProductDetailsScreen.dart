import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digikala/bloc/cartScreenBloc/CartBloc.dart';
import 'package:digikala/bloc/cartScreenBloc/CartEvent.dart';
import 'package:digikala/bloc/commentBloc/CommentBloc.dart';
import 'package:digikala/bloc/commentBloc/CommentEvent.dart';

import 'package:digikala/bloc/productDetailsBloc/ProductDetailsBloc.dart';
import 'package:digikala/bloc/productDetailsBloc/ProductDetailsEvent.dart';
import 'package:digikala/bloc/productDetailsBloc/ProductDetailsState.dart';
import 'package:digikala/constants/CustomColors.dart';

import 'package:digikala/models/Product.dart';
import 'package:digikala/screens/CommentScreen.dart';
import 'package:digikala/widgets/Description.dart';
import 'package:digikala/widgets/PropertyList.dart';
import 'package:digikala/widgets/VariantComponentGenerator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  Product product;

  ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedIndex = 0;

  var commentTextFieldController = TextEditingController();

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = ProductDetailsBloc();
        bloc.add(RequestProductDetailsEvent(
            'at0y1gm0t65j62j', widget.product.category));
        return bloc;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffEEEEEE),
        appBar: AppBar(
          backgroundColor: const Color(0xffEEEEEE),
          toolbarHeight: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
            builder: (context, state) {
              if (state is LoadingProductDetailsState) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: LoadingIndicator(
                        colors: [CustomeColors.blue],
                        indicatorType: Indicator.ballRotateChase,
                      ),
                    ),
                  ),
                );
              } else if (state is ResponseProductDetailsState) {
                return CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        width: double.infinity,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        width: 350,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Image(
                                image: AssetImage('images/appleLogo.png'),
                              ),
                            ),
                            state.category.fold(
                              (left) => Text(left),
                              (right) => Text(
                                right.title,
                                style: const TextStyle(
                                    fontFamily: 'vazir',
                                    color: CustomeColors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Image(
                                image: AssetImage('images/goInBlack.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 15,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Text(
                        textAlign: TextAlign.center,
                        '${widget.product.name}',
                        style: const TextStyle(
                            fontFamily: 'vazir',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 15,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        width: 350,
                        height: 240,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: state.productImageList.fold(
                          (left) => Text(left),
                          (right) {
                            return Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 15),
                                      child: Image(
                                        image: AssetImage('images/start.png'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 5),
                                      child: Text(
                                        '4.6',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'digits'),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, right: 10),
                                      child: SizedBox(
                                        width: 110,
                                        height: 110,
                                        child: CachedNetworkImage(
                                            imageUrl: right.isNotEmpty
                                                ? right[selectedIndex].imgaeURL
                                                : widget.product.imageURL),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, right: 20),
                                      child: Image(
                                        image: AssetImage('images/like.png'),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 70,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          right.isNotEmpty ? right.length : 1,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedIndex = index;
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                border: selectedIndex == index
                                                    ? Border.all(
                                                        width: 2,
                                                        color:
                                                            CustomeColors.blue)
                                                    : Border.all(
                                                        width: 1,
                                                        color:
                                                            CustomeColors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: CachedNetworkImage(
                                                    imageUrl: right.isNotEmpty
                                                        ? right[index].imgaeURL
                                                        : widget
                                                            .product.imageURL),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    state.productVariantList.fold(
                      (left) => SliverToBoxAdapter(
                        child: Text(left),
                      ),
                      (right) {
                        return SliverToBoxAdapter(
                          child: VariantComponentGenerator(
                              productVariantList: right),
                        );
                      },
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 15,
                      ),
                    ),
                    const PropertyList(),
                    Description(
                      description: widget.product.description,
                    ),
                    SliverToBoxAdapter(
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isDismissible: true,
                            isScrollControlled: true,
                            showDragHandle: true,
                            useSafeArea: true,
                            builder: (context) {
                              return SizedBox(
                                width: double.infinity,
                                height: 700,
                                child: BlocProvider(
                                  create: (context) {
                                    var bloc = CommentBloc();
                                    bloc.add(
                                      RequestCommentEvent(widget.product.id),
                                    );
                                    return bloc;
                                  },
                                  child: CommentScreen(product: widget.product),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 350,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(width: 2, color: CustomeColors.grey),
                          ),
                          child: const Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Text(
                                    'نظرات کاربران : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'vazir'),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'مشاهده',
                                  style: TextStyle(
                                      color: CustomeColors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'vazir'),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 10),
                                  child: Image(
                                    image: AssetImage('images/goIn.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: CustomeColors.green,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                              ),
                              Container(
                                width: 170,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: CustomeColors.green,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 20, sigmaY: 20),
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(left: 8),
                                              child: Text(
                                                'تومان',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'vazir',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '17800000',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'digits',
                                                    color: Colors.white,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                                Text(
                                                  '17800000',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'digits',
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: 30,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: CustomeColors.red,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  '%4',
                                                  style: TextStyle(
                                                      fontFamily: 'digits',
                                                      fontSize: 13,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<CartBloc>(context)
                                  .add(AddProductToCart(widget.product));

                              BlocProvider.of<CartBloc>(context)
                                  .add(RequestCartEvent());
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: CustomeColors.blue,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 170,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: CustomeColors.blue,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 20, sigmaY: 20),
                                        child: Container(
                                          color: Colors.transparent,
                                          child: const Center(
                                            child: Text(
                                              'افزودن به سبد خرید',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'vazir',
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return const Text('error');
            },
          ),
        ),
      ),
    );
  }
}
