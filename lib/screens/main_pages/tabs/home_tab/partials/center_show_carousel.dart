import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/screens/main_pages/tabs/home_tab/widgets/now_showing_card.dart';
import 'package:watchflix/shared/text_styles.dart';

// ignore: must_be_immutable
class CenterShowCarousel extends StatelessWidget {
  FetchResponse state;
  String title;
  bool isTv;

  CenterShowCarousel({
    super.key,
    required this.title,
    required this.state,
    this.isTv = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: mega.white.semiBold,
          ),
          SizedBox(
            height: 22,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              double deviceWidth = constraints.maxWidth;
              double aspectRatio = 177 / 242;
              double itemHeight = deviceWidth * aspectRatio;
              double enlargedHeight = itemHeight * 1.2;

              return CarouselSlider.builder(
                itemCount: state.results!.length,
                itemBuilder: (context, index, realIndex) {
                  return NowShowingCard(
                    isTv: isTv,
                    deviceWidth: deviceWidth,
                    itemHeight: itemHeight,
                    detail: state.results![index]
                  );
                },
                options: CarouselOptions(
                  height: enlargedHeight,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.63,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
