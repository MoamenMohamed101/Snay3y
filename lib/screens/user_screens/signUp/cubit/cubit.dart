import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snay3y/screens/user_screens/signUp/cubit/states.dart';

class UserSignUpCubit extends Cubit<UserSignUpStates> {
  UserSignUpCubit() : super(UserSignUpInitialStates());

  static UserSignUpCubit get(context) => BlocProvider.of(context);

  String? valueChooseUser;
  String? genderChooseUser;

  var formStateUser = GlobalKey<FormState>();

  inPutUserValueDropDown({required bool? type, required value}) {
    type == true
        ? valueChooseUser = value as String?
        : genderChooseUser = value as String?;
    emit(UserSignUpInPutUserValueStates());
  }
}
