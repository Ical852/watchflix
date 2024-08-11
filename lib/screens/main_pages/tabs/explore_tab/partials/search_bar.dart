import 'package:flutter/material.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/shared/constants.dart';
import 'package:watchflix/shared/text_styles.dart';
import 'package:watchflix/widgets/image_custom.dart';

// ignore: must_be_immutable
class SearchBarCustom extends StatelessWidget {
  TextEditingController searchController;
  Function(String) onFieldSubmitted;
  Widget searchDrawerContent;
  
  SearchBarCustom({
    super.key,
    required this.searchController,
    required this.onFieldSubmitted,
    required this.searchDrawerContent
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: greyColor2,
        boxShadow: [getBoxShadow(1.5)],
        borderRadius: BorderRadius.circular(8)
      ),
      margin: EdgeInsets.all(24),
      child: Stack(
        children: [
          TextFormField(
            style: regular.white.semiBold,
            decoration: InputDecoration(
              labelText: "Search movie or tv here",
              labelStyle: regular.regularF.copyWith(color: whiteColor),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(right: 52, left: 52)
            ),
            controller: searchController,
            onFieldSubmitted: (e) => onFieldSubmitted(e),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 16),
              child: ImageCustom(
                height: 20,
                width: 20,
                image: AssetImage(getIC("ic_search.png")),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () => showDrawer(context, 270, searchDrawerContent),
                child: ImageCustom(
                  height: 20,
                  width: 20,
                  image: AssetImage(getIC("ic_filter.png")),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}