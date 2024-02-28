import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/widgets/BannerWidget.dart';
import 'package:digikala/widgets/CategoryList.dart';
import 'package:digikala/widgets/SellItem.dart';
import 'package:digikala/widgets/search.dart';
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
      backgroundColor: Color.fromARGB(255, 206, 206, 206),
      body: Padding(
        padding: EdgeInsets.only(top: 60),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Search(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: BannerWidget(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 25, bottom: 15),
                child: Text(
                  'Category',
                  style: TextStyle(
                    color: CustomeColors.grey,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CategoryList(),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25, bottom: 15, top: 15),
                    child: Text(
                      'Most popular',
                      style: TextStyle(
                        color: CustomeColors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 15, bottom: 20),
                        child: SellItem(),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25, bottom: 15, top: 15),
                    child: Text(
                      'Most viewd',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 15, bottom: 20),
                        child: SellItem(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
