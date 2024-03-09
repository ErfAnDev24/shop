import 'dart:ui';

import 'package:digikala/bloc/categoryScreenBloc/CategoryBloc.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/screens/AccountScreen.dart';
import 'package:digikala/screens/CategoryScreen.dart';
import 'package:digikala/screens/HomeScreen.dart';
import 'package:digikala/screens/ProductScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int? selectedIndex;

  @override
  void initState() {
    selectedIndex = 0;
    initLocators();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffEEEEEE),
        body: IndexedStack(
          index: selectedIndex,
          children: screens(),
        ),
        /* BlocProvider(
          create: (context) => AuthBloc(),
          child: const LoginScreen(),
        ),*/
        bottomNavigationBar: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: CustomeColors.blue,
                unselectedItemColor: Colors.black,
                onTap: (value) {
                  setState(
                    () {
                      selectedIndex = value;
                    },
                  );
                },
                currentIndex: selectedIndex!,
                items: const [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 3),
                      child: Image(
                        image: AssetImage('images/icon_home.png'),
                      ),
                    ),
                    label: 'Home',
                    activeIcon: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 3),
                      child: Image(
                        image: AssetImage('images/icon_home_active.png'),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 3),
                      child: Image(
                        image: AssetImage('images/icon_category.png'),
                      ),
                    ),
                    label: 'Category',
                    activeIcon: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 3),
                      child: Image(
                        image: AssetImage('images/icon_category_active.png'),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 3),
                      child: Image(
                        image: AssetImage('images/icon_basket.png'),
                      ),
                    ),
                    label: 'Cart',
                    activeIcon: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 3),
                      child: Image(
                        image: AssetImage('images/icon_basket_active.png'),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 3),
                      child: Image(
                        image: AssetImage('images/icon_profile.png'),
                      ),
                    ),
                    label: 'Account',
                    activeIcon: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 3),
                      child: Image(
                        image: AssetImage('images/icon_profile_active.png'),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  List<Widget> screens() {
    return [
      const HomeScreen(),
      BlocProvider(
        create: (context) => CategoryBloc(),
        child: const CategoryScreen(),
      ),
      const ProductScreen(),
      const AccountScreen(),
    ];
  }
}
