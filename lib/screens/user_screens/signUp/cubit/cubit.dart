import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snay3y/end_points.dart';
import 'package:snay3y/helpers/dio_helper.dart';
import 'package:snay3y/screens/user_screens/signUp/cubit/states.dart';

class UserSignUpCubit extends Cubit<UserSignUpStates> {
  UserSignUpCubit() : super(UserSignUpInitialStates());

  static UserSignUpCubit get(context) => BlocProvider.of(context);

  String? valueChooseUser;
  String? genderChooseUser;
  var userEmailController = TextEditingController();
  var userPasswordController = TextEditingController();
  var userNameController = TextEditingController();
  var userPhoneNumberController = TextEditingController();

  var formStateUser = GlobalKey<FormState>();

  inPutUserValueDropDown({required bool? type, required value}) {
    type == true
        ? valueChooseUser = value as String?
        : genderChooseUser = value as String?;
    emit(UserSignUpInPutUserValueStates());
  }

  void userSignUp({
    required String? name,
    required String? email,
    required String? password,
    required String? phone,
    required String? government,
    required String? gender,
  }) async {
    emit(UserSignUpLoadingStates());
    await DioHelper.postData(
      url: user_register,
      data: {
        'email': email,
        'username': name,
        'password': password,
        'phoneNumber': phone,
        'government': government,
        'gender': gender,
      },
    )!
        .then((value) {
      print(value.data);
      print(value.statusCode);
      print(value.statusMessage);
      emit(UserSignUpSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(UserSignUpErrorStates(error.toString()));
    });
  }
}
