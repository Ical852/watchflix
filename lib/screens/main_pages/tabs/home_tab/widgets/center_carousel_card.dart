import 'package:flutter/material.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/screens/detail_pages/detail_page.dart';
import 'package:watchflix/shared/text_styles.dart';
import 'package:watchflix/widgets/image_custom.dart';

// ignore: must_be_immutable
class CenterCarouselCard extends StatelessWidget {
  Results detail;
  bool isTv;

  CenterCarouselCard({
    super.key,
    required this.detail,
    this.isTv = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget BackDropLayer() {
      return Container(
        width: getWH(context, "width") - 40,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff000000).withOpacity(0.85),
              Color(0xff000000).withOpacity(0.65),
              Color(0xff000000).withOpacity(0.45),
              Color(0xff000000).withOpacity(0.25),
              Color(0xff000000).withOpacity(0.15),
              Color(0xff000000).withOpacity(0.05),
            ]
          )
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
          width: getWH(context, "width") - 40,
          height: 200,
          image: NetworkImage(getPosterUrl(detail.posterPath!)),
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              BackDropLayer(),
              Container(
                margin: EdgeInsets.only(left: 18, top: 12),
                child: Text(
                  getTitle(detail),
                  style: regular.white.semiBold,
                ),
              ),
              Center(
                child: ImageCustom(
                  width: 34,
                  height: 34,
                  image: AssetImage(getIC("ic_play_btn.png")),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
