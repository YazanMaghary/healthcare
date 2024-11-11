import 'package:get/get.dart';
import 'package:healthcare/datasource/auth_data_source.dart';
import 'package:healthcare/view/components/failure.dart';
import 'package:healthcare/view/screens/home/home_screen.dart';

class AuthController extends GetxController {
  Future<void> login(String email, String password) async {
    final result =
        await AuthDataSource().login({"email": email, "password": password});
    result.fold((failure) {
      failureWidget('Error', failure);
    }, (success) {
      // Handle successful login
      print("success");
      print(success.user?.name);
      Get.offAll(() => const HomeScreen(), transition: Transition.fade);
      // Get.offAllNamed('/home');  // or whatever route you want
    });
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
