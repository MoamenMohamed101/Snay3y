abstract class TechSignUpStates {}

class SignUpInitialStates extends TechSignUpStates {}

class SignUpInPutFactorValueStates extends TechSignUpStates {}

class TechSignUpLoadingStates extends TechSignUpStates {}

class TechSignUpSuccessStates extends TechSignUpStates {}

class TechSignUpErrorStates extends TechSignUpStates {
  final String error;

  TechSignUpErrorStates(this.error);
}