import 'package:digikala/models/ProductVariant.dart';
import 'package:flutter/material.dart';

class SelectColorWidget extends StatefulWidget {
  ProductVariant productVariant;
  SelectColorWidget({super.key, required this.productVariant});

  @override
  State<SelectColorWidget> createState() => _SelectColorWidgetState();
}

class _SelectColorWidgetState extends State<SelectColorWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
              child: Text(
                'انتخاب رنگ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontFamily: 'vazir'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
          width: double.infinity,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.only(right: 22),
              child: ListView.builder(
                itemCount: widget.productVariant.variantList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 30,
                    height: 25,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(
                        int.parse(
                            '0xff${widget.productVariant.variantList[index].value}'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
