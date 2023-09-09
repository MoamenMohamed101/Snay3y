import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snay3y/end_points.dart';
import 'package:snay3y/helpers/dio_helper.dart';
import 'package:snay3y/models/login_model.dart';
import 'package:snay3y/screens/user_screens/login/cubit/states.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(UserLoginInitial());
  UserLoginModel? userLoginModel;
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

  userLogin({
    required String email,
    required String password,
}) async{
    emit(UserLoginLoadingStates());
    await DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    )!.then((value) {
      userLoginModel = UserLoginModel.fromJson(value.data);
      print(userLoginModel!.message);
      print(value.data);
      emit(UserLoginSuccessStates(userLoginModel));
    }).catchError((error) {
      print(error.toString());
      emit(UserLoginErrorStates());
    });
  }
}