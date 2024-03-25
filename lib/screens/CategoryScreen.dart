import 'package:digikala/bloc/categoryScreenBloc/CategoryBloc.dart';
import 'package:digikala/bloc/categoryScreenBloc/CategoryEvent.dart';
import 'package:digikala/bloc/categoryScreenBloc/CategoryState.dart';
import 'package:digikala/bloc/productScreenBloc/ProductBloc.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/screens/CategoryItem.dart';
import 'package:digikala/screens/ProductScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(LoadingCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xffEEEEEE),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
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
                      'دسته بندی',
                      style: TextStyle(
                          color: CustomeColors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'vazir'),
                    ),
                  ]),
                ),
              ),
            ),
          ),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is LoadingCategoryState) {
                return const SliverToBoxAdapter(
                  child: Center(
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
                  ),
                );
              }

              if (state is ResponseCategoryState) {
                var list = state.categoryList;
                return list.fold(
                  (left) => SliverToBoxAdapter(
                    child: Text(left),
                  ),
                  (right) => SliverPadding(
                    padding: const EdgeInsets.all(25),
                    sliver: SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20),
                      itemCount: right.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => ProductBloc(),
                                  child: ProductScreen(
                                    categoryId: right[index].id,
                                    categoryName: right[index].title,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: CategoryItem(category: right[index]),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return const SliverToBoxAdapter(
                  child: Text('error'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
