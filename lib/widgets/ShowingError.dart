import 'package:flutter/material.dart';

class ShowingError extends StatelessWidget {
  const ShowingError({super.key});
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Text(
          'خطا در واکشی اطلاعات',
          style: TextStyle(fontFamily: 'vazir'),
        ),
      ),
    );
  }
}
