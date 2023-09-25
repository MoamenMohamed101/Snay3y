import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/components/components.dart';
import 'package:snay3y/core/route/routes.dart';
import 'package:snay3y/core/validator/validation.dart';
import 'package:snay3y/generated/l10n.dart';
import 'package:snay3y/screens/user_screens/signUp/cubit/cubit.dart';
import 'package:snay3y/screens/user_screens/signUp/cubit/states.dart';
import 'package:snay3y/widgets/app_main_button.dart';
import 'package:snay3y/widgets/app_text_form_field.dart';

class UserSignUpScreen extends StatelessWidget {
  const UserSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List listItem = [
      S.of(context).signUPCountryCairoUser,
      S.of(context).signUPCountryAlexandriaUser,
      S.of(context).signUPCountryGizehUser,
      S.of(context).signUPCountryShubraElKheimaUser,
      S.of(context).signUPCountryPortSaidUser,
      S.of(context).signUPCountrySuezUser,
    ];
    List chooseType = [
      S.of(context).signUPGenderMaleUser,
      S.of(context).signUPGenderFeMaleUser,
    ];
    return BlocProvider(
      create: (BuildContext context) => UserSignUpCubit(),
      child: BlocConsumer<UserSignUpCubit, UserSignUpStates>(
        builder: (BuildContext context, state) {
          var cubit = UserSignUpCubit.get(context);
          dropDownButton({String? governorate, String? gender, bool? type}) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type == true ? governorate! : gender!,
                  style: TextStyle(
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
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.w),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    hint: type == true
                        ? Text(S.of(context).signUPChooseCountry)
                        : Text(S.of(context).signUPChooseGender),
                    isExpanded: true,
                    value: type == true
                        ? cubit.valueChooseUser
                        : cubit.genderChooseUser,
                    iconSize: 36.sp,
                    underline: const SizedBox(),
                    style: TextStyle(color: Colors.black, fontSize: 19.sp),
                    icon: const Icon(Icons.arrow_drop_down),
                    dropdownColor: Colors.white,
                    onChanged: (newValue) {
                      cubit.inPutUserValueDropDown(type: type, value: newValue);
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
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.black),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              S.of(context).signUPAppBar,
                              style: TextStyle(
                                color: const Color(0xFF322653),
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          S.of(context).userSignUPEmailTitle,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppTextFormField(
                          keyBoardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: cubit.userEmailController,
                          hintText: S.of(context).userSignUPEmailDescription,
                          validator: (value) {
                            return Validator.validateEmail(value);
                          },
                          focusNode: cubit.emailFocus,
                          onFieldSubmitted: (value) {
                            cubit.emailFocus.unfocus();
                            FocusScope.of(context)
                                .requestFocus(cubit.passwordFocus);
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          S.of(context).signUPPassword,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppTextFormField(
                          onFieldSubmitted: (value) {
                            cubit.passwordFocus.unfocus();
                            FocusScope.of(context)
                                .requestFocus(cubit.nameFocus);
                            return null;
                          },
                          keyBoardType: TextInputType.visiblePassword,
                          controller: cubit.userPasswordController,
                          hintText: S.of(context).signUPPasswordDescription,
                          validator: (value) {
                            return Validator.validatePassword(value);
                          },
                          focusNode: cubit.passwordFocus,
                          textInputAction: TextInputAction.next,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          S.of(context).signUPUserName,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppTextFormField(
                          onFieldSubmitted: (value) {
                            cubit.nameFocus.unfocus();
                            FocusScope.of(context)
                                .requestFocus(cubit.phoneFocus);
                            return null;
                          },
                          keyBoardType: TextInputType.name,
                          controller: cubit.userNameController,
                          hintText: S.of(context).signUPUserNameDescription,
                          validator: (value) {
                            return Validator.validateName(value);
                          },
                          focusNode: cubit.nameFocus,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          S.of(context).signUPPhoneNumber,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppTextFormField(
                          keyBoardType: TextInputType.phone,
                          controller: cubit.userPhoneNumberController,
                          hintText: S.of(context).signUPPhoneNumberDescription,
                          validator: (value) {
                            return Validator.validatePhone(value);
                          },
                          focusNode: cubit.phoneFocus,
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        dropDownButton(
                            type: true,
                            governorate: S.of(context).signUPCountryTitle),
                        SizedBox(
                          height: 10.h,
                        ),
                        dropDownButton(
                          type: false,
                          gender: S.of(context).signUPGenderTitle,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ConditionalBuilder(
                          condition: state is! UserSignUpLoadingStates,
                          builder: (context) => AppMainButton(
                            title: S.of(context).signUPButton,
                            onTap: () async {
                              cubit.userSignUp(
                                name: cubit.userNameController.text,
                                email: cubit.userEmailController.text,
                                password: cubit.userPasswordController.text,
                                phone: cubit.userPhoneNumberController.text,
                                government: cubit.valueChooseUser,
                                gender: cubit.genderChooseUser,
                              );
                            },
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, Object? state) {
          if (state is UserSignUpSuccessStates) {
            if (state.userSignUpModel.message ==
                "user has been created successfully") {
              showToast(
                message: state.userSignUpModel.message!,
                toastStates: ToastStates.SUCCESS,
              );
              Navigator.of(context).pushNamed(
                Routes.loginPageRouteUser,
              );
            } else {
              showToast(
                message: state.userSignUpModel.message!,
                toastStates: ToastStates.ERROR,
              );
            }
          }
        },
      ),
    );
  }
}
