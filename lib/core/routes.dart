import 'package:get/get.dart';
import 'package:healthcare/view/screens/home_page.dart';
import 'package:healthcare/view/screens/onboarding_screen.dart';

List<GetPage> getpage = [
  GetPage(name: '/home', page: () => const HomePage()),
  GetPage(name: '/OnboardingScreen', page: () => const OnboardingScreen()),
];
