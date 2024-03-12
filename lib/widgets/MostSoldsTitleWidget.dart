import 'package:digikala/constants/CustomColors.dart';
import 'package:flutter/material.dart';

class MostSoldsTitleWidget extends StatelessWidget {
  const MostSoldsTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
              'پر فروش ترین ها',
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
