import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/services/movie_services.dart';

part '../states/search_movie_state.dart';

class SearchMovieCubit extends Cubit<SearchMovieState> {
  SearchMovieCubit() : super(SearchMovieInitial());

  void searchMovie(String search) async {
    emit(SearchMovieLoading());
    FetchResponse? searchRes = await MovieServices().searchMovie(search: search);
    if (searchRes == null) emit(SearchMovieFailed("Failed to get search"));
    if (isNotNull(searchRes)) emit(SearchMovieSuccess(searchRes!));
  }
}
