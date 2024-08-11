import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/trailer_response.dart';
import 'package:watchflix/services/movie_services.dart';

part '../states/tv_trailer_state.dart';

class TvTrailerCubit extends Cubit<TvTrailerState> {
  TvTrailerCubit() : super(TvTrailerInitial());

  void getTvTrailers(String id) async {
    emit(TvTrailerLoading());
    TrailerResponse? topRated = await MovieServices().getTvTrailers(id: id);
    if (topRated == null) emit(TvTrailerFailed("Failed to get coming soon"));
    if (isNotNull(topRated)) emit(TvTrailerSuccess(topRated!));
  }
}
