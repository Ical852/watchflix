import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/services/movie_services.dart';

part '../states/top_rated_movie_state.dart';

class TopRatedMovieCubit extends Cubit<TopRatedMovieState> {
  TopRatedMovieCubit() : super(TopRatedMovieInitial());

  void getTopRated() async {
    emit(TopRatedMovieLoading());
    FetchResponse? topRated = await MovieServices().getTopRated();
    if (topRated == null) emit(TopRatedMovieFailed("Failed to get top rated"));
    if (isNotNull(topRated)) emit(TopRatedMovieSuccess(topRated!));
  }
}
