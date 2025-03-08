
class ApiConstances {
  static const String baseUrl = "http://167.172.39.24:3001";
  static const String loginUrl = "$baseUrl/api/auth/login";
  static const String registerUrl = "$baseUrl/api/auth/register";
  static const String confirmEmail = "$baseUrl/api/auth/verify-email";
  static const String forgotPassword = "$baseUrl/api/auth/forgot-password";
  static const String getMe = "$baseUrl/api/users/me";
  static const String updateUser = "$baseUrl/api/users"; 
  static const String getDoctors = "$baseUrl/api/doctors/"; 
  static const String getDoctorsSpecality = "$baseUrl/api/categories"; 
}
