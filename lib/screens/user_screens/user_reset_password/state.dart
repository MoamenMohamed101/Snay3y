part of 'cubit.dart';

abstract class UserResetPasswordState {}

final class UserResetPasswordInitial extends UserResetPasswordState {}

final class HidePassword extends UserResetPasswordState {}

final class HideComfirmPassword extends UserResetPasswordInitial {}

final class VisiblePassword extends UserResetPasswordInitial {}

final class VisibleComfirmPassword extends UserResetPasswordInitial {}
