import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(UserLoginInitial());
}
