import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:striky/data/models/workout/general_exercise_model/general_exercise_model.dart';
import 'package:striky/data/repos/workout/general_workout/general_workout_repo.dart';

part 'excercisescubit_state.dart';

class ExcercisescubitCubit extends Cubit<ExcercisescubitState> {
  ExcercisescubitCubit(this.generalWorkoutRepo) : super(ExcercisescubitInitial());
 final GeneralWorkoutRepo generalWorkoutRepo;

  Future<void> getLOcalExcercises() async {
    emit(ExcercisescubitLoading());
    final result = await  generalWorkoutRepo.getlocalworkout();
    result.fold((failure) {
      emit(ExcercisescubitFailure(errmsg: failure.errorMSG));
    }, (msg) {
      emit(ExcercisescubitSuccess(generalworkouts: msg));
    });
  }
  
}
