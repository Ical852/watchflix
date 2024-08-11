import 'package:flutter/material.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/cast_response.dart';
import 'package:watchflix/shared/text_styles.dart';
import 'package:watchflix/widgets/image_custom.dart';

// ignore: must_be_immutable
class CastCard extends StatelessWidget {
  Cast cast;
  CastCard({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    ImageProvider getImg() {
      if (cast.profilePath != null) {
        return NetworkImage(getPosterUrl(cast.profilePath!));
      }
      return AssetImage(getIM("im_user.png"));
    }

    return Container(
      margin: EdgeInsets.only(right: 12),
      width: 72,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCustom(height: 72, width: 72, borderRadius: BorderRadius.circular(4),
          fit: BoxFit.cover,
          image: getImg(),),
          SizedBox(height: 8,),
          Text(
            cast.name!,
            style: small.white.regularF,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}