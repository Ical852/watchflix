import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/services/movie_services.dart';

part '../states/all_trending_today_state.dart';

class AllTrendingTodayCubit extends Cubit<AllTrendingTodayState> {
  AllTrendingTodayCubit() : super(AllTrendingTodayInitial());

  void getAllTrendingToday() async {
    emit(AllTrendingTodayLoading());
    FetchResponse? topRated = await MovieServices().getAllTrendingToday();
    if (topRated == null) emit(AllTrendingTodayFailed("Failed to get coming soon"));
    if (isNotNull(topRated)) emit(AllTrendingTodaySuccess(topRated!));
  }
}
