import 'package:flutter/material.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/detail_response.dart';
import 'package:watchflix/screens/detail_pages/widgets/genre_badge.dart';
import 'package:watchflix/screens/detail_pages/widgets/line.dart';
import 'package:watchflix/shared/text_styles.dart';

// ignore: must_be_immutable
class Synopsis extends StatelessWidget {
  DetailResponse detail;
  Synopsis({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    Widget TopDetail() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Release Date",
                style: base.white.semiBold,
              ),
              SizedBox(height: 12,),
              Text(
                dateFormat(detail.releaseDate!),
                style: regular.grey.regularF,
              )
            ],
          ),
          SizedBox(width: 50,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Genre",
                  style: base.white.semiBold,
                ),
                SizedBox(height: 8,),
                Wrap(
                  children: detail.genres!.map((genre){
                    return Container(
                      margin: EdgeInsets.only(right: 12, bottom: 12),
                      child: GenreBadge(
                        title: genre.name!
                      )
                    );
                  }).toList(),
                )
              ],
            ),
          )
        ],
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Line(),
          SizedBox(height: 16,),
          TopDetail(),
          SizedBox(height: 16,),
          Line(),
          SizedBox(height: 12,),
          Text(
            "Sinopsis",
            style: mega.white.semiBold,
          ),
          SizedBox(height: 10,),
          Text(
            detail.overview!,
            style: regular.grey.regularF,
            maxLines: 5,
          )
        ],
      ),
    );
  }
}