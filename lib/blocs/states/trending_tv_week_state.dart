part of '../cubits/trending_tv_week_cubit.dart';

sealed class TrendingTvWeekState extends Equatable {
  const TrendingTvWeekState();

  @override
  List<Object> get props => [];
}

final class TrendingTvWeekInitial extends TrendingTvWeekState {}

final class TrendingTvWeekLoading extends TrendingTvWeekState {}

final class TrendingTvWeekSuccess extends TrendingTvWeekState {
  final FetchResponse trendingTvWeek;

  TrendingTvWeekSuccess(this.trendingTvWeek);

  @override
  List<Object> get props => [trendingTvWeek];
}

final class TrendingTvWeekFailed extends TrendingTvWeekState {
  final String error;

  const TrendingTvWeekFailed(this.error);

  @override
  List<Object> get props => [error];
}
