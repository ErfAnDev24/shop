import 'package:digikala/constants/CustomColors.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          width: 320,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image(
                image: AssetImage('images/appleLogo.png'),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  'جستجوی محصولات',
                  style: TextStyle(
                      color: CustomeColors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'vazir'),
                ),
              ),
              Image(
                image: AssetImage('images/searchLogo.png'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
