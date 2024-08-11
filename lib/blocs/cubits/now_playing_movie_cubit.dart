import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/services/movie_services.dart';

part '../states/now_playing_movie_state.dart';

class NowPlayingMovieCubit extends Cubit<NowPlayingMovieState> {
  NowPlayingMovieCubit() : super(NowPlayingMovieInitial());

  void getNowPlaying() async {
    emit(NowPlayingMovieLoading());
    FetchResponse? popular = await MovieServices().getNowPlaying();
    if (popular == null) emit(NowPlayingMovieFailed("Failed to get now playing"));
    if (isNotNull(popular)) emit(NowPlayingMovieSuccess(popular!));
  }
}
