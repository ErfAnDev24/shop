import 'dart:ui';

import 'package:digikala/constants/CustomColors.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
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
            width: 320,
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
                    'IPhone',
                    style: TextStyle(
                        color: CustomeColors.grey, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Image(
                      image: AssetImage('images/goInBlack.png'),
                    ),
                  ),
                ]),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'IPhone SE 2022',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 320,
            height: 230,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Image(
                        image: AssetImage('images/start.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 5),
                      child: Text(
                        '4.6',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: 20, right: 10),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image(
                          image: AssetImage('images/iphone_se.png'),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 10),
                      child: Image(
                        image: AssetImage('images/like.png'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: CustomeColors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Image(
                          image: AssetImage('images/sampleItemOne.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: CustomeColors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Image(
                            image: AssetImage('images/sampleItemTwo.png'),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: CustomeColors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Image(
                          image: AssetImage('images/iphone_se.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 42, vertical: 10),
                child: Text(
                  'Select color',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 30,
                height: 25,
                margin: const EdgeInsets.only(left: 42),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),
              Container(
                width: 30,
                height: 25,
                margin: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),
              Container(
                width: 30,
                height: 25,
                margin: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 42, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'Select internal storage',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 42,
            ),
            child: Row(
              children: [
                Container(
                  width: 75,
                  height: 30,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: CustomeColors.grey),
                  ),
                  child: const Center(
                    child: Text(
                      '128',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 75,
                  height: 30,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: CustomeColors.grey),
                  ),
                  child: const Center(
                    child: Text(
                      '256',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 75,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: CustomeColors.blue),
                  ),
                  child: const Center(
                    child: Text(
                      '512',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 320,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Technical features : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Text(
                  'Show',
                  style: TextStyle(
                      color: CustomeColors.blue, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image(
                    image: AssetImage('images/goIn.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 320,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Technical features : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Text(
                  'Show',
                  style: TextStyle(
                      color: CustomeColors.blue, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image(
                    image: AssetImage('images/goIn.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 320,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Technical features : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Text(
                  'Show',
                  style: TextStyle(
                      color: CustomeColors.blue, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image(
                    image: AssetImage('images/goIn.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
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
                    height: 60,
                    decoration: BoxDecoration(
                      color: CustomeColors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
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
                    height: 60,
                    decoration: BoxDecoration(
                      color: CustomeColors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: Container(
                            color: Colors.transparent,
                            child: const Center(
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
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
          )
        ],
      ),
    );
  }
}
