import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/cast_response.dart';
import 'package:watchflix/services/movie_services.dart';

part '../states/movie_cast_state.dart';

class MovieCastCubit extends Cubit<MovieCastState> {
  MovieCastCubit() : super(MovieCastInitial());

  void getMovieCasts(String id) async {
    emit(MovieCastLoading());
    CastResponse? topRated = await MovieServices().getMovieCasts(id: id);
    if (topRated == null) emit(MovieCastFailed("Failed to get coming soon"));
    if (isNotNull(topRated)) emit(MovieCastSuccess(topRated!));
  }
}
