import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/model/error_model.dart';
import 'package:healthcare/model/user_model.dart';

// next task : token vaerfication add when open app  when remmeber me active do it with sharedPref
//use either
class AuthDataSource {
  final Dio dio;
  AuthDataSource({required this.dio});
  Future<Either<String, UserModel>> login(Map<String, String> data) async {
    try {
      final response = await dio.post(ApiConstances.loginUrl, data: data);
      //the error from here

      UserModel user = UserModel.fromJson(response.data);

      return Right(user);
    } on DioException catch (e) {
      ErrorModel errorModel2 = ErrorModel.fromJson(e.response?.data ??
          {'message': "No Internet Connection", 'Error': "Internet related"});

      if (e.response?.statusCode == 403) {
        Get.toNamed("/OtpVerficationScreen");
        return Left(errorModel2.message ?? 'Connection error');
      } else {
        return Left(errorModel2.message ?? 'Connection error');
      }
    } catch (e) {
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, void>> verficationCode(Map<String, String> data) async {
    try {
      final response = await dio.post(ApiConstances.confirmEmail, data: data);
      box?.write("Token2", response.data['token']);
      return const Right(null);
    } on DioException catch (e) {
      ErrorModel errorModel2 = ErrorModel.fromJson(e.response?.data ??
          {'message': "No Internet Connection", 'Error': "Internet related"});

      return Left(
          errorModel2.message ?? 'String must contain exactly 4 character(s)');
    } catch (e) {
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, UserModel>> register(Map<String, String> data) async {
    try {
      final response = await dio.post(
        ApiConstances.registerUrl,
        data: data,
      );

      UserModel user = UserModel.fromJson(response.data);

      return Right(user);
    } on DioException catch (e) {
      ErrorModel errorModel2 = ErrorModel.fromJson(e.response?.data ??
          {'message': "No Internet Connection", 'Error': "Internet related"});

      if (e.response?.statusCode == 403) {
        Get.toNamed("/OtpVerficationScreen");
        return Left(errorModel2.message ?? 'Connection error');
      } else {
        ErrorModel errorModel2 = ErrorModel.fromJson(e.response?.data ??
            {'message': "No Internet Connection", 'Error': "Internet related"});

        return Left(errorModel2.message ?? 'Connection error');
      }
    } catch (e) {
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, void>> forgotPassword(Map<String, String> data) async {
    try {
      await dio.post(ApiConstances.forgotPassword, data: data);
      return const Right(null);
    } on DioException catch (e) {
      ErrorModel errorModel = ErrorModel.fromJson(e.response?.data ??
          {'message': "No Internet Connection", 'Error': "Internet related"});

      return Left(errorModel.message ?? 'Connection Error');
    } catch (e) {
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, User>> getMe(String token) async {
    try {
      final response = await dio.get(
        ApiConstances.getMe,
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );
      User user = User.fromJson(response.data);
      return Right(user);
    } on DioException catch (e) {
      ErrorModel errorModel = ErrorModel.fromJson(e.response?.data ??
          {'message': "No Internet Connection", 'Error': "Internet related"});
      return Left(errorModel.message ?? 'Connection Error');
    } catch (e) {
      return const Left('An unexpected error occurred');
    }
  }
}
