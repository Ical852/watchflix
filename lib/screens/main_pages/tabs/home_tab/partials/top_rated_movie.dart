import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/screens/main_pages/tabs/home_tab/widgets/top_rated_card.dart';

// ignore: must_be_immutable
class TopRatedMovie extends StatelessWidget {
  FetchResponse state;
  TopRatedMovie({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
          viewportFraction: 0.83,
        ),
        items: state.results!.map((image) {
          return TopRatedCard(detail: image);
        }).toList(),
      ),
    );
  }
}
