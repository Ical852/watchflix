part of '../cubits/movie_cast_cubit.dart';

sealed class MovieCastState extends Equatable {
  const MovieCastState();

  @override
  List<Object> get props => [];
}

final class MovieCastInitial extends MovieCastState {}

final class MovieCastLoading extends MovieCastState {}

final class MovieCastSuccess extends MovieCastState {
  final CastResponse cast;

  MovieCastSuccess(this.cast);

  @override
  List<Object> get props => [cast];
}

final class MovieCastFailed extends MovieCastState {
  final String error;

  const MovieCastFailed(this.error);

  @override
  List<Object> get props => [error];
}
