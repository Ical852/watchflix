part of '../cubits/tv_recommendations_cubit.dart';

sealed class TvRecommendationsState extends Equatable {
  const TvRecommendationsState();

  @override
  List<Object> get props => [];
}

final class TvRecommendationsInitial extends TvRecommendationsState {}

final class TvRecommendationsLoading extends TvRecommendationsState {}

final class TvRecommendationsSuccess extends TvRecommendationsState {
  final FetchResponse recommendations;

  TvRecommendationsSuccess(this.recommendations);

  @override
  List<Object> get props => [recommendations];
}

final class TvRecommendationsFailed extends TvRecommendationsState {
  final String error;

  const TvRecommendationsFailed(this.error);

  @override
  List<Object> get props => [error];
}
