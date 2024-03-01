import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/widgets/SellItem.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xffEEEEEE),
      ),
      body: CustomScrollView(
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: AssetImage('images/productIcon.png'),
                        ),
                        Text(
                          'Most Sold',
                          style: TextStyle(
                              color: CustomeColors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        Image(
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 210,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return const SellItem();
              },
              itemCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
