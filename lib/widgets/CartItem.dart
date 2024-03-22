import 'package:cached_network_image/cached_network_image.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/models/SelectedCartItem.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  SelectedCartItem selectedCartItem;

  CartItem({super.key, required this.selectedCartItem});

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
                            Text(
                              '${widget.selectedCartItem.name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
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
                                  Text(
                                    '${widget.selectedCartItem.realPrice} تومان',
                                    style: const TextStyle(
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
                                    child: Center(
                                      child: Text(
                                        '%${widget.selectedCartItem.percent}',
                                        style: const TextStyle(
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
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      width: 80,
                      height: 120,
                      child: CachedNetworkImage(
                          imageUrl: widget.selectedCartItem.imageURL),
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
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'تومان',
                      style: TextStyle(
                          fontFamily: 'vazir',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${widget.selectedCartItem.price}',
                      style:
                          const TextStyle(fontFamily: 'digits', fontSize: 20),
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
