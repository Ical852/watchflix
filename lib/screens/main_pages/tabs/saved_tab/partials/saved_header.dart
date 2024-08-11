import 'package:flutter/material.dart';
import 'package:watchflix/shared/text_styles.dart';

class SavedHeader extends StatelessWidget {
  const SavedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 24
      ),
      child: Text(
        "Saved Movie / Tv Series",
        style: base.white.semiBold,
      ),
    );
  }
}