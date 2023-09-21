import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/bloc_observer.dart';
import 'package:snay3y/core/route/router.dart';
import 'package:snay3y/generated/l10n.dart';
import 'package:snay3y/helpers/cash_helper.dart';
import 'package:snay3y/helpers/dio_helper.dart';
import 'package:snay3y/screens/onboarding_screen.dart';
import 'package:snay3y/screens/technician_screens/signUp/cubit/cubit.dart';
import 'package:snay3y/screens/user_screens/home/home_screen.dart';
import 'package:snay3y/screens/user_screens/login/login_screen.dart';
import 'core/route/routes.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
 // My name is moamen
void main() async {
  HttpOverrides.global = MyHttpOverrides();
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  Bloc.observer = MyBlocObserver();
  Widget widget;
  var onBoarding = CachHelper.getData(key: 'onBoarding');
  var token = CachHelper.getData(key: 'token');
  if (onBoarding != null) {
    if (token != null) {
      widget = const UserHomeScreen();
    } else {
      widget = const UserLoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }
  runApp(
    MyApp(startWidget: widget),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => TechSignUpCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.onBoarding,
            home: startWidget,
            onGenerateRoute: SpecialRouter.onGenerateRoutes,
          );
        },
      ),
    );
  }
}