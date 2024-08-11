import 'package:flutter/material.dart';

class BackdropLayer extends StatelessWidget {
  const BackdropLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff000000).withOpacity(0.15),
            Color(0xff000000).withOpacity(0.25),
            Color(0xff000000).withOpacity(0.35),
            Color(0xff000000).withOpacity(0.45),
            Color(0xff000000).withOpacity(0.55),
            Color(0xff000000).withOpacity(0.65),
            Color(0xff000000).withOpacity(0.75),
            Color(0xff000000).withOpacity(0.85),
            Color(0xff000000).withOpacity(0.95),
          ]
        )
      ),
    );
  }
}