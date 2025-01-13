import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/auth_controller.dart';
import 'package:healthcare/core/network/stripe_constances.dart';
import 'package:healthcare/core/routes.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/theme.dart';
import 'package:get_storage/get_storage.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = StripeConstances.stripePublishKey;
  await Stripe.instance.applySettings();
  await initialServices();

  await Future.delayed(const Duration(
    seconds: 1,
  ));
  FlutterNativeSplash.remove();
  runApp(MyApp());
}

Future<void> initialServices() async {
  await GetStorage.init();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    print(box?.read("Token"));
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Themes().mainTheme,
          initialRoute: box?.read("Token") == null || box?.read("Token") == ""
              ? box?.read("firstTime") == false
                  ? "/LoginScreen"
                  : "/OnboardingScreen"
              : "/myMain",
          getPages: getpage,
        );
      },
    );
  }
}
