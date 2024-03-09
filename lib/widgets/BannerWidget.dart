import 'package:cached_network_image/cached_network_image.dart';
import 'package:digikala/constants/CustomColors.dart';
import 'package:digikala/models/Banner.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatelessWidget {
  List<HomeBanner> bannerList;

  BannerWidget({super.key, required this.bannerList});

  @override
  Widget build(BuildContext context) {
    PageController pageController =
        PageController(viewportFraction: 0.8, initialPage: 1);

    return SizedBox(
      height: 170,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: bannerList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      errorListener: (value) {
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(93, 246, 154, 147),
                          ),
                        );
                      },
                      imageUrl: bannerList[index].imageURL,
                      placeholder: (context, url) {
                        return Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: CustomeColors.grey),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 10,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 4,
              effect: const ExpandingDotsEffect(
                  dotHeight: 7,
                  dotWidth: 7,
                  expansionFactor: 4,
                  activeDotColor: Color(0xff3B5EDF),
                  dotColor: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
