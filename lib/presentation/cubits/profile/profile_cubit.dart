import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:striky/data/models/profile/profile.dart';
import 'package:striky/data/repos/home/home_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.homeRepo) : super(ProfileInitial());
   final HomeRepo homeRepo;

  Future<void> getProfile(String id) async {
    emit(ProfileLoading());
    final result = await homeRepo.getProfileData(id);
    result.fold((failure) {
      emit(ProfileFailure(errMsg: failure.errorMSG));
    }, (profile) {
      emit(ProfileSuccess(profile: profile));
    });
  }
}
