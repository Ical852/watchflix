import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/screens/main_pages/tabs/home_tab/widgets/center_carousel_card.dart';
import 'package:watchflix/shared/text_styles.dart';

// ignore: must_be_immutable
class CenterCarousel extends StatelessWidget {
  String title;
  FetchResponse state;
  bool isTv;
  
  CenterCarousel({
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
          CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: false,
              enableInfiniteScroll: true,
              viewportFraction: 1,
            ),
            items: state.results!.map((detail) => CenterCarouselCard(
              isTv: isTv,
              detail: detail,
            )).toList(),
          ),
        ],
      ),
    );
  }
}
