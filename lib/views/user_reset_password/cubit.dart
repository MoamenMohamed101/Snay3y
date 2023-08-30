import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'state.dart';

class UserResetPasswordCubit extends Cubit<UserResetPasswordState> {
  UserResetPasswordCubit() : super(UserResetPasswordInitial());
}
