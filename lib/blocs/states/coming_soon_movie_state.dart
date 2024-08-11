part of '../cubits/coming_soon_movie_cubit.dart';

sealed class ComingSoonMovieState extends Equatable {
  const ComingSoonMovieState();

  @override
  List<Object> get props => [];
}

final class ComingSoonMovieInitial extends ComingSoonMovieState {}

final class ComingSoonMovieLoading extends ComingSoonMovieState {}

final class ComingSoonMovieSuccess extends ComingSoonMovieState {
  final FetchResponse comingSoon;

  ComingSoonMovieSuccess(this.comingSoon);

  @override
  List<Object> get props => [comingSoon];
}

final class ComingSoonMovieFailed extends ComingSoonMovieState {
  final String error;

  const ComingSoonMovieFailed(this.error);

  @override
  List<Object> get props => [error];
}
