import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snay3y/end_points.dart';
import 'package:snay3y/helpers/dio_helper.dart';
import 'package:snay3y/screens/technician_screens/login/cubit/state.dart';

class LoginCubit extends Cubit<TechLoginState> {
  LoginCubit() : super(LoginInitial());

  String? phone, password;
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  static LoginCubit of(context) => BlocProvider.of(context);

  techLogin({
    required String email,
    required String password,
  }) async{
    emit(TechLoginLoadingStates());
    await DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    )!.then((value) {
      print(value.data);
      emit(TechLoginSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(TechLoginErrorStates());
    });
  }
}
