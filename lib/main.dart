import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/routes.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/core/utils/theme.dart';
import 'package:get_storage/get_storage.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
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
