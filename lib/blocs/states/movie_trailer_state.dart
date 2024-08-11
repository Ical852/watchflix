part of '../cubits/movie_trailer_cubit.dart';

sealed class MovieTrailerState extends Equatable {
  const MovieTrailerState();

  @override
  List<Object> get props => [];
}

final class MovieTrailerInitial extends MovieTrailerState {}

final class MovieTrailerLoading extends MovieTrailerState {}

final class MovieTrailerSuccess extends MovieTrailerState {
  final TrailerResponse trailer;

  MovieTrailerSuccess(this.trailer);

  @override
  List<Object> get props => [trailer];
}

final class MovieTrailerFailed extends MovieTrailerState {
  final String error;

  const MovieTrailerFailed(this.error);

  @override
  List<Object> get props => [error];
}
