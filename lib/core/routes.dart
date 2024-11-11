import 'package:get/get.dart';
import 'package:healthcare/view/screens/auth/login_screen.dart';
import 'package:healthcare/view/screens/auth/onboarding_screen.dart';

List<GetPage> getpage = [
  GetPage(name: '/loginScreen', page: () =>  LoginScreen()),
  GetPage(name: '/OnboardingScreen', page: () => const OnboardingScreen()),
];
