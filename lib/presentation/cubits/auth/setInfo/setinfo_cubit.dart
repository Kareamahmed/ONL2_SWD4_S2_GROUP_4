import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:striky/data/repos/Auth/auth_repo.dart';

part 'setinfo_state.dart';

class SetinfoCubit extends Cubit<SetinfoState> {
  SetinfoCubit(this.authRepo) : super(SetinfoInitial());
  final AuthRepo authRepo;
  Future<void> setinfo(String goal, String level, int height, int weight,
      String id, int age) async {
    emit(SetinfoLoading());
    final result =
        await authRepo.register2(age, goal, level, height, weight, id);
    result.fold((failure) {
      emit(SetinfoFailure(errMsg: failure.errorMSG));
    }, (id) {
      emit(SetinfoSuccess());
    });
  }
}
