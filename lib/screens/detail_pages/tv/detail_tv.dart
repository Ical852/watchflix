import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchflix/blocs/cubits/tv_cast_cubit.dart';
import 'package:watchflix/blocs/cubits/tv_detail_cubit.dart';
import 'package:watchflix/blocs/cubits/tv_recommendations_cubit.dart';
import 'package:watchflix/blocs/cubits/tv_trailer_cubit.dart';
import 'package:watchflix/models/detail_tv_response.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/screens/detail_pages/tv/partials/backdrop_content.dart';
import 'package:watchflix/screens/detail_pages/tv/partials/backdrop_img.dart';
import 'package:watchflix/screens/detail_pages/tv/partials/backdrop_layer.dart';
import 'package:watchflix/screens/detail_pages/tv/partials/cast.dart';
import 'package:watchflix/screens/detail_pages/tv/partials/synopsis.dart';
import 'package:watchflix/screens/detail_pages/tv/partials/trailer.dart';
import 'package:watchflix/shared/constants.dart';
import 'package:watchflix/widgets/loading_custom.dart';
import 'package:watchflix/widgets/refetch_data.dart';
import 'package:watchflix/widgets/row_slide_content.dart';

// ignore: must_be_immutable
class DetailTv extends StatelessWidget {
  Results mainDetail;
  Function()
    onDetailFetch,
    onRecommendFetch,
    onCastFetch,
    onTrailerFetch;
  
  DetailTv({
    super.key,
    required this.mainDetail,
    required this.onDetailFetch, 
    required this.onRecommendFetch, 
    required this.onCastFetch, 
    required this.onTrailerFetch
  });

  @override
  Widget build(BuildContext context) {
    Widget TvTrailerContent(DetailTvResponse detail) {
      return BlocConsumer<TvTrailerCubit, TvTrailerState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TvTrailerLoading) return LoadingCustom();
          if (state is TvTrailerFailed) {
            return RefetchData(
              title: "Failed to get Tv Trailer",
              onRefetch: onTrailerFetch,
            );
          }
          if (state is TvTrailerSuccess) {
            return Trailer(
              trailer: state.trailer,
              detail: detail,
            );
          }
          return Container();
        },
      );
    }

    Widget TvCastContent() {
      return BlocConsumer<TvCastCubit, TvCastState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TvCastLoading) return LoadingCustom();
          if (state is TvCastFailed) {
            return RefetchData(
              title: "Failed to get Tv Cast",
              onRefetch: onCastFetch,
            );
          }
          if (state is TvCastSuccess) return Cast(state: state.cast);
          return Container();
        },
      );
    }

    Widget TvRecommendationContent() {
      return BlocConsumer<TvRecommendationsCubit, TvRecommendationsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TvRecommendationsLoading) return LoadingCustom();
          if (state is TvRecommendationsFailed) {
            return RefetchData(
              title: "Failed to get Tv Recommendations",
              onRefetch: onRecommendFetch,
            );
          }
          if (state is TvRecommendationsSuccess) {
            return RowSlideContent(
              isTv: true,
              isDetail: true,
              state: state.recommendations,
              title: "More Like This"
            );
          }
          return Container();
        },
      );
    }

    Widget MainContent(DetailTvResponse detail) {
      return Container(
        margin: EdgeInsets.only(top: 380),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Synopsis(mainDetail: mainDetail, detail: detail),
            SizedBox(height: 20),
            TvTrailerContent(detail),
            SizedBox(height: 20),
            TvCastContent(),
            SizedBox(height: 20),
            TvRecommendationContent(),
            SizedBox(height: 72)
          ],
        ),
      );
    }

    return BlocConsumer<TvDetailCubit, TvDetailState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is TvDetailLoading) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: CircularProgressIndicator(
                color: whiteColor,
              ),
            ),
          );
        }
        if (state is TvDetailFailed) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: RefetchData(
                title: "Failed to get Tv Detail",
                onRefetch: onDetailFetch,
              ),
            ),
          );
        }
        if (state is TvDetailSuccess) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                BackdropImg(
                  detail: state.detail,
                ),
                BackdropLayer(),
                BackdropContent(
                  mainDetail: mainDetail,
                  detail: state.detail,
                ),
                MainContent(state.detail)
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
