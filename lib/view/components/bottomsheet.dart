import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

failureWidget(String title, String message) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: failureColor,
      colorText: textSecColor);
}
successfullyWidget(String title, String message) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: successfullyColor,
      colorText: textSecColor);
}
