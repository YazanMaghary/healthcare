import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/model/category_model.dart';
import 'package:healthcare/model/doctors_model.dart';
import 'package:healthcare/model/error_model.dart';

class DoctorsDataSource {
  final dio = Dio();
  Future<Either<String, DoctorsModel>> GetDoctors() async {
    try {
      final response = await dio.get(
        ApiConstances.getDoctors,
        options: Options(
          headers: {
            'Authorization': "Bearer ${box?.read("Token")}",
          },
        ),
      );
      DoctorsModel doctors = DoctorsModel.fromJson(response.data);
    
      return Right(doctors);
    } on DioException catch (e) {
      print("Dio Exception Error");
      ErrorModel errorModel = ErrorModel.fromJson(e.response?.data ??
          {'message': "No Internet Connection", 'Error': "Internet related"});
      print(errorModel.message);
      return Left(errorModel.message ?? 'Connection Error');
    } catch (e) {
      print("Global catch Error");
      print(e.toString());
      return const Left('An unexpected error occurred');
    }
  }
  //Create Category Model 
  Future<Either<String, CategoryModel>> getDoctorsSpecality() async {
    try {
      final response = await dio.get(
        ApiConstances.getDoctorsSpecality,
        options: Options(
          headers: {
            'Authorization': "Bearer ${box?.read("Token")}",
          },
        ),
      );
      CategoryModel categories = CategoryModel.fromJson(response.data);
     
      return Right(categories);
    } on DioException catch (e) {
      print("Dio Exception Error");
      ErrorModel errorModel = ErrorModel.fromJson(e.response?.data ??
          {'message': "No Internet Connection", 'Error': "Internet related"});
      print(errorModel.message);
      return Left(errorModel.message ?? 'Connection Error');
    } catch (e) {
      print("Global catch Error");
      print(e.toString());
      return const Left('An unexpected error occurred');
    }
  }
}
