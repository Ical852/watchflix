part of '../cubits/trending_tv_today_cubit.dart';

sealed class TrendingTvTodayState extends Equatable {
  const TrendingTvTodayState();

  @override
  List<Object> get props => [];
}

final class TrendingTvTodayInitial extends TrendingTvTodayState {}

final class TrendingTvTodayLoading extends TrendingTvTodayState {}

final class TrendingTvTodaySuccess extends TrendingTvTodayState {
  final FetchResponse trendingTvToday;

  TrendingTvTodaySuccess(this.trendingTvToday);

  @override
  List<Object> get props => [trendingTvToday];
}

final class TrendingTvTodayFailed extends TrendingTvTodayState {
  final String error;

  const TrendingTvTodayFailed(this.error);

  @override
  List<Object> get props => [error];
}
