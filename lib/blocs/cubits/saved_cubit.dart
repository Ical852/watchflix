import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/models/saved_model.dart';

part '../states/saved_state.dart';

class SavedCubit extends Cubit<List<SavedModel>> {
  SavedCubit() : super([]);

  bool saveMovie(Results result, String type) {
    try {
      var newState = state;
      newState.add(SavedModel(result, type));
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool removeMovie(int id) {
    try {
      var newState = state;
      newState.removeWhere((movie) => movie.result.id == id);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isSaved(int id) {
    try {
      var newState = state;
      var find = newState.firstWhere(
        (movie) => movie.result.id == id,
      );
      return find.result.id != null;
    } catch (e) {
      return false;
    }
  }
}
