import 'package:snay3y/models/user/user_sign_up_model.dart';

abstract class UserSignUpStates {}

class UserSignUpInitialStates extends UserSignUpStates {}

class UserSignUpInPutUserValueStates extends UserSignUpStates {}

class UserSignUpLoadingStates extends UserSignUpStates {}

class UserSignUpSuccessStates extends UserSignUpStates {
  final UserSignUpModel userSignUpModel;

  UserSignUpSuccessStates(this.userSignUpModel);
}

class UserSignUpErrorStates extends UserSignUpStates {
  final String error;

  UserSignUpErrorStates(this.error);
}
