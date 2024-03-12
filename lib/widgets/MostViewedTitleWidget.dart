import 'package:digikala/constants/CustomColors.dart';
import 'package:flutter/material.dart';

class MostViewedTitleWidget extends StatelessWidget {
  const MostViewedTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Image(
                image: AssetImage('images/goIn.png'),
              ),
            ),
            Text(
              'مشاهده همه',
              style: TextStyle(
                  color: CustomeColors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'vazir'),
            ),
            Spacer(),
            Text(
              'پر بازدید ترین ها',
              style: TextStyle(
                  color: CustomeColors.grey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'vazir'),
            ),
          ],
        ),
      ),
    );
  }
}
