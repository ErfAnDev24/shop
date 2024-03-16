import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digikala/bloc/productDetailsBloc/ProductDetailsBloc.dart';
import 'package:digikala/bloc/productDetailsBloc/ProductDetailsEvent.dart';
import 'package:digikala/bloc/productDetailsBloc/ProductDetailsState.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/models/Product.dart';
import 'package:digikala/widgets/SelectColorWidget.dart';
import 'package:digikala/widgets/SelectLocalStorageWidget.dart';
import 'package:digikala/widgets/VariantComponentGenerator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  Product product;

  ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    BlocProvider.of<ProductDetailsBloc>(context)
        .add(RequestProductDetailsEvent('at0y1gm0t65j62j'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      appBar: AppBar(
        backgroundColor: const Color(0xffEEEEEE),
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Container(
            width: 350,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Image(
                    image: AssetImage('images/appleLogo.png'),
                  ),
                ),
                Text(
                  'آیفون',
                  style: TextStyle(
                      fontFamily: 'vazir',
                      color: CustomeColors.blue,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Image(
                    image: AssetImage('images/goInBlack.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            '${widget.product.name}',
            style: const TextStyle(
                fontFamily: 'vazir', fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 350,
            height: 240,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
              builder: (context, state) {
                if (state is LoadingProductDetailsState) {
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
                } else if (state is ResponseProductDetailsState) {
                  return state.productImageList.fold((left) => Text(left),
                      (right) {
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10, left: 15),
                              child: Image(
                                image: AssetImage('images/start.png'),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, left: 5),
                              child: Text(
                                '4.6',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'digits'),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, right: 10),
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
                              padding: EdgeInsets.only(top: 10, right: 20),
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
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: right.isNotEmpty ? right.length : 1,
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
                                        border: Border.all(
                                            width: 1,
                                            color: CustomeColors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: CachedNetworkImage(
                                            imageUrl: right.isNotEmpty
                                                ? right[index].imgaeURL
                                                : widget.product.imageURL),
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
                  });
                }

                return const Text('error');
              },
            ),
          ),
          BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
            builder: (context, state) {
              if (state is LoadingProductDetailsState) {
                const Center(
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
              } else if (state is ResponseProductDetailsState) {
                return state.productVariantList.fold((left) => Text(left),
                    (right) {
                  return VariantComponentGenerator(productVariantList: right);
                });
              }
              return const Text('error');
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 350,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2, color: CustomeColors.grey),
            ),
            child: const Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Text(
                      'مشخصات فنی : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'vazir'),
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
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 350,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2, color: CustomeColors.grey),
            ),
            child: const Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Text(
                      'توضیحات محصول : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'vazir'),
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
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 350,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2, color: CustomeColors.grey),
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
                          fontWeight: FontWeight.bold, fontFamily: 'vazir'),
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
          const SizedBox(
            height: 20,
          ),
          Row(
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
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'تومان',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'vazir',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '17800000',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'digits',
                                        color: Colors.white,
                                        decoration: TextDecoration.lineThrough,
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
                                    borderRadius: BorderRadius.circular(8),
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
              Column(
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
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
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
            ],
          ),
        ],
      ),
    );
  }
}
