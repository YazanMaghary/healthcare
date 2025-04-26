import 'package:get/get.dart';
import 'package:healthcare/core/binding/myBinding.dart';
import 'package:healthcare/core/middleware/init_midlleware.dart';
import 'package:healthcare/view/screens/appointment/appointment_reschedule_screen.dart';
import 'package:healthcare/view/screens/appointment/appointment_screen.dart';
import 'package:healthcare/view/screens/appointment/reschedule_screen.dart';
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
import 'package:healthcare/view/screens/inbox/chat_screen.dart';

import 'package:healthcare/view/screens/profile/medicalRecored_screen.dart';
import 'package:healthcare/view/screens/profile/notificationSetting_screen.dart';
import 'package:healthcare/view/screens/appointment/payment_screen.dart';
import 'package:healthcare/view/screens/profile/personal_information.dart';
import 'package:healthcare/view/screens/profile/security_screen.dart';
import 'package:healthcare/view/screens/profile/setting_screen.dart';

List<GetPage> getpage = [
  GetPage(
      name: '/LoginScreen',
      page: () => LoginScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/OnBoardingScreen',
      page: () => const OnboardingScreen(),
      middlewares: <GetMiddleware>[InitMidlleware()],
      transition: Transition.leftToRight),
  GetPage(
      name: '/SignupScreen',
      page: () => SignupScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/OnboardingScreen',
      page: () => const OnboardingScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/ForgotPasswordScreen',
      page: () => ForgotPasswordScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/OtpVerficationScreen',
      page: () => OtpVerficationScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/ProfilePictureScreen',
      page: () => ProfilePictureScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/MainAppScreen',
      page: () => const MainAppScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/HomeScreen',
      page: () => HomeScreen(),
      binding: InitBinding(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/DoctorSpeciality',
      page: () => DoctorSpeciality(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/RecommandationDoctorScreen',
      page: () => RecommandationDoctorScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/Doctordetails',
      page: () => const Doctordetails(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/BookingScreen',
      page: () => BookingScreen(),
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
      page: () => NotificationsScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/SettingScreen',
      page: () => const SettingScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/notificationSettingScreen',
      page: () => const NotificationSettingScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/SecurityScreen',
      page: () => const SecurityScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/PersonalInformation',
      page: () => PersonalInformation(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/MedicalRecoredScreen',
      page: () => const MedicalrecoredScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/PaymentScreen',
      page: () => const PaymentScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/RescheduleScreen',
      page: () => RescheduleScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/AppointmentRescheduleScreen',
      page: () =>  AppointmentRescheduleScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/AppointmentScreen',
      page: () => AppointmentScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: '/ChatScreen',
      page: () => ChatScreen(),
      transition: Transition.leftToRight),
];
