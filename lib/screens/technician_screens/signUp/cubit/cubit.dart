import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snay3y/screens/technician_screens/signUp/cubit/states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialStates());

  static SignUpCubit get(context) => BlocProvider.of(context);

  String? valueChooseFactor;
  String? genderChooseFactor;
  var technicianEmailController = TextEditingController();
  var technicianPasswordController = TextEditingController();
  var technicianNameController = TextEditingController();
  var technicianPhoneController = TextEditingController();

  var formStateFactor = GlobalKey<FormState>();

  inPutFactorValueDropDown({required bool? type, required value}) {
    type == true ? valueChooseFactor = value : genderChooseFactor = value;
    emit(SignUpInPutFactorValueStates());
  }
}
