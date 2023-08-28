import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  String? comfirmPassword, password;
  final formKey = GlobalKey<FormState>();
  final comfirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final comfirmPasswordFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  bool isPasswordSecure = false;
  bool isComfirmPasswordSecure = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  static ResetPasswordCubit of(context) => BlocProvider.of(context);

  hidePassword() {
    if (isPasswordSecure) {
      isPasswordSecure = false;
      print('no');
      emit(VisiblePassword());
    } else {
      isPasswordSecure = true;
      print('yes');
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
