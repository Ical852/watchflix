import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchflix/blocs/cubits/movie_cast_cubit.dart';
import 'package:watchflix/blocs/cubits/movie_detail_cubit.dart';
import 'package:watchflix/blocs/cubits/movie_recommendations_cubit.dart';
import 'package:watchflix/blocs/cubits/movie_trailer_cubit.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/detail_response.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/screens/detail_pages/movie/partials/backdrop_content.dart';
import 'package:watchflix/screens/detail_pages/movie/partials/backdrop_img.dart';
import 'package:watchflix/screens/detail_pages/movie/partials/backdrop_layer.dart';
import 'package:watchflix/screens/detail_pages/movie/partials/cast.dart';
import 'package:watchflix/screens/detail_pages/movie/partials/synopsis.dart';
import 'package:watchflix/screens/detail_pages/movie/partials/trailer.dart';
import 'package:watchflix/shared/constants.dart';
import 'package:watchflix/widgets/loading_custom.dart';
import 'package:watchflix/widgets/refetch_data.dart';
import 'package:watchflix/widgets/row_slide_content.dart';

// ignore: must_be_immutable
class DetailMovie extends StatelessWidget {
  Function() 
    onDetailFetch,
    onRecommendFetch,
    onCastFetch,
    onTrailerFetch;
  Results mainDetail;
  
  DetailMovie({
    super.key,
    required this.onDetailFetch, 
    required this.onRecommendFetch, 
    required this.onCastFetch, 
    required this.onTrailerFetch,
    required this.mainDetail,
  });

  @override
  Widget build(BuildContext context) {
    Widget TrailerContent(DetailResponse detail) {
      return BlocConsumer<MovieTrailerCubit, MovieTrailerState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MovieTrailerLoading) return LoadingCustom();
          if (state is MovieTrailerFailed) {
            return RefetchData(
              title: "Failed to get Trailer Data",
              onRefetch: onTrailerFetch,
            );
          }
          if (state is MovieTrailerSuccess) {
            return Trailer(
              trailer: state.trailer,
              detail: detail,
            );
          }
          return Container();
        },
      );
    }
    
    Widget MovieCastContent() {
      return BlocConsumer<MovieCastCubit, MovieCastState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MovieCastLoading) return LoadingCustom();
          if (state is MovieCastFailed) {
            return RefetchData(
              title: "Failed to get Movie Cast",
              onRefetch: onCastFetch,
            );
          }
          if (state is MovieCastSuccess) return Cast(state: state.cast);
          return Container();
        },
      );
    }

    Widget MovieRecommendationContent() {
      return BlocConsumer<MovieRecommendationsCubit, MovieRecommendationsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MovieRecommendationsLoading) return LoadingCustom();
          if (state is MovieRecommendationsFailed) {
            return RefetchData(
              title: "Failed to get Movie Recommendations",
              onRefetch: onRecommendFetch,
            );
          }
          if (state is MovieRecommendationsSuccess) {
            return RowSlideContent(
              isDetail: true,
              state: state.recommendations,
              title: "More Like This"
            );
          }
          return Container();
        },
      );
    }

    Widget MainContent(DetailResponse detail) {
      return Container(
        margin: EdgeInsets.only(top: 380),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Synopsis(detail: detail),
            SizedBox(height: 20),
            TrailerContent(detail),
            SizedBox(height: 20),
            MovieCastContent(),
            SizedBox(height: 20),
            MovieRecommendationContent(),
            SizedBox(height: 72)
          ],
        ),
      );
    }

    return BlocConsumer<MovieDetailCubit, MovieDetailState>(
      listener: (context, state) {
        if (state is MovieDetailFailed) {
          showGLobalAlert("danger", "Failed to get Movie Detail", context);
        }
      },
      builder: (context, state) {
        if (state is MovieDetailLoading) {
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
        if (state is MovieDetailFailed) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: RefetchData(
                title: "Failed to get Movie Detail",
                onRefetch: onDetailFetch,
              ),
            ),
          );
        }
        if (state is MovieDetailSuccess) {
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