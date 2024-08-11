import 'package:flutter/material.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/shared/text_styles.dart';
import 'package:watchflix/widgets/image_custom.dart';

class EmptySaved extends StatelessWidget {
  const EmptySaved({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageCustom(
              width: 250,
              height: 250,
              image: AssetImage(getIM("im_empty.png")),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 64
              ),
              child: Text(
                "You have'nt saved any movie or tv series yet",
                style: mega.white.semiBold,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 72),
          ],
        ),
      ),
    );
  }
}