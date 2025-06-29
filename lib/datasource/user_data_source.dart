import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/model/error_model.dart';
//permission problem

class UserDataSource {
  Future<Either<String, void>> updateUserProfileWithImage(
      Map<String, dynamic> data, String? path, bool logedIn) async {
    try {
      if (path == null) {
        return const Left('No image path provided');
      }

      // Verify file exists and is readable
      final file = File(path);
      if (!await file.exists()) {
        return const Left('Image file not found');
      }

      // Get file extension
      String extension = path.split('.').last.toLowerCase();
      String mimeType;
      switch (extension) {
        case 'jpg':
        case 'jpeg':
          mimeType = 'image/jpeg';
          break;
        case 'png':
          mimeType = 'image/png';
          break;
        default:
          mimeType = 'image/jpeg'; // default to jpeg
      }

      // Create FormData
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          path,
          filename: path.split('/').last,
          contentType: DioMediaType.parse(mimeType),
        ),
        if (data.containsKey('name')) 'name': data['name'],
        if (data.containsKey('phone')) 'phone': data['phone'],
      });

      final dio = Dio();

      // Add logging interceptor
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ));
      if (logedIn == false) {}

      final response = await dio.put(
        logedIn
            ? "${ApiConstances.updateUser}/${box?.read("User").id}"
            : "${ApiConstances.updateUser}/${box?.read("id")}",
        data: formData,
        options: Options(
          headers: {
            'Authorization':
                "Bearer ${logedIn ? box?.read("Token") : box?.read("Token2")}",
          },
          followRedirects: true,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        // Handle permission error specifically
        if (response.data['error']?.contains('permission') == true) {
          return const Left(
              'You do not have permission to access this resource');
        }

        return Left(response.data['message'] ?? 'Update failed');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        ErrorModel errorModel2 = ErrorModel.fromJson(e.response?.data ??
            {'message': "No Internet Connection", 'Error': "Internet related"});
        return Left(errorModel2.message ?? 'Connection error');
      }
      return Left(e.message ?? 'Connection error');
    } catch (e) {
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, void>> updateUserProfile(
    Map<String, String> data,
  ) async {
    try {
      var datafordio = FormData.fromMap(data);
      final dio = Dio();
      final response = await dio.put(
          "${ApiConstances.updateUser}/${box?.read("User").id}",
          data: datafordio,
          options: Options(
              headers: {'Authorization': "Bearer ${box?.read("Token")}"}));
      if (response.statusCode == 200) {
        return const Right(null);
      }
      return const Right(null);
    } on DioException catch (e) {
      if (e.response != null) {
        ErrorModel errorModel2 = ErrorModel.fromJson(e.response?.data ??
            {'message': "No Internet Connection", 'Error': "Internet related"});
        return Left(errorModel2.message ?? 'Connection error');
      }
      return Left(e.message ?? 'Connection error');
    } catch (e) {
      return const Left('An unexpected error occurred');
    }
  }
}
