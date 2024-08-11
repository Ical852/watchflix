import 'package:flutter/material.dart';
import 'package:watchflix/shared/constants.dart';
import 'package:watchflix/shared/text_styles.dart';

class NowShowingBadge extends StatelessWidget {
  const NowShowingBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 1
      ),
      decoration: BoxDecoration(
        color: badge,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Text(
        "Action",
        style: regular.mediumF.copyWith(color: Colors.white),
      ),
    );
  }
}