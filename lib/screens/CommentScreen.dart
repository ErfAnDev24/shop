import 'package:cached_network_image/cached_network_image.dart';
import 'package:digikala/bloc/commentBloc/CommentBloc.dart';
import 'package:digikala/bloc/commentBloc/CommentEvent.dart';
import 'package:digikala/bloc/commentBloc/CommentState.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CommentScreen extends StatefulWidget {
  CommentScreen({super.key, required this.product});

  Product product;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController textEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 10, right: 10),
              sliver: BlocBuilder<CommentBloc, CommentState>(
                builder: (context, state) {
                  if (state is CommentLoadingState) {
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
                  } else if (state is CommentResponseState) {
                    return state.commentList.fold(
                      (left) => SliverToBoxAdapter(
                        child: Text(left),
                      ),
                      (right) {
                        return SliverList.builder(
                          itemCount: right.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '${right[index].username}',
                                              style: const TextStyle(
                                                  fontFamily: 'vazir',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '${right[index].text}',
                                              textAlign: TextAlign.end,
                                              style: const TextStyle(
                                                  fontFamily: 'vazir',
                                                  fontSize: 13,
                                                  color: CustomeColors.grey),
                                            ),
                                          ]),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: right[index].avatar.isEmpty
                                          ? Container(
                                              width: 60,
                                              height: 60,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Image(
                                                image: AssetImage(
                                                    'images/noImage.png'),
                                              ),
                                            )
                                          : Container(
                                              width: 60,
                                              height: 60,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl: right[index].imageURL,
                                              ),
                                            ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                  return const SliverToBoxAdapter(child: Text('error'));
                },
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 150)),
          ],
        ),
        Container(
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          width: double.infinity,
          height: 170,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 207, 207, 207),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: TextField(
                  controller: textEditController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: CustomeColors.blue, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: CustomeColors.blue, width: 2),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CommentBloc>().add(
                        AddCommentEvent(
                            widget.product.id, textEditController.text),
                      );
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    backgroundColor: CustomeColors.blue,
                    foregroundColor: Colors.white),
                child: const Text(
                  'ثبت نظر',
                  style: TextStyle(
                      fontFamily: 'vazir',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    textEditController.dispose();
    super.dispose();
  }
}
