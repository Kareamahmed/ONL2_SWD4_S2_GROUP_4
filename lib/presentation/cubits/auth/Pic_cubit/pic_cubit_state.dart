part of 'pic_cubit_cubit.dart';

@immutable
abstract class PicCubitState {}

class PicCubitInitial extends PicCubitState {}

class PicCubitLoading extends PicCubitState {}

class PicCubitSuccess extends PicCubitState {
  final String mesg;
  PicCubitSuccess({required this.mesg});
}

class PicCubitFailure extends PicCubitState {
  final String errMsg;
  PicCubitFailure({required this.errMsg});
}
