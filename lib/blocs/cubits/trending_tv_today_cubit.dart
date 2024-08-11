import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/services/movie_services.dart';

part '../states/trending_tv_today_state.dart';

class TrendingTvTodayCubit extends Cubit<TrendingTvTodayState> {
  TrendingTvTodayCubit() : super(TrendingTvTodayInitial());

  void getTrendingTvToday() async {
    emit(TrendingTvTodayLoading());
    FetchResponse? trendingTvToday = await MovieServices().getTrendingTvToday();
    if (trendingTvToday == null) emit(TrendingTvTodayFailed("Failed to get top rated"));
    if (isNotNull(trendingTvToday)) emit(TrendingTvTodaySuccess(trendingTvToday!));
  }
}
