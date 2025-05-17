import 'package:dartz/dartz.dart';
import 'package:striky/core/Errors/failures.dart';
import 'package:striky/data/models/workout/general_exercise_model/general_exercise_model.dart';

abstract class GeneralWorkoutRepo {
  Future<Either<Failure, List<GeneralExerciseModel>>> getGeneralWorkout();
  Future<Either<Failure, List<String>>> getlocalworkout();
  Future<Either<Failure, GeneralExerciseModel>> getworkoutdetails();
}
