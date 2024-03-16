import 'package:digikala/bloc/homeBloc/HomeBloc.dart';
import 'package:digikala/bloc/homeBloc/HomeEvent.dart';
import 'package:digikala/bloc/homeBloc/HomeState.dart';

import 'package:digikala/screens/LoadingWidget.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeRequestEvent());
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
      body: CustomScrollView(
        slivers: [
          const SearchBox(),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is LoadingHomeState) {
                return const LoadingWidget();
              } else if (state is HomeResponseState) {
                return state.bannerList.fold(
                  (left) => const ShowingError(),
                  (right) {
                    return BannerWidget(
                      bannerList: right,
                    );
                  },
                );
              }
              return const ShowingError();
            },
          ),
          const CategoryTitleWidget(),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is LoadingHomeState) {
                return const LoadingWidget();
              }

              if (state is HomeResponseState) {
                return state.categoryList.fold(
                  (left) => const ShowingError(),
                  (right) => CategoryList(
                    categoryList: right,
                  ),
                );
              }

              return const ShowingError();
            },
          ),
          const MostSoldsTitleWidget(),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is LoadingHomeState) {
                return const LoadingWidget();
              } else if (state is HomeResponseState) {
                return state.bestSellerList.fold(
                  (left) => const ShowingError(),
                  (right) => ProductList(productList: right),
                );
              }
              return const ShowingError();
            },
          ),
          const MostViewedTitleWidget(),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is LoadingHomeState) {
                return const LoadingWidget();
              } else if (state is HomeResponseState) {
                return state.mostViewedList.fold(
                  (left) => const ShowingError(),
                  (right) => ProductList(productList: right),
                );
              }
              return const ShowingError();
            },
          ),
        ],
      ),
    );
  }
}
