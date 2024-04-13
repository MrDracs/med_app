import 'package:get/get.dart';
import 'package:med_app/pages/home_page.dart';
import 'package:med_app/pages/login_page.dart';
import 'package:med_app/pages/main_nav_page.dart';
import 'package:med_app/pages/profile_page.dart';
import 'package:med_app/pages/signup_page.dart';
import 'package:med_app/pages/stroke_emergency_screen.dart';

import '../pages/main_nav_page.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String onBoardingScreen = "/on_boading_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String signInScreen = "/sign_in_screen";
  static const String userDetailsScreen = "/user_details_screen";
  static const String home = "/";

  static const String strokeEmergencyScreen = "/stroke_emergency_screen";
  static const String healthCornerScreen = "/health_corner_screen";

  // ignore: non_constant_identifier_names
  static GetPage HomePage = GetPage(
    name: home,
    page: () => const MainPage(),
    transition: Transition.cupertino,
  );

  static GetPage signUpPage = GetPage(
    name: signUpScreen,
    page: () => SignUpPage(),
    transition: Transition.leftToRight,
  );

  static GetPage signInPage = GetPage(
    name: signInScreen,
    page: () => LoginPage(),
    transition: Transition.rightToLeft,
  );

  static GetPage userDetailsPage = GetPage(
    name: userDetailsScreen,
    page: () => ProfilePage(),
    transition: Transition.leftToRight,
  );

  static GetPage stokeEmergencyPage = GetPage(
    name: strokeEmergencyScreen,
    page: () => const StrokeEmergencyScreen(),
    transition: Transition.cupertino,
  );
}
