part of '../cubits/now_playing_movie_cubit.dart';

sealed class NowPlayingMovieState extends Equatable {
  const NowPlayingMovieState();

  @override
  List<Object> get props => [];
}

final class NowPlayingMovieInitial extends NowPlayingMovieState {}

final class NowPlayingMovieLoading extends NowPlayingMovieState {}

final class NowPlayingMovieSuccess extends NowPlayingMovieState {
  final FetchResponse nowPlaying;

  NowPlayingMovieSuccess(this.nowPlaying);

  @override
  List<Object> get props => [nowPlaying];
}

final class NowPlayingMovieFailed extends NowPlayingMovieState {
  final String error;

  const NowPlayingMovieFailed(this.error);

  @override
  List<Object> get props => [error];
}
