abstract class UserLoginState {}

class UserLoginInitial extends UserLoginState {}

class HidePassword extends UserLoginState {}

class VisiblePassword extends UserLoginState {}

class UserLoginLoadingStates extends UserLoginState {}

class UserLoginSuccessStates extends UserLoginState {}

class UserLoginErrorStates extends UserLoginState {}
