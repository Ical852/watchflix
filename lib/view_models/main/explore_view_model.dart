import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchflix/blocs/cubits/search_movie_cubit.dart';
import 'package:watchflix/blocs/cubits/search_tv_cubit.dart';
import 'package:watchflix/functions/global_func.dart';

class ExploreViewModel {
  late BuildContext context;

  ExploreViewModel(BuildContext context) {
    this.context = context;
  }

  void searchMovie(String search) {
    try {
      context.read<SearchMovieCubit>().searchMovie(search);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get search", context);
    }
  }

  void searchTv(String search) {
    try {
      context.read<SearchTvCubit>().searchTv(search);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get search", context);
    }
  }
}
