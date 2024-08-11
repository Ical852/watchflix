import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/services/movie_services.dart';

part '../states/popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit() : super(PopularMovieInitial());

  void getPopular() async {
    emit(PopularMovieLoading());
    FetchResponse? popular = await MovieServices().getPopular();
    if (popular == null) emit(PopularMovieFailed("Failed to get popular"));
    if (isNotNull(popular)) emit(PopularMovieSuccess(popular!));
  }
}
