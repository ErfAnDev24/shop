import 'package:digikala/screens/DashboardScreen.dart';
import 'package:digikala/screens/LoginScreen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/models/SelectedCartItem.dart';

import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SelectedCartItemAdapter());
  await Hive.openBox<SelectedCartItem>('cartItems');
  await initLocators();
  runApp(Application());
}

class Application extends StatefulWidget {
  Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  var sharedPref;

  @override
  void initState() {
    sharedPref = locator.get<SharedPreferences>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: globalNavigatorKey,
        home: sharedPref.getString('access-token') != null
            ? const DashBoardScreen()
            : const LoginScreen());
  }
}
