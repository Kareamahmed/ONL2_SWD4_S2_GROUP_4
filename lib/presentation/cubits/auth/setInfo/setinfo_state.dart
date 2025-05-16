part of 'setinfo_cubit.dart';

@immutable
abstract class SetinfoState {}

class SetinfoInitial extends SetinfoState {}

class SetinfoLoading extends SetinfoState {}

class SetinfoSuccess extends SetinfoState {}

class SetinfoFailure extends SetinfoState {
  final String errMsg;
  SetinfoFailure({required this.errMsg});
}
