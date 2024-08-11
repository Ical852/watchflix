part of '../cubits/movie_recommendations_cubit.dart';

sealed class MovieRecommendationsState extends Equatable {
  const MovieRecommendationsState();

  @override
  List<Object> get props => [];
}

final class MovieRecommendationsInitial extends MovieRecommendationsState {}

final class MovieRecommendationsLoading extends MovieRecommendationsState {}

final class MovieRecommendationsSuccess extends MovieRecommendationsState {
  final FetchResponse recommendations;

  MovieRecommendationsSuccess(this.recommendations);

  @override
  List<Object> get props => [recommendations];
}

final class MovieRecommendationsFailed extends MovieRecommendationsState {
  final String error;

  const MovieRecommendationsFailed(this.error);

  @override
  List<Object> get props => [error];
}
