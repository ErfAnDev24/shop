import 'package:digikala/bloc/categoryScreenBloc/CategoryBloc.dart';
import 'package:digikala/bloc/categoryScreenBloc/CategoryEvent.dart';
import 'package:digikala/bloc/categoryScreenBloc/CategoryState.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/screens/CategoryItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                      'Category',
                      style: TextStyle(
                          color: CustomeColors.grey,
                          fontWeight: FontWeight.bold),
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
                      padding: EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(),
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
                        return Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: CategoryItem(category: right[index]),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return SliverToBoxAdapter(
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
