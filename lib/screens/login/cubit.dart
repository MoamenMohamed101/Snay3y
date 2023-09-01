import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String? phone, password;
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  static LoginCubit of(context) => BlocProvider.of(context);
}
