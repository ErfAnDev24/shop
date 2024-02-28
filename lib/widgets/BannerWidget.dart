import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
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
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 10,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: ExpandingDotsEffect(
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
