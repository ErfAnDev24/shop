import 'package:digikala/bloc/homeBloc/HomeBloc.dart';
import 'package:digikala/bloc/homeBloc/HomeEvent.dart';
import 'package:digikala/bloc/homeBloc/HomeState.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/widgets/BannerWidget.dart';

import 'package:digikala/widgets/CategoryList.dart';
import 'package:digikala/widgets/SellItem.dart';
import 'package:digikala/widgets/search.dart';
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
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Search(),
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is LoadingBannerState) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                );
              } else if (state is ResponseBannerState) {
                return state.bannerList.fold(
                  (left) => SliverToBoxAdapter(
                    child: Text(left),
                  ),
                  (right) {
                    return SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: BannerWidget(bannerList: right),
                      ),
                    );
                  },
                );
              }
              return const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Text('error!'),
                ),
              );
            },
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 25, bottom: 20, right: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Category',
                    style: TextStyle(
                        color: CustomeColors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: CategoryList(),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Most Popular',
                    style: TextStyle(
                        color: CustomeColors.grey, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'show all',
                    style: TextStyle(
                        color: CustomeColors.blue, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Image(
                      image: AssetImage('images/goIn.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 20),
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(right: 15, bottom: 20),
                      child: SellItem(),
                    );
                  },
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 25, bottom: 20, right: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Category',
                    style: TextStyle(
                        color: CustomeColors.grey, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'show all',
                    style: TextStyle(
                        color: CustomeColors.blue, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Image(
                      image: AssetImage('images/goIn.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(right: 15, bottom: 20),
                      child: SellItem(),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
