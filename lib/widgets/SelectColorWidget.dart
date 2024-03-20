import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/models/ProductVariant.dart';
import 'package:flutter/material.dart';

class SelectColorWidget extends StatefulWidget {
  ProductVariant productVariant;

  SelectColorWidget({super.key, required this.productVariant});

  @override
  State<SelectColorWidget> createState() => _SelectColorWidgetState();
}

class _SelectColorWidgetState extends State<SelectColorWidget> {
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Text(
                'انتخاب رنگ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontFamily: 'vazir'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 35,
          width: double.infinity,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.only(right: 2),
              child: ListView.builder(
                itemCount: widget.productVariant.variantList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = index;
                      });
                    },
                    child: Container(
                      width: 35,
                      height: 30,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: selectedColor == index
                              ? Border.all(
                                  width: 2,
                                  color: CustomeColors.blue,
                                  strokeAlign: BorderSide.strokeAlignOutside)
                              : Border.all(style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(
                              int.parse(
                                  '0xff${widget.productVariant.variantList[index].value}'),
                            ),
                          ),
                        ),
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
