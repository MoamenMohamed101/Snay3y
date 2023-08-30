import 'package:flutter/material.dart';
import 'package:snay3y/core/router/routes.dart';
import 'package:snay3y/views/login/view.dart';
import 'package:snay3y/views/reset_password/view.dart';
import 'package:snay3y/views/user_login/view.dart';
import 'package:snay3y/views/user_reset_password/view.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return MaterialPageRoute(
          builder: (_) => const LoginView(), settings: settings);
    case AppRoutes.resetPasswordPageRoute:
      return MaterialPageRoute(
          builder: (_) => const ResetPasswordView(), settings: settings);
    case AppRoutes.userLoginPageRoute:
      return MaterialPageRoute(
          builder: (_) => const UserLoginView(), settings: settings);
    case AppRoutes.userResetPasswordPageRoute:
      return MaterialPageRoute(
          builder: (_) => const UserResetPasswordView(), settings: settings);
    default:
      return MaterialPageRoute(
        builder: (_) => const LoginView(),
        settings: settings,
      );
  }
}
