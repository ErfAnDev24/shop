import 'package:digikala/enums/VariantTypeEnum.dart';
import 'package:digikala/models/ProductVariant.dart';
import 'package:digikala/widgets/SelectColorWidget.dart';
import 'package:digikala/widgets/VariantGeneratorChild.dart';
import 'package:flutter/material.dart';

class VariantComponentGenerator extends StatefulWidget {
  List<ProductVariant> productVariantList;
  VariantComponentGenerator({super.key, required this.productVariantList});

  @override
  State<VariantComponentGenerator> createState() =>
      _VariantComponentGeneratorState();
}

class _VariantComponentGeneratorState extends State<VariantComponentGenerator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var element in widget.productVariantList) ...{
          if (element.variantList.isNotEmpty) ...{
            VariantGeneratorChild(productVariant: element),
          }
        }
      ],
    );
  }
}
