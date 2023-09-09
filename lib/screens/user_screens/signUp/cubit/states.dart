abstract class UserSignUpStates {}

class UserSignUpInitialStates extends UserSignUpStates {}

class UserSignUpInPutUserValueStates extends UserSignUpStates {}

class UserSignUpLoadingStates extends UserSignUpStates {}

class UserSignUpSuccessStates extends UserSignUpStates {}

class UserSignUpErrorStates extends UserSignUpStates {
  final String error;

  UserSignUpErrorStates(this.error);
}
