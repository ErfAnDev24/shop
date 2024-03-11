import 'package:cached_network_image/cached_network_image.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/models/Product.dart';
import 'package:flutter/material.dart';

class SellItem extends StatelessWidget {
  Product product;

  SellItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Container(
                  width: 75,
                  height: 98,
                  child: CachedNetworkImage(imageUrl: product.imageURL),
                ),
              ),
              Positioned(
                left: 7,
                child: Container(
                  width: 25,
                  height: 15,
                  decoration: BoxDecoration(
                    color: CustomeColors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      '%4',
                      style: TextStyle(fontSize: 10, color: Colors.white),
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
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: SizedBox(
              width: double.infinity,
              height: 30,
              child: Text(
                product.name,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
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
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      '\$',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${product.discount_price}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${product.price}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Transform.scale(
                      scale: 1.2,
                      child: const Image(
                        image: AssetImage('images/arrowRight.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
