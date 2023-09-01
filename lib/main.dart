import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:snay3y/core/route/router.dart';
import 'package:snay3y/core/route/routes.dart';
import 'package:snay3y/generated/l10n.dart';
import 'package:snay3y/screens/user_screens/forget_password.dart';
import 'package:snay3y/screens/technician_screens/signUp/cubit/cubit.dart';
import 'package:snay3y/screens/user_screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => SignUpCubit(),
        )
      ],
      child: MaterialApp(
        locale: const Locale('ar'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoarding,
        onGenerateRoute: SpecialRouter.onGenerateRoutes,
      ),
    );
  }
}
