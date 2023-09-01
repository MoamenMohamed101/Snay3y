import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snay3y/screens/signUp/cubit/states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialStates());

  static SignUpCubit get(context) => BlocProvider.of(context);

  String? valueChooseUser;
  String? genderChooseUser;
  String? valueChooseFactor;
  String? genderChooseFactor;

  var formStateUser = GlobalKey<FormState>();
  var formStateFactor = GlobalKey<FormState>();

  inPutUserValueDropDown({required bool? type, required value}) {
    type == true
        ? valueChooseUser = value as String?
        : genderChooseUser = value as String?;
    emit(SignUpInPutUserValueStates());
  }

  inPutFactorValueDropDown({required bool? type, required value}) {
    type == true ? valueChooseFactor = value : genderChooseFactor = value;
    emit(SignUpInPutFactorValueStates());
  }
}
