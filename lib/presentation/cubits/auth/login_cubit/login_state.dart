part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;
  LoginSuccess({required this.token});
}

class LoginFailure extends LoginState {
  final String errmsg;
  LoginFailure({required this.errmsg});
}
