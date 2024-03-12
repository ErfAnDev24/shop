import 'package:digikala/models/Product.dart';
import 'package:digikala/widgets/ProductItem.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  List<Product> productList;
  ProductList({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: SizedBox(
          height: 220,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (productList.length),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15, bottom: 20),
                  child: ProductItem(product: productList[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
