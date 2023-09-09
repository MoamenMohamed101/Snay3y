import 'package:snay3y/models/login_model.dart';

abstract class UserLoginState {}

class UserLoginInitial extends UserLoginState {}

class HidePassword extends UserLoginState {}

class VisiblePassword extends UserLoginState {}

class UserLoginLoadingStates extends UserLoginState {}

class UserLoginSuccessStates extends UserLoginState {
  final UserLoginModel? userLoginModel;

  UserLoginSuccessStates(this.userLoginModel);
}

class UserLoginErrorStates extends UserLoginState {}
