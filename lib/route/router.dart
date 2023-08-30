import 'package:flutter/material.dart';
import 'package:snay3y/screens/onboarding_screen.dart';
import 'package:snay3y/route/routes.dart';
import 'package:snay3y/screens/signup_screen.dart';
import 'package:snay3y/screens/user_sign_up_screen.dart';

class SpecialRouter{
  static Route<dynamic> onGenerateRoutes(RouteSettings settings){
    switch(settings.name){
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.userSignUp:
        return MaterialPageRoute(builder: (_) => const UserSignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    }
  }
}