import 'package:flutter/material.dart';
import 'package:snay3y/core/route/routes.dart';
import 'package:snay3y/screens/confirm_code_screen.dart';
import 'package:snay3y/screens/forget_password_screen.dart';
import 'package:snay3y/screens/login/LoginView.dart';
import 'package:snay3y/screens/main_page.dart';
import 'package:snay3y/screens/onboarding_screen.dart';
import 'package:snay3y/screens/reset_password/view.dart';
import 'package:snay3y/screens/signUp/signup_screen.dart';
import 'package:snay3y/screens/signUp/user_sign_up_screen.dart';

class SpecialRouter {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.mainPage:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case Routes.loginPageRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.technicianForgotPassRouteName:
        return MaterialPageRoute(builder: (_) => TechnicianForgotPassScreen());
      case Routes.technicianConfirmCodeRouteName:
        return MaterialPageRoute(
            builder: (_) => const TechnicianConfirmCodeScreen());
      case Routes.resetPasswordPageRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case Routes.signUpPageRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.userSignUp:
        return MaterialPageRoute(builder: (_) => const UserSignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    }
  }
}
