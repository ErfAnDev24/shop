import 'package:digikala/widgets/Home_HorizontalList.dart';
import 'package:digikala/widgets/Home_SellList.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      body: Center(child: HomeSellList()),
    );
  }
}
