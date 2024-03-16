import 'package:digikala/enums/VariantTypeEnum.dart';
import 'package:digikala/models/ProductVariant.dart';
import 'package:digikala/widgets/SelectColorWidget.dart';
import 'package:digikala/widgets/SelectLocalStorageWidget.dart';
import 'package:flutter/material.dart';

class VariantGeneratorChild extends StatelessWidget {
  ProductVariant productVariant;
  VariantGeneratorChild({super.key, required this.productVariant});

  @override
  Widget build(BuildContext context) {
    if (productVariant.variantType.type == VariantTypeEnum.color) {
      return SelectColorWidget(
        productVariant: productVariant,
      );
    } else if (productVariant.variantType.type == VariantTypeEnum.storage) {
      return SelectLocalStorageWidget(
        productVariant: productVariant,
      );
    } else {
      return const Text('data');
    }
  }
}
