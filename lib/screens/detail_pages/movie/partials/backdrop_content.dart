import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchflix/blocs/cubits/saved_cubit.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/detail_response.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/models/saved_model.dart';
import 'package:watchflix/shared/text_styles.dart';
import 'package:watchflix/widgets/buttons/mini_button_custom.dart';
import 'package:watchflix/widgets/image_custom.dart';

// ignore: must_be_immutable
class BackdropContent extends StatefulWidget {
  DetailResponse detail;
  Results mainDetail;
  BackdropContent({
    super.key,
    required this.detail,
    required this.mainDetail,
  });

  @override
  State<BackdropContent> createState() => _BackdropContentState();
}

class _BackdropContentState extends State<BackdropContent> {
  @override
  Widget build(BuildContext context) {
    bool isSaved() {
      return context.read<SavedCubit>().isSaved(this.widget.mainDetail.id!);
    }
    void save() {
      setState(() {
        context.read<SavedCubit>().saveMovie(widget.mainDetail, "movie");
      });
    }
    void remove() {
      setState(() {
        context.read<SavedCubit>().removeMovie(widget.mainDetail.id!);
      });
    }

    Widget HeadContentDetail() {
      return Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.detail.title!,
                style: mega.white.semiBold,
                maxLines: 2,
              ),
              SizedBox(height: 2,),
              Text(
                convertMinutesToHourMinute(widget.detail.runtime!),
                style: regular.white.regularF,
              ),
              Row(
                children: [
                  ImageCustom(height: 16, width: 16, image: AssetImage(getIC("ic_star.png")),),
                  SizedBox(width: 4,),
                  Text(
                    "${widget.detail.voteAverage!.toStringAsFixed(1)} / 10 from IMDb",
                    style: regular.grey.regularF,
                  )
                ],
              ),
              Row(
                children: [
                  ImageCustom(height: 16, width: 16, image: AssetImage(getIC("ic_thumb.png")),),
                  SizedBox(width: 4,),
                  Text(
                    "${widget.detail.voteCount} votes from users",
                    style: regular.grey.regularF,
                  )
                ],
              ),
              SizedBox(height: 3,),
              MiniButtonCustom(
                width: 160,
                height: 30,
                title: "Watch Now", onPressed: (){
                  launchURL(widget.detail.homepage);
                }
              )
            ],
          ),
        )
      );
    }

    return Container(
      padding: EdgeInsets.only(
        bottom: 20
      ),
      height: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocConsumer<SavedCubit, List<SavedModel>>(
            listener: (context, state) {},
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(
                  top: 32,
                  left: 28,
                  right: 28
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: ImageCustom(
                        height: 28, 
                        width: 16,
                        image: AssetImage(getIC("ic_back.png")),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => isSaved() ? remove() : save(),
                      child: ImageCustom(
                        height: 28,
                        width: 22,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          getIC(
                            isSaved() ? "ic_saved_active.png" : "ic_saved_detail.png"
                          )
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HeadContentDetail(),
                Container(
                  child: ImageCustom(
                    height: 170,
                    width: (getWH(context, "width") / 2) - 47.5,
                    image: NetworkImage(getPosterUrl(widget.detail.posterPath!)),
                    fit: BoxFit.cover,
                    margin: EdgeInsets.only(
                      right: 20,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}