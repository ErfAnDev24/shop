import 'package:digikala/constants/CustomColors.dart';
import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  Description({super.key, required this.description});
  String description;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool isDescriptionVisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isDescriptionVisible = !isDescriptionVisible;
              });
            },
            child: Container(
              width: 370,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2, color: CustomeColors.grey),
              ),
              child: const Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        'توضیحات محصول : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'vazir'),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'مشاهده',
                      style: TextStyle(
                          color: CustomeColors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'vazir'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Image(
                        image: AssetImage('images/goIn.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Visibility(
            visible: isDescriptionVisible,
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      minWidth: 350, minHeight: 20, maxHeight: 250),
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2, color: CustomeColors.grey),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: CustomScrollView(
                          shrinkWrap: true,
                          slivers: [
                            SliverToBoxAdapter(
                              child: Text(
                                '${widget.description}',
                                style: const TextStyle(
                                    fontFamily: 'vazir', height: 1.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
