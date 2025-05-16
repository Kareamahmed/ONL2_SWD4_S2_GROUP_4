import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:striky/data/repos/Auth/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;
  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await authRepo.login(email, password);
    result.fold((failure) {
      emit(LoginFailure(errmsg: failure.errorMSG));
    }, (token) {
      emit(LoginSuccess(token: token));
    });
  }
}
