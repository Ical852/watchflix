import 'package:flutter/material.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/screens/detail_pages/detail_page.dart';
import 'package:watchflix/shared/text_styles.dart';
import 'package:watchflix/widgets/image_custom.dart';

// ignore: must_be_immutable
class NowShowingCard extends StatelessWidget {
  Results detail;
  double itemHeight, deviceWidth;
  bool isTv;

  NowShowingCard({
    super.key,
    required this.deviceWidth,
    required this.itemHeight,
    required this.detail,
    this.isTv = false
  });

  @override
  Widget build(BuildContext context) {
    Widget BackDropLayer() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff000000).withOpacity(0.05),
                Color(0xff000000).withOpacity(0.15),
                Color(0xff000000).withOpacity(0.25),
                Color(0xff000000).withOpacity(0.45),
                Color(0xff000000).withOpacity(0.65),
                Color(0xff000000).withOpacity(0.95),
              ]
            )
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => DetailPage(
              detail: detail,
              isTv: isTv,
            )
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: AspectRatio(
          aspectRatio: 177 / 242,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ImageCustom(
              fit: BoxFit.cover,
              height: itemHeight,
              width: deviceWidth * 0.7,
              image: NetworkImage(getPosterUrl(detail.posterPath!)),
              child: Stack(
                children: [
                  BackDropLayer(),
                  Container(
                    margin: EdgeInsets.only(left: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          getTitle(detail),
                          style: base.white.semiBold,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
