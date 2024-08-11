import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/services/movie_services.dart';

part '../states/trending_tv_week_state.dart';

class TrendingTvWeekCubit extends Cubit<TrendingTvWeekState> {
  TrendingTvWeekCubit() : super(TrendingTvWeekInitial());

  void getTrendingTvWeek() async {
    emit(TrendingTvWeekLoading());
    FetchResponse? trendingTvWeek = await MovieServices().getTrendingTvWeek();
    if (trendingTvWeek == null) emit(TrendingTvWeekFailed("Failed to get top rated"));
    if (isNotNull(trendingTvWeek)) emit(TrendingTvWeekSuccess(trendingTvWeek!));
  }
}
