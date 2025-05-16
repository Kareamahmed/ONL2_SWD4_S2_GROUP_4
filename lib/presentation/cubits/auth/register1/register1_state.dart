part of 'register1_cubit.dart';

@immutable
abstract class Register1State {}

class Register1Initial extends Register1State {}

class Register1Loading extends Register1State {}

class Register1Success extends Register1State {
  final String userId;
  Register1Success({required this.userId});
}

class Register1Failure extends Register1State {
  final String errMsg;
  Register1Failure({required this.errMsg});
}
