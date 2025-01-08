import 'package:get/get.dart';
import 'package:healthcare/view/screens/auth/Otp_verfication.dart';
import 'package:healthcare/view/screens/auth/forgot_password_screen.dart';
import 'package:healthcare/view/screens/auth/login_screen.dart';
import 'package:healthcare/view/screens/auth/onboarding_screen.dart';
import 'package:healthcare/view/screens/auth/profilePicture.dart';
import 'package:healthcare/view/screens/auth/signup_screen.dart';
import 'package:healthcare/view/screens/home/booking_details.dart';
import 'package:healthcare/view/screens/home/booking_pay.dart';
import 'package:healthcare/view/screens/home/booking_screen.dart';
import 'package:healthcare/view/screens/home/booking_summary.dart';
import 'package:healthcare/view/screens/home/doctor_details.dart';
import 'package:healthcare/view/screens/home/doctor_speciaity.dart';
import 'package:healthcare/view/screens/home/home_screen.dart';
import 'package:healthcare/view/screens/home/main_app_screen.dart';
import 'package:healthcare/view/screens/home/notifications_screen.dart';
import 'package:healthcare/view/screens/home/recommandation_doctor_screen.dart';

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
      page: () => const ForgotPasswordScreen(),
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
      name: '/MainAppScreen',
      page: () => const MainAppScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/HomeScreen',
      page: () => const HomeScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/DoctorSpeciality',
      page: () => const DoctorSpeciality(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/RecommandationDoctorScreen',
      page: () => const RecommandationDoctorScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/Doctordetails',
      page: () => const Doctordetails(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/BookingScreen',
      page: () => const BookingScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/BookingPay',
      page: () => const BookingPay(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/BookingSummary',
      page: () => const BookingSummary(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/BookingDetails',
      page: () => const BookingDetails(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/NotificationsScreen',
      page: () => const NotificationsScreen(),
      transition: Transition.leftToRight),
];
