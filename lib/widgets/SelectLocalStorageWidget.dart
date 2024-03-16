import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/models/ProductVariant.dart';
import 'package:flutter/material.dart';

class SelectLocalStorageWidget extends StatefulWidget {
  ProductVariant productVariant;

  SelectLocalStorageWidget({super.key, required this.productVariant});

  @override
  State<SelectLocalStorageWidget> createState() =>
      _SelectLocalStorageWidgetState();
}

class _SelectLocalStorageWidgetState extends State<SelectLocalStorageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'انتخاب حافظه داخلی',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontFamily: 'vazir'),
              ),
            ),
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    width: 75,
                    height: 30,
                    margin: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: CustomeColors.grey),
                    ),
                    child: Center(
                      child: Text(
                        widget.productVariant.variantList[index].value,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'digits'),
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
