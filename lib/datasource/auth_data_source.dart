import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/model/error_model.dart';
import 'package:healthcare/model/user_model.dart';

// next task : token vaerfication add when open app  when remmeber me active do it with sharedPref
//use either
class AuthDataSource {
  Future<Either<String, UserModel>> login(Map<String, String> data) async {
    try {
      final dio = Dio();
      // check url is correct
      ApiConstances().configureDio(dio);
      final response = await dio.post(ApiConstances.loginUrl, data: data);
      //the error from here
      print("Test auth data source ");
      print(UserModel.fromJson(response.data).user?.email);
      UserModel user = UserModel.fromJson(response.data);
      // print(user.user.email);
      return Right(UserModel.fromJson(response.data));
    } on DioException catch (e) {
      print("Dio Exception Error");
      ErrorModel errorModel2 = ErrorModel.fromJson(
          e.response?.data ?? {
            'message' :  "No Internet Connection",
            'Error'  : "Internet related"
          });
      print(errorModel2.message);
      return Left(errorModel2.message ?? 'Connection error');
    } catch (e) {
      print("Global catch Error");
      print(e.toString());
      return const Left('An unexpected error occurred');
    }
  }
}


// Example usage in a repository or service class
// Future<void> handleLogin(String email, String password) async {
//   final loginData = {
//     'email': email,
//     'password': password,
//   };

//   final result = await authDataSource.login(loginData);

//   result.fold(,
//     (failure) {
//       // Handle error case
//       print('Login failed: ${failure.message}');
//     },
//     (success) {
//       // Handle success case
//       print('Login successful: $success');
//     },
//   );0
// }
