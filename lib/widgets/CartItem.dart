import 'package:digikala/constants/CustomColors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        width: 340,
        height: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(children: [
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'آیفون 13 پرومکس بی سیم خفن عجیبنا غریبا یسبشبق',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'vazir',
                                  fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'گارنتی 18 ماه مدیا پردازش',
                                style: TextStyle(
                                    fontFamily: 'vazir',
                                    color: CustomeColors.grey,
                                    fontSize: 13),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Row(
                                children: [
                                  const Text(
                                    '45000000 تومان',
                                    style: TextStyle(
                                        fontFamily: 'digits',
                                        color: CustomeColors.grey,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 5,
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
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontFamily: 'digits'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Container(
                                    width: 75,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 2, color: CustomeColors.grey),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'صورتی',
                                            style: TextStyle(
                                                fontFamily: 'vazir',
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              color: Colors.pink,
                                              shape: BoxShape.circle,
                                            ),
                                          )
                                        ]),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 85,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: CustomeColors.red),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Transform.scale(
                                            scale: 1.3,
                                            child: const Image(
                                              image: AssetImage(
                                                  'images/delete.png'),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'حذف',
                                          style: TextStyle(fontFamily: 'vazir'),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: SizedBox(
                      width: 80,
                      height: 120,
                      child: Image(image: AssetImage('images/iphone_se.png')),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: DottedLine(
                  dashGapLength: 4,
                  dashColor: CustomeColors.grey,
                  dashLength: 10),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'تومان',
                      style: TextStyle(
                          fontFamily: 'vazir',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '450000000',
                      style: TextStyle(fontFamily: 'digits', fontSize: 20),
                    ),
                  ],
                )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
