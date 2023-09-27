import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_margin_widget/flutter_margin_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/constants.dart';
import 'package:snay3y/core/route/routes.dart';
import 'package:snay3y/core/validator/validation.dart';
import 'package:snay3y/screens/technician_screens/login/cubit/cubit.dart';
import 'package:snay3y/widgets/app_main_button.dart';
import 'package:snay3y/widgets/app_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        final cubit = LoginCubit.of(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: double.infinity.w,
                  height: 300.h,
                  color: kMainColor,
                ),
                // appBar part
                Padding(
                  padding: const EdgeInsets.only(top: 42),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 20.sp,
                          color: Color(0xff15224F),
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
                Margin(
                  // 140
                  margin: const EdgeInsets.only(top: 240),
                  child: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                          ),
                        ),
                        width: double.infinity,
                        transform: Matrix4.translationValues(0.0, -91.0, 0.0),
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            // SvgPicture.asset(
                            //   'assets/images/Rectangle 1.svg',
                            //   fit: BoxFit.cover,
                            // ),
                            Image(
                              image:
                                  AssetImage('assets/images/Rectangle 1.png'),
                              fit: BoxFit.cover,
                              height: 300.h,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Form(
                                key: cubit.formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 80.h,
                                    ),
                                    Align(
                                      child: Text(
                                        'تسجيل الدخول ',
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
                                      'رقم الهاتف',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    AppTextFormField(
                                      controller: cubit.phoneController,
                                      focusNode: cubit.phoneFocusNode,
                                      onEditingComplete: () {
                                        FocusScope.of(context).requestFocus(
                                            cubit.passwordFocusNode);
                                      },
                                      keyBoardType: TextInputType.phone,
                                      onSave: (data) {
                                        cubit.phone = data;
                                      },
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        return Validator.validatePhone(value);
                                      },
                                      hintText: 'ادخل رقم الهاتف',
                                    ),
                                    SizedBox(
                                      height: 35.h,
                                    ),
                                    Text(
                                      'كلمة المرور',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    AppTextFormField(
                                      controller: cubit.passwordController,
                                      focusNode: cubit.passwordFocusNode,
                                      keyBoardType:
                                          TextInputType.visiblePassword,
                                      onSave: (data) {
                                        cubit.password = data;
                                      },
                                      textInputAction: TextInputAction.done,
                                      validator: (value) {
                                        return Validator.validatePassword(
                                            value);
                                      },
                                      hintText:
                                          'كلمة المرور الخاصة بك على التطبيق',
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                          Routes.technicianForgotPassRouteName,
                                        );
                                      },
                                      style: ButtonStyle(
                                        overlayColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.transparent),
                                      ),
                                      child: Text(
                                        'هل نسيت كلمه المرور؟',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: kMainColor),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                    ),
                                    AppMainButton(
                                      title: 'تسجيل الدخول',
                                      onTap: () {
                                        // if (cubit.formKey.currentState!.validate()) {
                                        //   cubit.formKey.currentState!.save();
                                        // } else {
                                        //   const snackBar = SnackBar(
                                        //     content: Text('Faild to login!'),
                                        //   );
                                        //
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(snackBar);
                                        // }
                                        Navigator.of(context).pushNamed(
                                            Routes.technicianHomePageRoute);
                                      },
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          Routes.signUpPageRoute,
                                        );
                                      },
                                      child: Align(
                                        child: RichText(
                                          text: const TextSpan(
                                            text: 'ليس لدي حساب ؟ ',
                                            style: TextStyle(color: kTextColor),
                                            children: [
                                              TextSpan(
                                                text: 'إنشاء حساب',
                                                style: TextStyle(
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
