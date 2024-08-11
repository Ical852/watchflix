import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/services/movie_services.dart';

part '../states/top_rated_tv_state.dart';

class TopRatedTvCubit extends Cubit<TopRatedTvState> {
  TopRatedTvCubit() : super(TopRatedTvInitial());

  void getTopRatedTv() async {
    emit(TopRatedTvLoading());
    FetchResponse? topRatedTv = await MovieServices().getTopRatedTv();
    if (topRatedTv == null) emit(TopRatedTvFailed("Failed to get top rated"));
    if (isNotNull(topRatedTv)) emit(TopRatedTvSuccess(topRatedTv!));
  }
}
