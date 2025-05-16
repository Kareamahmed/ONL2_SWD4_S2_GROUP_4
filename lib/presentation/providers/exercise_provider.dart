import 'package:flutter/foundation.dart';
import 'package:striky/data/models/workout/exercise_model.dart';
import 'package:striky/data/source/API/DBRabid_service.dart';


class ExerciseProvider with ChangeNotifier {
  final ExerciseDBService _service = ExerciseDBService();
  
  List<Exercise> _exercises = [];
  bool _isLoading = false;
  String _error = '';

  List<Exercise> get exercises => _exercises;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchExercisesByBodyPart(String bodyPart) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _exercises = await _service.getExercisesByBodyPart(bodyPart);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Exercise> getExerciseById(String id) async {
    try {
      return await _service.getExerciseById(id);
    } catch (e) {
      throw Exception('Failed to load exercise details');
    }
  }
}