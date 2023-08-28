import 'package:flutter/material.dart';
import 'package:snay3y/core/router/routes.dart';
import 'package:snay3y/views/login/view.dart';
import 'package:snay3y/views/reset_password/view.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return MaterialPageRoute(
          builder: (_) => const LoginView(), settings: settings);
    case AppRoutes.resetPasswordPageRoute:
      return MaterialPageRoute(
          builder: (_) => const ResetPasswordView(), settings: settings);
    default:
      return MaterialPageRoute(
        builder: (_) => const LoginView(),
        settings: settings,
      );
  }
}
