part of '../cubits/trending_movie_today_cubit.dart';

sealed class TrendingMovieTodayState extends Equatable {
  const TrendingMovieTodayState();

  @override
  List<Object> get props => [];
}

final class TrendingMovieTodayInitial extends TrendingMovieTodayState {}

final class TrendingMovieTodayLoading extends TrendingMovieTodayState {}

final class TrendingMovieTodaySuccess extends TrendingMovieTodayState {
  final FetchResponse trendingMovieToday;

  TrendingMovieTodaySuccess(this.trendingMovieToday);

  @override
  List<Object> get props => [trendingMovieToday];
}

final class TrendingMovieTodayFailed extends TrendingMovieTodayState {
  final String error;

  const TrendingMovieTodayFailed(this.error);

  @override
  List<Object> get props => [error];
}


