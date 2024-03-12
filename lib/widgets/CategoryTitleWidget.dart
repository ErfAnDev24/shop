import 'package:digikala/constants/CustomColors.dart';
import 'package:flutter/material.dart';

class CategoryTitleWidget extends StatelessWidget {
  const CategoryTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 20, bottom: 15, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'دسته بندی',
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
