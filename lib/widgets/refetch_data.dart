import 'package:flutter/material.dart';
import 'package:watchflix/shared/text_styles.dart';
import 'package:watchflix/widgets/buttons/mini_button_custom.dart';

// ignore: must_be_immutable
class RefetchData extends StatelessWidget {
  String title;
  Function() onRefetch;

  RefetchData({
    super.key,
    required this.title,
    required this.onRefetch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: base.white.semiBold,
            ),
            SizedBox(height: 12,),
            MiniButtonCustom(title: "Retry", onPressed: onRefetch)
          ],
        ),
      )
    );
  }
}