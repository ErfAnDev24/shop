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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeRequestEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xffEEEEEE),
      ),
      backgroundColor: const Color(0xffEEEEEE),
      body: RefreshIndicator(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
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
              return CustomScrollView(
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
              );
            }
            return const Text('error');
          },
        ),
        onRefresh: () {
          return Future.delayed(
            const Duration(milliseconds: 1),
            () {
              context.read<HomeBloc>().add(HomeRequestEvent());
            },
          );
        },
      ),
    );
  }
}
