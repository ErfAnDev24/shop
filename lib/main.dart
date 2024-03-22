import 'dart:ui';
import 'package:digikala/bloc/cartScreenBloc/CartBloc.dart';
import 'package:digikala/screens/HomeScreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:digikala/bloc/categoryScreenBloc/CategoryBloc.dart';
import 'package:digikala/bloc/homeBloc/HomeBloc.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/SelectedCartItem.dart';
import 'package:digikala/screens/AccountScreen.dart';
import 'package:digikala/screens/CartScreen.dart';
import 'package:digikala/screens/CategoryScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SelectedCartItemAdapter());
  await Hive.openBox<SelectedCartItem>('cartItems');
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
                selectedLabelStyle: const TextStyle(fontFamily: 'vazir'),
                unselectedLabelStyle: const TextStyle(fontFamily: 'vazir'),
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
                    label: 'خانه',
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
                    label: 'دسته بندی',
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
                    label: 'سبد خرید',
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
                    label: 'حساب کاربری',
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
      BlocProvider(
        create: (context) => HomeBloc(),
        child: const HomeScreen(),
      ),
      BlocProvider(
        create: (context) => CategoryBloc(),
        child: const CategoryScreen(),
      ),
      BlocProvider(
        create: (context) => locator.get<CartBloc>(),
        child: CartScreen(),
      ),
      const AccountScreen(),
    ];
  }
}
