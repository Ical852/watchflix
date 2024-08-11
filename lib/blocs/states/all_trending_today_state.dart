part of '../cubits/all_trending_today_cubit.dart';

sealed class AllTrendingTodayState extends Equatable {
  const AllTrendingTodayState();

  @override
  List<Object> get props => [];
}

final class AllTrendingTodayInitial extends AllTrendingTodayState {}

final class AllTrendingTodayLoading extends AllTrendingTodayState {}

final class AllTrendingTodaySuccess extends AllTrendingTodayState {
  final FetchResponse allTrending;

  AllTrendingTodaySuccess(this.allTrending);

  @override
  List<Object> get props => [allTrending];
}

final class AllTrendingTodayFailed extends AllTrendingTodayState {
  final String error;

  const AllTrendingTodayFailed(this.error);

  @override
  List<Object> get props => [error];
}
