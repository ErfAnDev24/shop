import 'package:cached_network_image/cached_network_image.dart';
import 'package:digikala/bloc/productScreenBloc/ProductBloc.dart';
import 'package:digikala/models/Category.dart';
import 'package:digikala/screens/ProductScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryList extends StatelessWidget {
  List<Category> categoryList;

  CategoryList({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SizedBox(
          height: 90,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                itemCount: categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => ProductBloc(),
                            child: ProductScreen(
                              categoryId: categoryList[index].id,
                              categoryName: categoryList[index].title,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Padding(
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
                                        int.parse(
                                            '0xff${categoryList[index].color}'),
                                      ),
                                      spreadRadius: -4,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                  color: Color(
                                    int.parse(
                                        '0xff${categoryList[index].color}'),
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
                            height: 12,
                          ),
                          Text(
                            '${categoryList[index].title}',
                            style: const TextStyle(
                                fontSize: 13,
                                fontFamily: 'vazir',
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 79, 79, 79)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
