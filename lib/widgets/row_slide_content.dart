import 'package:flutter/material.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/screens/detail_pages/detail_page.dart';
import 'package:watchflix/shared/text_styles.dart';
import 'package:watchflix/widgets/image_custom.dart';

// ignore: must_be_immutable
class RowSlideContent extends StatelessWidget {
  bool isDetail, isTv;
  FetchResponse state;
  String title;

  RowSlideContent({
    super.key,
    required this.title,
    required this.state,
    this.isDetail = false,
    this.isTv = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: mega.white.semiBold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 20, right: 8),
              itemCount: state.results!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var image = state.results![index].posterPath;
                ImageProvider getImg() {
                  if (image != null) {
                    return NetworkImage(getPosterUrl(image));
                  }
                  return AssetImage(getIM("im_user.png"));
                }

                return GestureDetector(
                  onTap: () {
                    if (isDetail) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            detail: state.results![index],
                            isTv: isTv,
                          )
                        ),
                      );
                    } else {
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => DetailPage(
                            detail: state.results![index], 
                            isTv: isTv,
                          )
                        ),
                      );
                    }
                  },
                  child: ImageCustom(
                    margin: EdgeInsets.only(right: 12),
                    height: 200,
                    width: 150,
                    fit: BoxFit.cover,
                    image: getImg(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
