import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchflix/blocs/cubits/movie_cast_cubit.dart';
import 'package:watchflix/blocs/cubits/movie_detail_cubit.dart';
import 'package:watchflix/blocs/cubits/movie_recommendations_cubit.dart';
import 'package:watchflix/blocs/cubits/movie_trailer_cubit.dart';
import 'package:watchflix/blocs/cubits/tv_cast_cubit.dart';
import 'package:watchflix/blocs/cubits/tv_detail_cubit.dart';
import 'package:watchflix/blocs/cubits/tv_recommendations_cubit.dart';
import 'package:watchflix/blocs/cubits/tv_trailer_cubit.dart';
import 'package:watchflix/functions/global_func.dart';

class DetailViewModel {
  late BuildContext context;

  DetailViewModel(BuildContext context) {
    this.context = context;
  }

  void getDetail(String id) {
    try {
      context.read<MovieDetailCubit>().getMovieDetail(id);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get detail", context);
    }
  }

  void getDetailTv(String id) {
    try {
      context.read<TvDetailCubit>().getTvDetail(id);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get detail tv", context);
    }
  }

  void getRecommendations(String id) {
    try {
      context.read<MovieRecommendationsCubit>().getMovieRecommendations(id);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get recommendations", context);
    }
  }

  void getRecommendationsTv(String id) {
    try {
      context.read<TvRecommendationsCubit>().getTvRecommendations(id);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get tv recommendations", context);
    }
  }

  void getCasts(String id) {
    try {
      context.read<MovieCastCubit>().getMovieCasts(id);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get casts", context);
    }
  }

  void getCastsTv(String id) {
    try {
      context.read<TvCastCubit>().getTvCasts(id);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get casts tv", context);
    }
  }

  void getTrailer(String id) {
    try {
      context.read<MovieTrailerCubit>().getMovieTrailers(id);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get trailer", context);
    }
  }

  void getTrailerTv(String id) {
    try {
      context.read<TvTrailerCubit>().getTvTrailers(id);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get trailer tv", context);
    }
  }
}
