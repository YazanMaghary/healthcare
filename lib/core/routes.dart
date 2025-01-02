import 'package:get/get.dart';
import 'package:healthcare/view/screens/auth/Otp_verfication.dart';
import 'package:healthcare/view/screens/auth/forgot_password_screen.dart';
import 'package:healthcare/view/screens/auth/login_screen.dart';
import 'package:healthcare/view/screens/auth/onboarding_screen.dart';
import 'package:healthcare/view/screens/auth/profilePicture.dart';
import 'package:healthcare/view/screens/auth/signup_screen.dart';
import 'package:healthcare/view/screens/home/main_app_screen.dart';

List<GetPage> getpage = [
  GetPage(
      name: '/LoginScreen',
      page: () => LoginScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/SignupScreen',
      page: () =>  SignupScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/OnboardingScreen',
      page: () => const OnboardingScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/ForgotPasswordScreen',
      page: () =>  ForgotPasswordScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/OtpVerficationScreen',
      page: () => OtpVerficationScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/ProfilePictureScreen',
      page: () =>  ProfilePictureScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/myMain',
      page: () => const myMain(),
      transition: Transition.leftToRight),
];
