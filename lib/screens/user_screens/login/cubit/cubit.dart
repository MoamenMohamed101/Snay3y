import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snay3y/screens/user_screens/login/cubit/states.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(UserLoginInitial());

  String? email, password;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isPasswordSecure = false;

  static UserLoginCubit of(context) => BlocProvider.of(context);

  hidePassword() {
    if (isPasswordSecure) {
      isPasswordSecure = false;

      emit(VisiblePassword());
    } else {
      isPasswordSecure = true;
      debugPrint('XXXX');
    }
  }
}
