import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:striky/data/repos/Auth/auth_repo.dart';

part 'register1_state.dart';

class Register1Cubit extends Cubit<Register1State> {
  Register1Cubit(this.authRepo) : super(Register1Initial());
  final AuthRepo authRepo;
  Future<void> register(
      String email, String password, String firstname, String lastname) async {
    emit(Register1Loading());
    final result =
        await authRepo.register(email, password, firstname, lastname);
    result.fold((failure) {
      emit(Register1Failure(errMsg: failure.errorMSG));
    }, (id) {
      emit(Register1Success(userId: id));
    });
  }
}
