// ignore: file_names
import 'package:get/get.dart';
import 'package:healthcare/controller/auth_controller.dart';
import 'package:healthcare/controller/doctors_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put<DoctorsController>(DoctorsController());
    Get.put<AuthController>(AuthController());
  }
}
