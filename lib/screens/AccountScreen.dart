import 'dart:io';

import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/di/ServiceLocator.dart';
import 'package:digikala/screens/LoginScreen.dart';
import 'package:digikala/widgets/AccountItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final sharePref = locator.get<SharedPreferences>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exitApp = await showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              width: 250,
              height: 150,
              decoration: BoxDecoration(boxShadow: [
                const BoxShadow(
                  color: Colors.black,
                  blurRadius: 12,
                  spreadRadius: -12,
                  offset: Offset(0, 15),
                ),
              ], borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'آیا میخواهید از برنامه خارج شوید؟',
                    style: TextStyle(
                      fontFamily: 'vazir',
                      color: CustomeColors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: const Text('بله'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomeColors.red,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('خیر'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomeColors.blue,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
        return exitApp ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: const Color(0xffEEEEEE),
        ),
        backgroundColor: const Color(0xffEEEEEE),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                width: 320,
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(alignment: Alignment.center, children: [
                    Positioned(
                      left: 0,
                      child: Image(
                        image: AssetImage('images/appleLogo.png'),
                      ),
                    ),
                    Text(
                      'Account',
                      style: TextStyle(
                          color: CustomeColors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('ErfAn Pezeshkpour',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '+9S8 930 184 69 63',
              style: TextStyle(fontSize: 14, color: CustomeColors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                GestureDetector(
                  onTap: () {
                    sharePref.clear();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const AccountItem(),
                )
              ],
            ),
            const Spacer(),
            const Text(
              'ErfAn Shop',
              style: TextStyle(color: CustomeColors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'v-1.0.00',
              style: TextStyle(color: CustomeColors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'instagram.com/erfan_pezeshkpour',
                style: TextStyle(color: CustomeColors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
