part of 'cubit.dart';

abstract class UserLoginState {}

final class UserLoginInitial extends UserLoginState {}

final class HidePassword extends UserLoginState {}

final class VisiblePassword extends UserLoginState {}
