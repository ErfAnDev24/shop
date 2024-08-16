import 'dart:io';

import 'package:digikala/bloc/homeBloc/HomeBloc.dart';
import 'package:digikala/bloc/homeBloc/HomeEvent.dart';
import 'package:digikala/bloc/homeBloc/HomeState.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/widgets/BannerWidget.dart';

import 'package:digikala/widgets/CategoryList.dart';
import 'package:digikala/widgets/CategoryTitleWidget.dart';
import 'package:digikala/widgets/MostSoldsTitleWidget.dart';
import 'package:digikala/widgets/MostViewedTitleWidget.dart';

import 'package:digikala/widgets/ProductList.dart';
import 'package:digikala/widgets/SearchBox.dart';
import 'package:digikala/widgets/ShowingError.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return getHomeScreenContent(context, state);
          },
        ),
      ),
    );
  }
}

Widget getHomeScreenContent(BuildContext context, HomeState state) {
  if (state is LoadingHomeState) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(
          top: 20,
        ),
        child: SizedBox(
          width: 80,
          height: 80,
          child: LoadingIndicator(
            colors: [CustomeColors.blue],
            indicatorType: Indicator.ballRotateChase,
          ),
        ),
      ),
    );
  } else if (state is HomeResponseState) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          const Duration(milliseconds: 1),
          () {
            context.read<HomeBloc>().add(HomeRequestEvent());
          },
        );
      },
      child: CustomScrollView(
        slivers: [
          const SearchBox(),
          state.bannerList.fold(
            (left) => const ShowingError(),
            (right) {
              return BannerWidget(
                bannerList: right,
              );
            },
          ),
          const CategoryTitleWidget(),
          state.categoryList.fold(
            (left) => const ShowingError(),
            (right) => CategoryList(
              categoryList: right,
            ),
          ),
          const MostSoldsTitleWidget(),
          state.bestSellerList.fold(
            (left) => const ShowingError(),
            (right) => ProductList(productList: right),
          ),
          const MostViewedTitleWidget(),
          state.mostViewedList.fold(
            (left) => const ShowingError(),
            (right) => ProductList(productList: right),
          ),
        ],
      ),
    );
  }
  return const Text('error');
}
