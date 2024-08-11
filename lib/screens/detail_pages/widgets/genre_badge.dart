import 'package:flutter/material.dart';
import 'package:watchflix/shared/constants.dart';
import 'package:watchflix/shared/text_styles.dart';

// ignore: must_be_immutable
class GenreBadge extends StatelessWidget {
  String title;
  GenreBadge({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4
      ),
      decoration: BoxDecoration(
        color: greyColor2,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: greyColor
        )
      ),
      child: Text(
        title,
        style: small.white.light,
      ),
    );
  }
}