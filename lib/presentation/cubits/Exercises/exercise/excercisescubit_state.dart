part of 'excercisescubit_cubit.dart';

@immutable
abstract class ExcercisescubitState {}

class ExcercisescubitInitial extends ExcercisescubitState {}
class ExcercisescubitLoading extends ExcercisescubitState {}
class ExcercisescubitSuccess extends ExcercisescubitState {
  final List<String> generalworkouts;
  ExcercisescubitSuccess({required this.generalworkouts});
}
class ExcercisescubitFailure extends ExcercisescubitState {
  final String errmsg;
  ExcercisescubitFailure({required this.errmsg});
}


