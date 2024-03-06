import 'package:cached_network_image/cached_network_image.dart';
import 'package:digikala/bloc/categoryScreenBloc/CategoryBloc.dart';
import 'package:digikala/bloc/categoryScreenBloc/CategoryEvent.dart';
import 'package:digikala/bloc/categoryScreenBloc/CategoryState.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/widgets/Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<CategoryBloc>(context).add(
                  LoadingCategoryEvent(),
                );
              },
              child: const Text('load data'),
            ),
          ),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is InitCategortyState) {
                return SliverToBoxAdapter(
                  child: Text('please click'),
                );
              }

              if (state is LoadingCategoryState) {
                return SliverToBoxAdapter(
                  child: CircularProgressIndicator(),
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
                          child: CachedNetworkImage(
                            imageUrl:
                                'http://startflutter.ir/api/files/${right[index].collectionId}/${right[index].id}/${right[index].thumbnail}',
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return Text('error');
              }
            },
          ),
        ],
      ),
    );
  }
}
