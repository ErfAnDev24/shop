import 'dart:ui';

import 'package:digikala/bloc/cartScreenBloc/CartBloc.dart';
import 'package:digikala/bloc/categoryScreenBloc/CategoryBloc.dart';
import 'package:digikala/bloc/homeBloc/HomeBloc.dart';
import 'package:digikala/bloc/homeBloc/HomeEvent.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/screens/AccountScreen.dart';
import 'package:digikala/screens/CartScreen.dart';
import 'package:digikala/screens/CategoryScreen.dart';
import 'package:digikala/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int? selectedIndex;

  var sharePref = locator.get<SharedPreferences>();

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xffEEEEEE),
        body: IndexedStack(
          index: selectedIndex,
          children: screens(),
        ),
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
        create: (context) {
          var bloc = locator.get<HomeBloc>();
          bloc.add(HomeRequestEvent());
          return bloc;
        },
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
