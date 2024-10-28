import 'package:get/get.dart';
import 'package:healthcare/view/screens/login_screen.dart';
import 'package:healthcare/view/screens/onboarding_screen.dart';

List<GetPage> getpage = [
  GetPage(name: '/loginScreen', page: () => const LoginScreen()),
  GetPage(name: '/OnboardingScreen', page: () => const OnboardingScreen()),
];
