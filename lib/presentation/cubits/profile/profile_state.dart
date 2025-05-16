part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileModel profile;
  ProfileSuccess({required this.profile});
}

class ProfileFailure extends ProfileState {
  final String errMsg;
  ProfileFailure({required this.errMsg});
}
