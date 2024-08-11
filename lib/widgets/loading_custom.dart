import 'package:flutter/material.dart';
import 'package:watchflix/shared/constants.dart';

class LoadingCustom extends StatelessWidget {
  const LoadingCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Center(
        child: CircularProgressIndicator(
          color: whiteColor,
        ),
      )
    );
  }
}