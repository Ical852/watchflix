import 'package:watchflix/models/fetch_response.dart';

class SavedModel {
  late Results result;
  late String type;

  SavedModel(Results result, String type) {
    this.result = result;
    this.type = type;
  }
}