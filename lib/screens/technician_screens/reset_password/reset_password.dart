import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_margin_widget/flutter_margin_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/constants.dart';
import 'package:snay3y/core/validator/validation.dart';
import 'package:snay3y/screens/technician_screens/reset_password/cubit.dart';
import 'package:snay3y/widgets/app_main_button.dart';
import 'package:snay3y/widgets/app_text_form_field.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Builder(builder: (context) {
        final cubit = ResetPasswordCubit.of(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300.h,
                  color: kMainColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 42),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon:  Icon(
                          Icons.arrow_back,
                          size: 20.sp,
                          color: const Color(0xff15224F),
                        ),
                      ),
                       SizedBox(
                        width: 70.w,
                      ),
                      const CircleAvatar(
                        backgroundColor: kGreyColor,
                        radius: 50,
                      ),
                    ],
                  ),
                ),
                BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  builder: (context, state) {
                    return Form(
                      key: cubit.formKey,
                      child: Margin(
                        margin: const EdgeInsets.only(top: 173),
                        child: Column(
                          children: [
                            Stack(
                              fit: StackFit.passthrough,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(100),
                                    ),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child:  Image(
                                    image: const AssetImage(
                                      'assets/images/Rectangle 1.png',
                                    ),
                                    fit: BoxFit.cover,
                                    width: double.infinity.w,
                                    height: 300.h,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                       SizedBox(
                                        height: 50.h,
                                      ),
                                       Align(
                                        child: Text(
                                          'إعادة تعيين كلمة المرور',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: kTextColor,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                       SizedBox(
                                        height: 50.h,
                                      ),
                                       Text(
                                        'كلمة المرور',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      AppTextFormField(
                                        hintText: 'ادخل كلمة المرور الجديدة',
                                        controller: cubit.passwordController,
                                        focusNode: cubit.passwordFocusNode,
                                        keyBoardType:
                                            TextInputType.visiblePassword,
                                        secure: cubit.isPasswordSecure,
                                        onSave: (data) {
                                          cubit.password = data;
                                        },
                                        textInputAction: TextInputAction.next,
                                        onEditingComplete: () {
                                          FocusScope.of(context).requestFocus(
                                              cubit.comfirmPasswordFocusNode);
                                        },
                                        validator: (value) {
                                          return Validator.validatePassword(
                                              value);
                                        },
                                        suffixIcon: cubit.isPasswordSecure
                                            ? IconButton(
                                                onPressed: () {
                                                  cubit.hidePassword();
                                                },
                                                icon: const Icon(
                                                    Icons.visibility_outlined))
                                            : IconButton(
                                                onPressed: () {
                                                  cubit.hidePassword();
                                                },
                                                icon: const Icon(Icons
                                                    .visibility_off_outlined)),
                                      ),
                                       SizedBox(
                                        height: 35.h,
                                      ),
                                       Text(
                                        'تأكيد كلمة المرور',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      AppTextFormField(
                                        hintText:
                                            'ادخل كلمة المرورالجديدة مره أخري',
                                        secure: cubit.isComfirmPasswordSecure,
                                        suffixIcon: cubit
                                                .isComfirmPasswordSecure
                                            ? IconButton(
                                                onPressed: () {
                                                  cubit.hideComfirmPassword();
                                                },
                                                icon: const Icon(
                                                    Icons.visibility_outlined))
                                            : IconButton(
                                                onPressed: () {
                                                  cubit.hideComfirmPassword();
                                                },
                                                icon: const Icon(Icons
                                                    .visibility_off_outlined)),
                                        controller:
                                            cubit.comfirmPasswordController,
                                        focusNode:
                                            cubit.comfirmPasswordFocusNode,
                                        keyBoardType:
                                            TextInputType.visiblePassword,
                                        onSave: (data) {
                                          cubit.comfirmPassword = data;
                                        },
                                        textInputAction: TextInputAction.done,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'حقل فارغ!';
                                          }
                                          if (value !=
                                              cubit.passwordController.text) {
                                            return 'كلمة المرور غير متطابقة';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                       SizedBox(
                                        height: 50.h,
                                      ),
                                      AppMainButton(
                                        title: 'تأكيد',
                                        onTap: () {
                                          if (cubit.formKey.currentState!
                                              .validate()) {
                                            cubit.formKey.currentState!.save();
                                          } else {
                                            const snackBar = SnackBar(
                                              content:
                                                  Text('حدث خطأ حاول مرة اخري'),
                                            );

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        },
                                      ),
                                       SizedBox(
                                        height: 5.h,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
