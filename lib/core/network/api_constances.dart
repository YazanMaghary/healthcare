import 'package:dio/dio.dart';

class ApiConstances {
  static const String baseUrl = "http://136.244.81.244:3000";
  static const String loginUrl = "$baseUrl/api/auth/login";
  final Map<String, String> header = {
    // 'Authorization': 'Bearer ${SharedPreferencesHelper.user.token}',
    'Accept': 'application/json'
  };
  BaseOptions configureDio(Dio dio) {
    dio.options.baseUrl = baseUrl;
    dio.options.headers = header;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
    return dio.options;
  }
}
