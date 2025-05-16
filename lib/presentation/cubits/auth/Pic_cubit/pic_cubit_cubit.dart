import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:striky/data/repos/Auth/auth_repo.dart';

part 'pic_cubit_state.dart';

class PicCubitCubit extends Cubit<PicCubitState> {
  PicCubitCubit(this.authRepo) : super(PicCubitInitial());
  final AuthRepo authRepo;

  Future<void> setPic(String id, File photo) async {
    emit(PicCubitLoading());
    final result = await authRepo.setPic(id, photo);
    result.fold((failure) {
      emit(PicCubitFailure(errMsg: failure.errorMSG));
    }, (msg) {
      emit(PicCubitSuccess(mesg: msg));
    });
  }
}
