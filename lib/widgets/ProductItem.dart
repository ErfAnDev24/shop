import 'package:cached_network_image/cached_network_image.dart';
import 'package:digikala/bloc/cartScreenBloc/CartBloc.dart';
import 'package:digikala/bloc/productDetailsBloc/ProductDetailsBloc.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/Product.dart';
import 'package:digikala/screens/ProductDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  Product product;

  ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String price = (product.price - product.discount_price).toString();
    String off = (100 -
            (((product.price - product.discount_price) / product.price) * 100)
                .round())
        .toString();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return BlocProvider.value(
                value: locator.get<CartBloc>(),
                child: ProductDetailsScreen(product: product),
              );
            },
          ),
        );
      },
      child: Container(
        height: 210,
        width: 150,
        decoration: BoxDecoration(boxShadow: [
          const BoxShadow(
              color: CustomeColors.blue,
              blurRadius: 12,
              spreadRadius: -12,
              offset: Offset(0, 18)),
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 105,
                ),
                Positioned(
                  top: 10,
                  child: SizedBox(
                    width: 75,
                    height: 98,
                    child: CachedNetworkImage(imageUrl: product.imageURL),
                  ),
                ),
                Positioned(
                  left: 7,
                  child: Container(
                    width: 30,
                    height: 20,
                    decoration: BoxDecoration(
                      color: CustomeColors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '%${off}',
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'digits'),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 7,
                  right: 8,
                  child: SizedBox(
                    width: 18,
                    height: 20,
                    child: Center(
                      child: Image(
                        image: AssetImage('images/like.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 10),
              child: SizedBox(
                width: double.infinity,
                height: 30,
                child: Text(
                  product.name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'vazir'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: CustomeColors.blue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Transform.scale(
                        scale: 1.2,
                        child: const Image(
                          image: AssetImage('images/arrowRight.png'),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${product.price}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              decoration: TextDecoration.lineThrough,
                              fontFamily: 'digits'),
                        ),
                        Text(
                          '${price}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'digits'),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'تومان',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontFamily: 'vazir'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
