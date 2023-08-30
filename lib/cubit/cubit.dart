import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snay3y/cubit/states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialStates());

  static SignUpCubit get(context) => BlocProvider.of(context);

  String? valueChoose;
  String? genderChoose;

  var formStateUser = GlobalKey<FormState>();
  var formStateFactor = GlobalKey<FormState>();

  inPutValue({required bool? type, required value}) {

    type == true
        ? valueChoose = value as String?
        : genderChoose = value as String?;
    emit(SignUpInPutValueStates());
  }
}
