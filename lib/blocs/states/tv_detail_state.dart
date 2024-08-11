part of '../cubits/tv_detail_cubit.dart';

sealed class TvDetailState extends Equatable {
  const TvDetailState();

  @override
  List<Object> get props => [];
}

final class TvDetailInitial extends TvDetailState {}

final class TvDetailLoading extends TvDetailState {}

final class TvDetailSuccess extends TvDetailState {
  final DetailTvResponse detail;

  TvDetailSuccess(this.detail);

  @override
  List<Object> get props => [detail];
}

final class TvDetailFailed extends TvDetailState {
  final String error;

  const TvDetailFailed(this.error);

  @override
  List<Object> get props => [error];
}
