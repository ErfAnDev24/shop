import 'package:cached_network_image/cached_network_image.dart';
import 'package:digikala/models/Category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.category});

  Category category;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: category.image,
      fit: BoxFit.cover,
      placeholder: (context, url) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
        );
      },
      errorListener: (value) {
        Container(
          color: Colors.red,
        );
      },
    );
  }
}
