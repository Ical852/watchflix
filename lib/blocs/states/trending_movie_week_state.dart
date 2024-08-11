part of '../cubits/trending_movie_week_cubit.dart';

sealed class TrendingMovieWeekState extends Equatable {
  const TrendingMovieWeekState();

  @override
  List<Object> get props => [];
}

final class TrendingMovieWeekInitial extends TrendingMovieWeekState {}

final class TrendingMovieWeekLoading extends TrendingMovieWeekState {}

final class TrendingMovieWeekSuccess extends TrendingMovieWeekState {
  final FetchResponse trendingMovieWeek;

  TrendingMovieWeekSuccess(this.trendingMovieWeek);

  @override
  List<Object> get props => [trendingMovieWeek];
}

final class TrendingMovieWeekFailed extends TrendingMovieWeekState {
  final String error;

  const TrendingMovieWeekFailed(this.error);

  @override
  List<Object> get props => [error];
}
