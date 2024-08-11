part of '../cubits/top_rated_tv_cubit.dart';

sealed class TopRatedTvState extends Equatable {
  const TopRatedTvState();

  @override
  List<Object> get props => [];
}

final class TopRatedTvInitial extends TopRatedTvState {}

final class TopRatedTvLoading extends TopRatedTvState {}

final class TopRatedTvSuccess extends TopRatedTvState {
  final FetchResponse topRatedTv;

  TopRatedTvSuccess(this.topRatedTv);

  @override
  List<Object> get props => [topRatedTv];
}

final class TopRatedTvFailed extends TopRatedTvState {
  final String error;

  const TopRatedTvFailed(this.error);

  @override
  List<Object> get props => [error];
}
