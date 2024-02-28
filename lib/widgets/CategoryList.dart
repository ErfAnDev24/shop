import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: ShapeDecoration(
                          shadows: [
                            BoxShadow(
                              blurRadius: 15,
                              color: Colors.red,
                              spreadRadius: -4,
                              offset: Offset(0, 8),
                            ),
                          ],
                          color: Colors.red,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      Image(
                        image: AssetImage('images/sampleIcon.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'data',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
