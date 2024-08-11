import 'package:flutter/material.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/shared/constants.dart';
import 'package:watchflix/shared/text_styles.dart';
import 'package:watchflix/widgets/image_custom.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 52,
      decoration: BoxDecoration(
        color: greyColor2,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          ImageCustom(
            height: 24,
            width: 24,
            image: AssetImage(getIC("ic_search.png")),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            "Search movie / tv show here",
            style: regular.grey.mediumF,
          )
        ],
      ),
    );
  }
}
