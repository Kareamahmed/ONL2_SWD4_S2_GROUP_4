import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:striky/core/Errors/failures.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/data/models/user_data/user_crediential.dart';
import 'package:striky/data/repos/Auth/auth_repo.dart';
import 'package:striky/data/source/API/api_service.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});
  @override
  @override
  Future<Either<Failure, String>> login(
    String email,
    String password,
  ) async {
    try {
      final result = await apiService
          .post(url: '$kurlBase/api/Account/login', token: '', body: {
        "email": email,
        "password": password,
      });
      return right(result['token']);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> register(
      String email, String password, String firstname, String lastname) async {
    try {
      final result = await apiService
          .post(url: '$kurlBase/api/Account/register-step1', token: '', body: {
        "firstName": firstname,
        "lastName": lastname,
        "email": email,
        "password": password,
      });
      return right(result['userId']);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> register2(int age, String goal, String level,
      int height, int weight, String id) async {
    try {
      final result = await apiService
          .post(url: '$kurlBase/api/Account/$id', token: '', body: {
        "age": age,
        "height": height,
        "weight": weight,
        "goal": goal,
        "level": level,
      });
      return right(result['userId']);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredientialModel>> accountCredential(
      String id) async {
    try {
      final result = await apiService.post(
        url: '$kurlBase/api/Account/register-step3/$id',
        token: '',
        body: {},
      );

      final user = UserCredientialModel.fromJson(result);
      return right(user);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteEmail(String id) async {
    try {
      final result = await apiService.del(
        url: '$kurlBase/api/Account/$id',
        token: '',
      );

      return right(result as String); // return the response string
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> setPic(String id, File photo) async {
    try {
      final formData = FormData.fromMap({
        'Photo': await MultipartFile.fromFile(photo.path,
            filename: photo.path.split('/').last),
      });

      final response = await Dio().post(
        '$kurlBase/api/Account/register-step3/$id',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      return right(response.data.toString());
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
