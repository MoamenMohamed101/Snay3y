import 'package:flutter/material.dart';
import 'package:snay3y/core/route/routes.dart';
import 'package:snay3y/screens/technician_screens/home/home_screen.dart';
import 'package:snay3y/screens/user_screens/confirm_code_screen.dart';
import 'package:snay3y/screens/user_screens/forget_password.dart';
import 'package:snay3y/screens/technician_screens/confirm_code_screen.dart';
import 'package:snay3y/screens/main_page.dart';
import 'package:snay3y/screens/onboarding_screen.dart';
import 'package:snay3y/screens/technician_screens/forget_password_screen.dart';
import 'package:snay3y/screens/technician_screens/login/Login_screen.dart';
import 'package:snay3y/screens/technician_screens/reset_password/reset_password.dart';
import 'package:snay3y/screens/technician_screens/signUp/signup_screen.dart';
import 'package:snay3y/screens/user_screens/login/login_screen.dart';
import 'package:snay3y/screens/user_screens/signUp/user_sign_up_screen.dart';
import 'package:snay3y/screens/user_screens/user_reset_password/user_reset_password_screen.dart';
import 'package:snay3y/widgets/categories.dart';

import '../../screens/user_screens/Booking/booking_screen.dart';
import '../../screens/user_screens/Description/description.dart';
import '../../screens/user_screens/home/home_screen.dart';
import '../../widgets/category_listview_item.dart';

class SpecialRouter {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      // technician routes
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.mainPage:
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
        );
      case Routes.loginPageRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.technicianForgotPassRouteName:
        return MaterialPageRoute(
          builder: (_) => const TechnicianForgotPassScreen(),
        );
      case Routes.technicianConfirmCodeRouteName:
        return MaterialPageRoute(
          builder: (_) => const TechnicianConfirmCodeScreen(),
        );
      case Routes.resetPasswordPageRoute:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordView(),
        );
      case Routes.signUpPageRoute:
        return MaterialPageRoute(
          builder: (_) => const TechSignUpScreen(),
        );
      case Routes.technicianHomePageRoute:
        return MaterialPageRoute(
          builder: (_) =>  TechHomeScreen(),
        );

      // user routes
      case Routes.loginPageRouteUser:
        return MaterialPageRoute(
          builder: (_) => const UserLoginScreen(),
        );
      case Routes.userForgotPassRouteName:
        return MaterialPageRoute(
          builder: (_) => const UserForGotPassScreen(),
        );
      case Routes.userConfirmCodeRouteName:
        return MaterialPageRoute(
          builder: (_) => const UserConfirmCodeScreen(),
        );
      case Routes.userResetPasswordPageRoute:
        return MaterialPageRoute(
          builder: (_) => const UserResetPasswordView(),
        );
      case Routes.signUpPageRouteUser:
        return MaterialPageRoute(
          builder: (_) => UserSignUpScreen(),
        );
      case Routes.userHomePageRoute:
        return MaterialPageRoute(
          builder: (_) =>  UserHomeScreen(),
        );
      case Routes.userCategoriesRoute:
        return MaterialPageRoute(builder: (_)=> CategoriesScreen()
        );
      case Routes.userBookingRoute:
        return MaterialPageRoute(builder: (_)=> UserBooking()
        );
      case Routes.userDescription:
        return MaterialPageRoute(builder: (_)=> UserDescription()
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
    }
  }
}
