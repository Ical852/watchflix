part of '../cubits/search_movie_cubit.dart';

sealed class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

final class SearchMovieInitial extends SearchMovieState {}

final class SearchMovieLoading extends SearchMovieState {}

final class SearchMovieSuccess extends SearchMovieState {
  final FetchResponse search;

  SearchMovieSuccess(this.search);

  @override
  List<Object> get props => [search];
}

final class SearchMovieFailed extends SearchMovieState {
  final String error;

  const SearchMovieFailed(this.error);

  @override
  List<Object> get props => [error];
}
