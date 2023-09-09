import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/bloc_observer.dart';
import 'package:snay3y/core/route/router.dart';
import 'package:snay3y/core/route/routes.dart';
import 'package:snay3y/generated/l10n.dart';
import 'package:snay3y/helpers/dio_helper.dart';
import 'package:snay3y/screens/technician_screens/signUp/cubit/cubit.dart';
import 'package:snay3y/screens/user_screens/signUp/user_sign_up_screen.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
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
            initialRoute: Routes.mainPage,
            onGenerateRoute: SpecialRouter.onGenerateRoutes,
          );
        },
      ),
    );
  }
}