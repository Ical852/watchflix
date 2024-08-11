import 'package:flutter/material.dart';
import 'package:watchflix/models/cast_response.dart';
import 'package:watchflix/screens/detail_pages/widgets/cast_card.dart';
import 'package:watchflix/shared/text_styles.dart';

// ignore: must_be_immutable
class Cast extends StatelessWidget {
  CastResponse state;
  Cast({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Cast",
              style: mega.white.semiBold,
            ),
          ),
          SizedBox(height: 16,),
          Container(
            height: 120,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 20, right: 8),
              scrollDirection: Axis.horizontal,
              itemCount: state.cast!.length,
              itemBuilder: (context, index) {
                return CastCard(cast: state.cast![index],);
              },
            ),
          )
        ],
      ),
    );
  }
}