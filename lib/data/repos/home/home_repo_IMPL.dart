import 'package:dartz/dartz.dart';
import 'package:striky/core/Errors/failures.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/data/models/profile/profile.dart';
import 'package:striky/data/repos/home/home_repo.dart';
import 'package:striky/data/source/API/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, ProfileModel>> getProfileData(String id) async {
  try {
    final result = await apiService.get(url: '$kurlBase/api/Account/$id');
    return right(ProfileModel.fromJson(result));
  } catch (e) {
    return left(ServerFailure(e.toString()));
  }
}

}
