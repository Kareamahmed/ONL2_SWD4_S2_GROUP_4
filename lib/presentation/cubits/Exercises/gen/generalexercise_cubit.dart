import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:striky/data/models/workout/general_exercise_model/general_exercise_model.dart';
import 'package:striky/data/repos/workout/general_workout/general_workout_repo.dart';

part 'generalexercise_state.dart';

class GeneralexerciseCubit extends Cubit<GeneralexerciseState> {
  GeneralexerciseCubit(this.generalWorkoutRepo)
      : super(GeneralexerciseInitial());
  final GeneralWorkoutRepo generalWorkoutRepo;

  Future<void> getGeneralWorkout() async {
    emit(GeneralexerciseLoading());
    var result = await generalWorkoutRepo.getGeneralWorkout();
    result.fold((failure) {
      emit(GeneralexerciseFailure(errmsg: failure.errorMSG));
    }, (generalWorkout) {
      emit(GeneralexerciseSuccess(generalworkouts: generalWorkout));
    });
  }
}
