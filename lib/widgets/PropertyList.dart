import 'package:digikala/bloc/productDetailsBloc/ProductDetailsBloc.dart';
import 'package:digikala/bloc/productDetailsBloc/ProductDetailsState.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyList extends StatefulWidget {
  const PropertyList({super.key});

  @override
  State<PropertyList> createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
  bool isShowPropertyList = false;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isShowPropertyList = !isShowPropertyList;
              });
            },
            child: Container(
              width: 370,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2, color: CustomeColors.grey),
              ),
              child: const Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        'مشخصات فنی : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'vazir'),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'مشاهده',
                      style: TextStyle(
                          color: CustomeColors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'vazir'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Image(
                        image: AssetImage('images/goIn.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Visibility(
            visible: isShowPropertyList,
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      minWidth: 350, minHeight: 20, maxHeight: 200),
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2, color: CustomeColors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: BlocBuilder<ProductDetailsBloc,
                              ProductDetailsState>(
                            builder: (context, state) {
                              if (state is LoadingProductDetailsState) {
                                return const Center(
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
                                );
                              } else if (state is ResponseProductDetailsState) {
                                return state.propertyList.fold(
                                  (left) => Text(left),
                                  (right) => CustomScrollView(
                                    shrinkWrap: true,
                                    slivers: [
                                      SliverList.builder(
                                        itemCount: right.length,
                                        itemBuilder: (context, index) => Row(
                                          children: [
                                            Text(
                                              '${right[index].title}  : ',
                                              style: const TextStyle(
                                                  fontFamily: 'vazir'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18),
                                              child: Text(
                                                right[index].value,
                                                style: const TextStyle(
                                                    fontFamily: 'vazir'),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }

                              return const Text('error');
                            },
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
