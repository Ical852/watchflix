import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/services/movie_services.dart';

part '../states/trending_movie_week_state.dart';

class TrendingMovieWeekCubit extends Cubit<TrendingMovieWeekState> {
  TrendingMovieWeekCubit() : super(TrendingMovieWeekInitial());

  void getTrendingMovieWeek() async {
    emit(TrendingMovieWeekLoading());
    FetchResponse? trendingMovieWeek = await MovieServices().getTrendingMovieWeek();
    if (trendingMovieWeek == null) emit(TrendingMovieWeekFailed("Failed to get top rated"));
    if (isNotNull(trendingMovieWeek)) emit(TrendingMovieWeekSuccess(trendingMovieWeek!));
  }
}
