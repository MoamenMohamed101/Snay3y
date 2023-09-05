import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/components/components.dart';
import 'package:snay3y/generated/l10n.dart';
import 'package:snay3y/screens/technician_screens/signUp/cubit/cubit.dart';
import 'package:snay3y/screens/technician_screens/signUp/cubit/states.dart';

class UserSignUpScreen extends StatelessWidget {
  const UserSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List listItem = [
      S.of(context).signUPCountryCairoFactor,
      S.of(context).signUPCountryAlexandriaFactor,
      S.of(context).signUPCountryGizehFactor,
      S.of(context).signUPCountryShubraElKheimaFactor,
      S.of(context).signUPCountryPortSaidFactor,
      S.of(context).signUPCountrySuezFactor,
    ];
    List chooseType = [
      S.of(context).signUPGenderMaleFactor,
      S.of(context).signUPGenderFeMaleFactor,
    ];
    return BlocConsumer<SignUpCubit, SignUpStates>(
      builder: (BuildContext context, state) {
        var cubit = SignUpCubit.get(context);
        dropDownButton({String? governorate, String? gender, bool? type}) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type == true ? governorate! : gender!,
                  style:  TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                 SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 60,
                  padding:  EdgeInsets.symmetric(horizontal: 10.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.w),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    hint: type == true
                        ? Text(S.of(context).signUPChooseCountry)
                        : Text(S.of(context).signUPChooseGender),
                    isExpanded: true,
                    value:
                        type == true ? cubit.valueChooseFactor : cubit.genderChooseFactor,
                    iconSize: 36.sp,
                    underline: const SizedBox(),
                    style:  TextStyle(color: Colors.black, fontSize: 19.sp),
                    icon: const Icon(Icons.arrow_drop_down),
                    dropdownColor: Colors.white,
                    onChanged: (newValue) {
                      cubit.inPutFactorValueDropDown(type: type, value: newValue);
                    },
                    items: type == true
                        ? listItem.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList()
                        : chooseType.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                  ),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          backgroundColor: const Color(0xFF91C8E4),
          body: Form(
            key: cubit.formStateUser,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/انشاء حساب.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                     SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                         SizedBox(
                          width: 80.w,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          S.of(context).signUPAppBar,
                          style:  TextStyle(
                            color: Color(0xFF322653),
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    defaultTextFormField(
                      title: S.of(context).userSignUPEmailTitle,
                      hintText: S.of(context).userSignUPEmailDescription,
                      keyboardType: TextInputType.name,
                      showPrefixIcon: false,
                      validator: S.of(context).userSignUPEmailValidate,
                    ),
                    defaultTextFormField(
                      title: S.of(context).signUPPassword,
                      hintText: S.of(context).signUPPasswordDescription,
                      keyboardType: TextInputType.name,
                      showPrefixIcon: true,
                      validator: S.of(context).signUPPasswordValidate,
                    ),
                    defaultTextFormField(
                      title: S.of(context).signUPUserName,
                      hintText: S.of(context).signUPUserNameDescription,
                      keyboardType: TextInputType.name,
                      showPrefixIcon: false,
                      validator: S.of(context).signUPUserNameNameValidate,
                    ),
                    defaultTextFormField(
                      title: S.of(context).signUPPhoneNumber,
                      hintText: S.of(context).signUPPhoneNumberDescription,
                      keyboardType: TextInputType.phone,
                      showPrefixIcon: false,
                      validator: S.of(context).signUPPhoneNumberValidate,
                    ),
                    dropDownButton(
                        type: true,
                        governorate: S.of(context).signUPCountryTitle),
                    dropDownButton(
                        type: false, gender: S.of(context).signUPGenderTitle),
                    defaultButton(
                      color: const Color(0xFF4682A9),
                      voidCallback: () {
                        if (cubit.formStateUser.currentState!.validate()) {

                        }
                        showButtonSheet(context, 10.0, 10.0);
                      },
                      text: S.of(context).signUPButton,
                      width: double.infinity,
                      isUpperCase: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
