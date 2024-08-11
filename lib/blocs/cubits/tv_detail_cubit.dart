import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchflix/functions/global_func.dart';
import 'package:watchflix/models/detail_tv_response.dart';
import 'package:watchflix/services/movie_services.dart';

part '../states/tv_detail_state.dart';

class TvDetailCubit extends Cubit<TvDetailState> {
  TvDetailCubit() : super(TvDetailInitial());

  void getTvDetail(String id) async {
    emit(TvDetailLoading());
    DetailTvResponse? detail = await MovieServices().getTvDetail(id: id);
    if (detail == null) emit(TvDetailFailed("Failed to get now playing"));
    if (isNotNull(detail)) emit(TvDetailSuccess(detail!));
  }
}
