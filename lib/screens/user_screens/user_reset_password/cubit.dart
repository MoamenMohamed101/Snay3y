import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class UserResetPasswordCubit extends Cubit<UserResetPasswordState> {
  UserResetPasswordCubit() : super(UserResetPasswordInitial());

  String? comfirmPassword, password;
  final formKey = GlobalKey<FormState>();
  final comfirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final comfirmPasswordFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  bool isPasswordSecure = false;
  bool isComfirmPasswordSecure = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  static UserResetPasswordCubit of(context) => BlocProvider.of(context);

  hidePassword() {
    if (isPasswordSecure) {
      isPasswordSecure = false;

      emit(VisiblePassword());
    } else {
      isPasswordSecure = true;

      emit(HidePassword());
    }
  }

  hideComfirmPassword() {
    if (isComfirmPasswordSecure) {
      isComfirmPasswordSecure = false;

      emit(VisibleComfirmPassword());
    } else {
      isComfirmPasswordSecure = true;
      emit(HideComfirmPassword());
    }
  }
}
