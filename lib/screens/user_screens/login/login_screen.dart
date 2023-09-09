import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/constants.dart';
import 'package:snay3y/core/route/routes.dart';
import 'package:snay3y/core/validator/validation.dart';
import 'package:snay3y/screens/user_screens/login/cubit/cubit.dart';
import 'package:snay3y/screens/user_screens/login/cubit/states.dart';
import 'package:snay3y/widgets/app_main_button.dart';
import 'package:snay3y/widgets/app_text_form_field.dart';

class UserLoginView extends StatelessWidget {
  const UserLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserLoginCubit(),
      child: Builder(
        builder: (context) {
          final cubit = UserLoginCubit.of(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                // Image.asset(
                //   'assets/images/userLoginbackgroung.png',
                //   height: MediaQuery.of(context).viewInsets.bottom == 0 ? 812 : 900,
                // ),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/userLoginbackgroung.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BlocBuilder<UserLoginCubit, UserLoginState>(
                    builder: (context, state) {
                      return Form(
                        key: cubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 224.h,
                            ),
                            Text(
                              'البريد الإلكتروني',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: kTextColor,
                              ),
                            ),
                            AppTextFormField(
                              controller: cubit.emailController,
                              focusNode: cubit.emailFocusNode,
                              onEditingComplete: () {
                                FocusScope.of(context).requestFocus(
                                  cubit.passwordFocusNode,
                                );
                              },
                              keyBoardType: TextInputType.emailAddress,
                              onSave: (data) {
                                cubit.email = data;
                              },
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                return Validator.validateEmail(value);
                              },
                              hintText: 'Example@gmail.com',
                              fontOfHint: 16.sp,
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            Text(
                              'كلمة المرور',
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w500),
                            ),
                            AppTextFormField(
                              controller: cubit.passwordController,
                              focusNode: cubit.passwordFocusNode,
                              keyBoardType: TextInputType.visiblePassword,
                              onSave: (data) {
                                cubit.password = data;
                              },
                              textInputAction: TextInputAction.done,
                              // validator: (value) {
                              //   return Validator.validatePassword(value);
                              // },
                              hintText: '*******************',
                              fontOfHint: 16.sp,
                              secure: cubit.isPasswordSecure,
                              suffixIcon: cubit.isPasswordSecure
                                  ? IconButton(
                                      onPressed: () {
                                        cubit.hidePassword();
                                      },
                                      icon: const Icon(
                                        Icons.visibility_outlined,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        cubit.hidePassword();
                                      },
                                      icon: const Icon(
                                        Icons.visibility_off_outlined,
                                      ),
                                    ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.userForgotPassRouteName);
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.transparent),
                              ),
                              child: Text(
                                'هل نسيت كلمه المرور؟',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: kGreyColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            ConditionalBuilder(
                              condition: state is! UserLoginLoadingStates,
                              builder: (context) => AppMainButton(
                                title: 'تسجيل الدخول',
                                onTap: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    //cubit.formKey.currentState!.save();
                                    cubit.userLogin(
                                      email: cubit.emailController.text,
                                      password: cubit.passwordController.text,
                                    );
                                  } else {
                                    const snackBar = SnackBar(
                                      content: Text('Faild to login!'),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                              ),
                              fallback: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.signUpPageRouteUser);
                              },
                              child: Align(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'ليس لدي حساب ؟ ',
                                    style: TextStyle(
                                        color: kTextColor, fontSize: 12.sp),
                                    children: [
                                      TextSpan(
                                        text: 'إنشاء حساب',
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
