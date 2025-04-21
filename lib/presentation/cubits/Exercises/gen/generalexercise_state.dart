part of 'generalexercise_cubit.dart';

@immutable
abstract class GeneralexerciseState {}

class GeneralexerciseInitial extends GeneralexerciseState {}

class GeneralexerciseLoading extends GeneralexerciseState {}

class GeneralexerciseSuccess extends GeneralexerciseState {
  final List<GeneralExerciseModel> generalworkouts;
  GeneralexerciseSuccess({required this.generalworkouts});
}

class GeneralexerciseFailure extends GeneralexerciseState {
  final String errmsg;
  GeneralexerciseFailure({required this.errmsg});
}
