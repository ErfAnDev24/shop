import 'package:cached_network_image/cached_network_image.dart';
import 'package:digikala/models/Category.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  List<Category> categoryList;

  CategoryList({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    final String colorPerfix = '0xff';

    return SizedBox(
      height: 90,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ListView.builder(
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
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
                          shadows: [
                            BoxShadow(
                              blurRadius: 15,
                              color: Color(
                                int.parse('0xff${categoryList[index].color}'),
                              ),
                              spreadRadius: -4,
                              offset: const Offset(0, 8),
                            ),
                          ],
                          color: Color(
                            int.parse('0xff${categoryList[index].color}'),
                          ),
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: CachedNetworkImage(
                            imageUrl: categoryList[index].icon),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${categoryList[index].title}',
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
