import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image(
            image: AssetImage('images/appleLogo.png'),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              'Search for products',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Image(
            image: AssetImage('images/searchLogo.png'),
          ),
        ]),
      ),
    );
  }
}
