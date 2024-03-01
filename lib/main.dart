import 'package:digikala/screens/CategoryScreen.dart';
import 'package:digikala/screens/HomeScreen.dart';
import 'package:digikala/screens/ProductScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: screens(),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(
                () {
                  selectedIndex = value;
                },
              );
            },
            currentIndex: selectedIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('images/icon_home.png'),
                ),
                label: 'Home',
                activeIcon: Image(
                  image: AssetImage('images/icon_home_active.png'),
                ),
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('images/icon_category.png'),
                ),
                label: 'Category',
                activeIcon: Image(
                  image: AssetImage('images/icon_category_active.png'),
                ),
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('images/icon_basket.png'),
                ),
                label: 'Cart',
                activeIcon: Image(
                  image: AssetImage('images/icon_basket_active.png'),
                ),
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('images/icon_profile.png'),
                ),
                label: 'Account',
                activeIcon: Image(
                  image: AssetImage('images/icon_profile_active.png'),
                ),
              ),
            ]),
      ),
    );
  }

  List<Widget> screens() {
    return const [
      HomeScreen(),
      CategoryScreen(),
      ProductScreen(),
      HomeScreen(),
    ];
  }
}
