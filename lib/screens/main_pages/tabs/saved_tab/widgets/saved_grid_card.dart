import 'package:flutter/material.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/screens/detail_pages/detail_page.dart';
import 'package:watchflix/widgets/image_custom.dart';

// ignore: must_be_immutable
class SavedGridCard extends StatelessWidget {
  double itemWidth, itemHeight;
  Results detail;
  String type;

  SavedGridCard({
    super.key,
    required this.itemWidth,
    required this.itemHeight,
    required this.detail,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider getImg() {
      if (detail.posterPath != null) {
        return NetworkImage(getPosterUrl(detail.posterPath!));
      }
      return AssetImage(getIM("im_user.png"));
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              isTv: type == "tv",
              detail: detail,
            )
          ),
        );
      },
      child: Container(
        child: AspectRatio(
          aspectRatio: 105 / 160,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: ImageCustom(
              width: itemWidth,
              height: itemHeight,
              fit: BoxFit.cover,
              image: getImg(),
            ),
          ),
        ),
      )
    );
  }
}