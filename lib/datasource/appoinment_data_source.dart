
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/model/appoinment_model.dart';
import 'package:healthcare/model/error_model.dart';
import 'package:healthcare/model/error_model2.dart';

class AppoinmentDataSource {
  final dio = Dio();
  Future<Either<String, AppoinmentModel>> fetchAppoinmentDataSource() async {
    try {
      final response = await dio.get(ApiConstances.getAppoinmentData,
          options: Options(
              headers: {'Authorization': "Bearer ${box?.read("Token")}"}));

      AppoinmentModel appoinmentModel = AppoinmentModel.fromJson(response.data);

      return Right(appoinmentModel);
    } on DioException catch (e) {
      ErrorModel errorModel = ErrorModel.fromJson(e.response?.data ??
          {
            'message': "No Internet Connection",
            'Error': "Internet related issue"
          });
      return Left(errorModel.message ?? 'Connection error');
    } catch (e) {
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, Appoinment>> changeAppoinmentStatusDataSource(
      String appointmentId, String appointmentStatus) async {
    try {
      final response = await dio.patch(
          "${ApiConstances.getAppoinmentData}/$appointmentId",
          data: {"status": appointmentStatus},
          options: Options(
              headers: {'Authorization': "Bearer ${box?.read("Token")}"}));

      Appoinment appoinmentModel = Appoinment.fromJson(response.data);
      return Right(appoinmentModel);
    } on DioException catch (e) {
      ErrorModel errorModel = ErrorModel.fromJson(e.response?.data ??
          {
            'message': "No Internet Connection",
            'Error': "Internet related issue"
          });
      return Left(errorModel.message ?? 'Connection error');
    } catch (e) {
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, Appoinment>> rescheduleAppointmentDataSource(
      String appointmentId, String dateTime, String time, String type) async {
    try {
      final response = await dio.put(
          "${ApiConstances.getAppoinmentData}/$appointmentId",
          data: {
            "dateTime": {"date": dateTime, "time": time},
            "type": type
          },
          options: Options(
              headers: {'Authorization': "Bearer ${box?.read("Token")}"}));

      Appoinment appoinmentModel = Appoinment.fromJson(response.data);

      return Right(appoinmentModel);
    } on DioException catch (e) {
      ErrorModel errorModel = ErrorModel.fromJson(e.response?.data ??
          {
            'message': "No Internet Connection",
            'Error': "Internet related issue"
          });
      return Left(errorModel.message ?? 'Connection error');
    } catch (e) {
      return const Left('An unexpected error occurred');
    }
  }

  Future<Either<String, Appoinment>> makeAnAppointmentDataSource({
    required String doctorId,
    required String dateTime,
    required String time,
    required String type,
    required String paymentMethod,
    required int subTotal,
    required int tax,
    required int total,
    required String paymentId,
  }) async {
    try {
      final response = await dio.post(ApiConstances.getAppoinmentData,
          data: {
            "doctor": doctorId,
            "dateTime": {
              "date": "${DateTime.parse(dateTime).toIso8601String()}Z",
              "time": time
            },
            "type": type,
            "payment": {
              "method": paymentMethod,
              "subtotal": subTotal,
              "tax": tax,
              "total": total,
              "paymentId": paymentId
            },
            "status": "UPCOMING"
          },
          options: Options(
              headers: {'Authorization': "Bearer ${box?.read("Token")}"}));

      Appoinment appoinmentModel = Appoinment.fromJson(response.data);

      return Right(appoinmentModel);
    } on DioException catch (e) {
      ErrorModel2 errorModel = ErrorModel2.fromJson(e.response?.data ??
          {
            'message': "No Internet Connection",
            'Error': "Internet related issue"
          });
      return Left(errorModel.details?[0].message ?? 'Connection error');
    } catch (e) {
      return const Left('An unexpected error occurred');
    }
  }
}
