part of '../cubits/movie_detail_cubit.dart';

sealed class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

final class MovieDetailInitial extends MovieDetailState {}

final class MovieDetailLoading extends MovieDetailState {}

final class MovieDetailSuccess extends MovieDetailState {
  final DetailResponse detail;

  MovieDetailSuccess(this.detail);

  @override
  List<Object> get props => [detail];
}

final class MovieDetailFailed extends MovieDetailState {
  final String error;

  const MovieDetailFailed(this.error);

  @override
  List<Object> get props => [error];
}
