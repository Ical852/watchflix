part of '../cubits/tv_cast_cubit.dart';

sealed class TvCastState extends Equatable {
  const TvCastState();

  @override
  List<Object> get props => [];
}

final class TvCastInitial extends TvCastState {}

final class TvCastLoading extends TvCastState {}

final class TvCastSuccess extends TvCastState {
  final CastResponse cast;

  TvCastSuccess(this.cast);

  @override
  List<Object> get props => [cast];
}

final class TvCastFailed extends TvCastState {
  final String error;

  const TvCastFailed(this.error);

  @override
  List<Object> get props => [error];
}
