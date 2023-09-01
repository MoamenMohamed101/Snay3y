part of 'cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class HidePassword extends ResetPasswordState {}

final class HideComfirmPassword extends ResetPasswordState {}

final class VisiblePassword extends ResetPasswordState {}

final class VisibleComfirmPassword extends ResetPasswordState {}
