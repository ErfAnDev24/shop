import 'package:digikala/constants/CustomColors.dart';
import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: ShapeDecoration(
                  shadows: const [
                    BoxShadow(
                      blurRadius: 15,
                      color: CustomeColors.blue,
                      spreadRadius: -4,
                      offset: Offset(0, 8),
                    ),
                  ],
                  color: CustomeColors.blue,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              const Image(
                image: AssetImage('images/sampleIcon.png'),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'خروج از حساب',
            style: TextStyle(fontSize: 13, fontFamily: 'vazir'),
          ),
        ],
      ),
    );
  }
}
