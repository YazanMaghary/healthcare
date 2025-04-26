import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/binding/myBinding.dart';
import 'package:healthcare/core/network/stripe_constances.dart';
import 'package:healthcare/core/notification/notification_services.dart';
import 'package:healthcare/core/routes.dart';
import 'package:healthcare/core/utils/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest_all.dart' as tzz;
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // NotificationServices().initNotification();
  // tzz.initializeTimeZones();
  // tz.setLocalLocation(tz.getLocation("Asia/Gaza"));
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  Stripe.publishableKey = StripeConstances.stripePublishKey;
  await Stripe.instance.applySettings();
  await initialServices();

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
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(initialBinding: InitBinding(),
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