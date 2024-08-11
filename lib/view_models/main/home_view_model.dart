import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchflix/blocs/cubits/all_trending_today_cubit.dart';
import 'package:watchflix/blocs/cubits/coming_soon_movie_cubit.dart';
import 'package:watchflix/blocs/cubits/now_playing_movie_cubit.dart';
import 'package:watchflix/blocs/cubits/popular_movie_cubit.dart';
import 'package:watchflix/blocs/cubits/popular_tv_cubit.dart';
import 'package:watchflix/blocs/cubits/top_rated_movie_cubit.dart';
import 'package:watchflix/blocs/cubits/top_rated_tv_cubit.dart';
import 'package:watchflix/blocs/cubits/trending_movie_today_cubit.dart';
import 'package:watchflix/blocs/cubits/trending_movie_week_cubit.dart';
import 'package:watchflix/blocs/cubits/trending_tv_today_cubit.dart';
import 'package:watchflix/blocs/cubits/trending_tv_week_cubit.dart';
import 'package:watchflix/functions/global_func.dart';

class HomeViewModel {
  late BuildContext context;

  HomeViewModel(BuildContext context) {
    this.context = context;
  }

  void getTopRated() {
    try {
      context.read<TopRatedMovieCubit>().getTopRated();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get top rated", context);
    }
  }

  void getPopular() {
    try {
      context.read<PopularMovieCubit>().getPopular();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get popular", context);
    }
  }

  void getComingSoon() {
    try {
      context.read<ComingSoonMovieCubit>().getComingSoon();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get coming soon", context);
    }
  }

  void getNowPlaying() {
    try {
      context.read<NowPlayingMovieCubit>().getNowPlaying();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get now playing", context);
    }
  }

  void getTrendingMovieWeek() {
    try {
      context.read<TrendingMovieWeekCubit>().getTrendingMovieWeek();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get trending movie week", context);
    }
  }

  void getTrendingTvWeek() {
    try {
      context.read<TrendingTvWeekCubit>().getTrendingTvWeek();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get trending tv week", context);
    }
  }

  void getPopularTv() {
    try {
      context.read<PopularTvCubit>().getPopularTv();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get popular tv", context);
    }
  }

  void getTrendingMovieToday() {
    try {
      context.read<TrendingMovieTodayCubit>().getTrendingMovieToday();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get trending movie today", context);
    }
  }

  void getTrendingTvToday() {
    try {
      context.read<TrendingTvTodayCubit>().getTrendingTvToday();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get trending tv today", context);
    }
  }

  void getTopRatedTv() {
    try {
      context.read<TopRatedTvCubit>().getTopRatedTv();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get top rated tv", context);
    }
  }

  void getAllTrendingToday() {
    try {
      context.read<AllTrendingTodayCubit>().getAllTrendingToday();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get all trending today", context);
    }
  }
}
