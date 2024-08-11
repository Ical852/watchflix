import 'package:flutter/material.dart';
import 'package:watchflix/widgets/buttons/mini_button_custom.dart';
import 'package:watchflix/widgets/drawer_title_desc.dart';

// ignore: must_be_immutable
class SearchDrawer extends StatelessWidget {
  Function() onMovies, onTv;

  SearchDrawer({
    super.key,
    required this.onMovies,
    required this.onTv,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          DrawerTitleDesc(
            title: "Choose Search Type",
            desc: "Choose your search type, Choos movies to search movies, choos tv series to search tv series"
          ),
          SizedBox(
            height: 24,
          ),
          MiniButtonCustom(
            width: double.infinity,
            onPressed: () {
              onMovies();
              Navigator.pop(context);
            },
            title: "Movies"),
          SizedBox(
            height: 16,
          ),
          MiniButtonCustom(
            width: double.infinity,
            onPressed: () {
              onTv();
              Navigator.pop(context);
            },
            title: "Tv Series"
          ),
        ],
      ),
    );
  }
}