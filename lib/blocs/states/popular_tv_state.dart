part of '../cubits/popular_tv_cubit.dart';

sealed class PopularTvState extends Equatable {
  const PopularTvState();

  @override
  List<Object> get props => [];
}

final class PopularTvInitial extends PopularTvState {}

final class PopularTvLoading extends PopularTvState {}

final class PopularTvSuccess extends PopularTvState {
  final FetchResponse popularTv;

  PopularTvSuccess(this.popularTv);

  @override
  List<Object> get props => [popularTv];
}

final class PopularTvFailed extends PopularTvState {
  final String error;

  const PopularTvFailed(this.error);

  @override
  List<Object> get props => [error];
}
