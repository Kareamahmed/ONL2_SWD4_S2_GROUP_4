
import 'package:dartz/dartz.dart';
import 'package:striky/core/Errors/failures.dart';
import 'package:striky/data/models/profile/profile.dart';

abstract class HomeRepo {
  Future<Either<Failure, ProfileModel>> getProfileData(String id);
}