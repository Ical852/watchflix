part of '../cubits/popular_movie_cubit.dart';

sealed class PopularMovieState extends Equatable {
  const PopularMovieState();

  @override
  List<Object> get props => [];
}

final class PopularMovieInitial extends PopularMovieState {}

final class PopularMovieLoading extends PopularMovieState {}

final class PopularMovieSuccess extends PopularMovieState {
  final FetchResponse popular;

  PopularMovieSuccess(this.popular);

  @override
  List<Object> get props => [popular];
}

final class PopularMovieFailed extends PopularMovieState {
  final String error;

  const PopularMovieFailed(this.error);

  @override
  List<Object> get props => [error];
}
