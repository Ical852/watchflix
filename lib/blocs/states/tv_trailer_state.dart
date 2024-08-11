part of '../cubits/tv_trailer_cubit.dart';

sealed class TvTrailerState extends Equatable {
  const TvTrailerState();

  @override
  List<Object> get props => [];
}

final class TvTrailerInitial extends TvTrailerState {}

final class TvTrailerLoading extends TvTrailerState {}

final class TvTrailerSuccess extends TvTrailerState {
  final TrailerResponse trailer;

  TvTrailerSuccess(this.trailer);

  @override
  List<Object> get props => [trailer];
}

final class TvTrailerFailed extends TvTrailerState {
  final String error;

  const TvTrailerFailed(this.error);

  @override
  List<Object> get props => [error];
}
