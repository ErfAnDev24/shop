import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/widgets/CartItem.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xffEEEEEE),
      ),
      backgroundColor: const Color(0xffEEEEEE),
      body: CustomScrollView(
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
                  child: Stack(alignment: Alignment.center, children: [
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
                  ]),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            sliver: SliverList.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return CartItem();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: 380,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomeColors.green,
            ),
            child: const Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تومان',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'vazir', fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '3218000000',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'digits', fontSize: 25),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
