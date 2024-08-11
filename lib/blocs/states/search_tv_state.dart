part of '../cubits/search_tv_cubit.dart';

sealed class SearchTvState extends Equatable {
  const SearchTvState();

  @override
  List<Object> get props => [];
}

final class SearchTvInitial extends SearchTvState {}

final class SearchTvLoading extends SearchTvState {}

final class SearchTvSuccess extends SearchTvState {
  final FetchResponse search;

  SearchTvSuccess(this.search);

  @override
  List<Object> get props => [search];
}

final class SearchTvFailed extends SearchTvState {
  final String error;

  const SearchTvFailed(this.error);

  @override
  List<Object> get props => [error];
}
