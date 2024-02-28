import 'package:digikala/constants/CustomColors.dart';
import 'package:flutter/material.dart';

class SellItem extends StatefulWidget {
  const SellItem({super.key});

  @override
  State<SellItem> createState() => _SellItemState();
}

class _SellItemState extends State<SellItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 150,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
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
              Container(
                width: double.infinity,
                height: 105,
              ),
              Positioned(
                top: 10,
                child: Container(
                  width: 75,
                  height: 98,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/sampleItemForSelling.png'),
                    ),
                  ),
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
                  child: Center(
                    child: Text(
                      '%4',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 7,
                right: 8,
                child: Container(
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
            padding: EdgeInsets.only(top: 15, left: 10),
            child: Container(
              width: double.infinity,
              height: 30,
              child: Text(
                'Iphone 13 pro max',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
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
                        '710.00',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '699.99',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Transform.scale(
                      scale: 1.2,
                      child: Image(
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
