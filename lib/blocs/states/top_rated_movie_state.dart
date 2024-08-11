part of '../cubits/top_rated_movie_cubit.dart';

sealed class TopRatedMovieState extends Equatable {
  const TopRatedMovieState();

  @override
  List<Object> get props => [];
}

final class TopRatedMovieInitial extends TopRatedMovieState {}

final class TopRatedMovieLoading extends TopRatedMovieState {}

final class TopRatedMovieSuccess extends TopRatedMovieState {
  final FetchResponse topRated;

  TopRatedMovieSuccess(this.topRated);

  @override
  List<Object> get props => [topRated];
}

final class TopRatedMovieFailed extends TopRatedMovieState {
  final String error;

  const TopRatedMovieFailed(this.error);

  @override
  List<Object> get props => [error];
}
