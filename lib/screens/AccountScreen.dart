import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/widgets/AccountItem.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
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
                        color: CustomeColors.grey, fontWeight: FontWeight.bold),
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
          const Wrap(
            children: [
              AccountItem(),
              AccountItem(),
              AccountItem(),
              AccountItem(),
              AccountItem(),
              AccountItem(),
              AccountItem(),
              AccountItem(),
              AccountItem(),
              AccountItem(),
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
    );
  }
}
