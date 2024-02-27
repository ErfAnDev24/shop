import 'package:flutter/material.dart';

class HomeSellList extends StatefulWidget {
  const HomeSellList({super.key});

  @override
  State<HomeSellList> createState() => _HomeSellListState();
}

class _HomeSellListState extends State<HomeSellList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Expanded(
                  child: Container(),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    width: 75,
                    height: 98,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/sampleItemForSelling.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 7,
                  child: Container(
                    width: 25,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '%4',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(),
          Row(),
        ],
      ),
    );
  }
}
