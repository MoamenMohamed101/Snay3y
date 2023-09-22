import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snay3y/end_points.dart';
import 'package:snay3y/helpers/dio_helper.dart';
import 'package:snay3y/screens/technician_screens/signUp/cubit/states.dart';

class TechSignUpCubit extends Cubit<TechSignUpStates> {
  TechSignUpCubit() : super(SignUpInitialStates());

  static TechSignUpCubit get(context) => BlocProvider.of(context);

  String? valueChooseTech;
  String? genderChooseTech;
  var technicianQuadrupleNameController = TextEditingController();
  var technicianPasswordController = TextEditingController();
  var technicianNameController = TextEditingController();
  var technicianPhoneController = TextEditingController();
  var technicianIdNumberController = TextEditingController();
  var technicianJobNameController = TextEditingController();

  var formStateTech = GlobalKey<FormState>();

  inPutFactorValueDropDown({required bool? type, required value}) {
    type == true ? valueChooseTech = value : genderChooseTech = value;
    emit(SignUpInPutFactorValueStates());
  }

  File? idImage;

  var picker = ImagePicker();

  getIdImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      idImage = File(pickedFile.path);
      emit(TechSignUpImagePickedSuccessStates());
    } else {
      print('No image selected.');
      emit(TechSignUpImagePickedErrorStates());
    }
  }

  File? personalImage;

  var personalPicker = ImagePicker();

  getPersonalImage() async {
    final pickedFile =
        await personalPicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      personalImage = File(pickedFile.path);
      emit(TechSignUpImagePickedSuccessStates());
    } else {
      print('No image selected.');
      emit(TechSignUpImagePickedErrorStates());
    }
  }

  void techSignUp(
      {required String? name,
      required email,
      required password,
      required phone,
      required government,
      required fullName,
      required nationalId,
      required jobTitle,
      required nationalIdImage,
      required gender}) async {
    emit(TechSignUpLoadingStates());
    await DioHelper.postData(
      url: tech_register,
      data: {
        'email': email,
        'username': name,
        'password': password,
        'phoneNumber': phone,
        'government': government,
        'fullName': fullName,
        'nationalId': nationalId,
        'jobTitle': jobTitle,
        'nationalIdImage': nationalIdImage,
        'gender': gender,
      },
    )!
        .then((value) {
      debugPrint(value.data);
      debugPrint(value.statusCode.toString());
      debugPrint(value.statusMessage);
      emit(TechSignUpSuccessStates());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(TechSignUpErrorStates(error.toString()));
    });
  }
}
