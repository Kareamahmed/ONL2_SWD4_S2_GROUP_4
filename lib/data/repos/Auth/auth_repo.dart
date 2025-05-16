import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:striky/core/Errors/failures.dart';
import 'package:striky/data/models/user_data/user_crediential.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> login(String email, String password);
  Future<Either<Failure, String>> register(
      String email, String password, String firstname, String lastname);
  Future<Either<Failure, dynamic>> register2(
      int age, String goal, String level, int height, int weight, String id);
  Future<Either<Failure, String>> setPic(String id, File photo);
  Future<Either<Failure, UserCredientialModel>> accountCredential(String id);
  Future<Either<Failure, String>> deleteEmail(String id);
}
