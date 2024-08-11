import 'package:flutter/material.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/screens/detail_pages/detail_page.dart';
import 'package:watchflix/shared/text_styles.dart';
import 'package:watchflix/widgets/image_custom.dart';

// ignore: must_be_immutable
class TopRatedCard extends StatelessWidget {
  bool isTv;
  Results detail;

  TopRatedCard({
    super.key,
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
                Color(0xff000000).withOpacity(0.85),
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
        child: Center(
          child: ImageCustom(
            fit: BoxFit.cover,
            width: getWH(context, "width") - 84,
            height: 220,
            image: NetworkImage(getPosterUrl(detail.posterPath!)),
            borderRadius: BorderRadius.circular(12),
            child: Container(
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
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}