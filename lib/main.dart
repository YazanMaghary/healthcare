import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/network/stripe_constances.dart';
import 'package:healthcare/core/routes.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  Stripe.publishableKey = StripeConstances.stripePublishKey;
  await Stripe.instance.applySettings();
  await initialServices();

  // Get.put(AuthController())
  await Future.delayed(const Duration(
    seconds: 1,
  ));
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

Future<void> initialServices() async {
  await GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
          initialRoute: "/OnBoardingScreen",
          getPages: getpage,
          onInit: () {},
        );
      },
    );
  }
}

//  box?.read("Token") == null || box?.read("Token") == ""
//               ? box?.read("firstTime") == false
//                   ? "/LoginScreen"
//                   : "/OnboardingScreen"
//               : "/MainAppScreen"