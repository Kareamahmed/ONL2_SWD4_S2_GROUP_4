import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:striky/core/Errors/failures.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/data/models/workout/general_exercise_model/general_exercise_model.dart';
import 'package:striky/data/repos/workout/general_workout/general_workout_repo.dart';
import 'package:striky/data/source/API/api_service.dart';

class GeneralWorkoutRepoImpl implements GeneralWorkoutRepo {
  final ApiService apiService;

  GeneralWorkoutRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<GeneralExerciseModel>>>
      getGeneralWorkout() async {
    try {
      final response =
          await apiService.get(url: '$kurlBase/api/Category/GetAll');
      final List<GeneralExerciseModel> result = (response as List)
          .map((data) => GeneralExerciseModel.fromJson(data))
          .toList();
      for (var exercise in result) {
        String fullImageUrl =
            '${kurlBase}${exercise.photoUrl}'; 
        print(
            'ID: ${exercise.id}, Name: ${exercise.name}, Full Photo URL: $fullImageUrl');
      }
      return right(result);
    } on DioException catch (dioException) {
      return left(ServerFailure.DioException(dioException));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getlocalworkout() async{
   try {
     final response =
          await apiService.get(url: '${kurlBase}/exercises/bodyPartList',token: '980692b518mshd391448e6e56938p1b16dajsnOa90141f353d');
          return right(response);
   } catch (e) {
     return left(ServerFailure(e.toString()));
   }
  }

  @override
  Future<Either<Failure, GeneralExerciseModel>> getworkoutdetails() {
    // TODO: implement getworkoutdetails
    throw UnimplementedError();
  }
}
