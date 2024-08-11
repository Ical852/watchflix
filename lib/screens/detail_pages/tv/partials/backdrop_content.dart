import 'package:flutter/material.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/detail_tv_response.dart';
import 'package:watchflix/shared/text_styles.dart';
import 'package:watchflix/widgets/buttons/mini_button_custom.dart';
import 'package:watchflix/widgets/image_custom.dart';

// ignore: must_be_immutable
class BackdropContent extends StatelessWidget {
  DetailTvResponse detail;
  BackdropContent({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    Widget HeadContentDetail() {
      return Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      detail.name!,
                      style: mega.white.semiBold,
                      maxLines: 2,
                    ),
                    SizedBox(height: 2,),
                    Text(
                      convertMinutesToHourMinute(detail.lastEpisodeToAir!.runtime!),
                      style: regular.white.regularF,
                    ),
                    Row(
                      children: [
                        ImageCustom(height: 16, width: 16, image: AssetImage(getIC("ic_star.png")),),
                        SizedBox(width: 4,),
                        Text(
                          "${detail.voteAverage!.toStringAsFixed(1)} / 10 from IMDb",
                          style: regular.grey.regularF,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        ImageCustom(height: 16, width: 16, image: AssetImage(getIC("ic_thumb.png")),),
                        SizedBox(width: 4,),
                        Text(
                          "${detail.voteCount} votes from users",
                          style: regular.grey.regularF,
                        )
                      ],
                    ),
                    SizedBox(height: 3,),
                    MiniButtonCustom(
                      width: 160,
                      height: 30,
                      title: "Watch Now", onPressed: (){}
                    )
                  ],
                ),
              )
            ),
            SizedBox(width: 12,),
            Container(
              child: ImageCustom(
                height: 170,
                width: (getWH(context, "width") / 2) - 47.5,
                image: NetworkImage(getPosterUrl(detail.posterPath!)),
                fit: BoxFit.cover,
                margin: EdgeInsets.only(
                  right: 20,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            )
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.only(
        bottom: 20
      ),
      height: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: ImageCustom(
              margin: EdgeInsets.only(
                top: 32,
                left: 28
              ),
              height: 28, 
              width: 16,
              image: AssetImage(getIC("ic_back.png")),
            ),
          ),
          HeadContentDetail(),
        ],
      ),
    );
  }
}