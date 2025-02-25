import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/components/components.dart';
import 'package:snay3y/constants.dart';
import 'package:snay3y/core/route/routes.dart';
import 'package:snay3y/core/validator/validation.dart';
import 'package:snay3y/helpers/cash_helper.dart';
import 'package:snay3y/screens/user_screens/home/home_screen.dart';
import 'package:snay3y/screens/user_screens/login/cubit/cubit.dart';
import 'package:snay3y/screens/user_screens/login/cubit/states.dart';
import 'package:snay3y/widgets/app_main_button.dart';
import 'package:snay3y/widgets/app_text_form_field.dart';

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserLoginCubit(),
      child: BlocConsumer<UserLoginCubit, UserLoginState>(
        builder: (BuildContext context, state) {
          final cubit = UserLoginCubit.of(context);
          return Scaffold(
            // what this line do? it's make the keyboard not hide the text field
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/userLoginbackgroung.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  // what BlocBuilder do? it's make the widget rebuild when the state change
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
                              'E-mail Address',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: kTextColor,
                              ),
                            ),
                            AppTextFormField(
                              controller: cubit.emailController,
                              // what focusNode do? it's make the keyboard focus on the text field
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
                              'Password',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            AppTextFormField(
                              onFieldSubmitted: (value) {
                                if (cubit.formKey.currentState!.validate()) {
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
                                return null;
                              },
                              controller: cubit.passwordController,
                              // what focusNode do? it make user control from TextFormField to anther TextFormField by click on the next button on the keyboard
                              focusNode: cubit.passwordFocusNode,
                              keyBoardType: TextInputType.visiblePassword,
                              onSave: (data) {
                                cubit.password = data;
                              },
                              // what textInputAction do? it make the keyboard change the enter button to done button
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                return Validator.validatePassword(value);
                              },
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
                                'Did you forget your password?',
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
                                title: 'Login',
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
                                    text: 'Don\'t have an account?',
                                    style: TextStyle(
                                        color: kTextColor, fontSize: 12.sp),
                                    children: [
                                      TextSpan(
                                        text: '  Create Account',
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
        listener: (BuildContext context, Object? state) {
          if (state is UserLoginSuccessStates) {
            if (state.userLoginModel!.message == "loged in successfully") {
              showToast(
                message: state.userLoginModel!.message,
                toastStates: ToastStates.SUCCESS,
              );
              CachHelper.saveData(
                key: 'userLoginToken',
                value: state.userLoginModel!.access_token,
              )!
                  .then(
                (value) {
                  navigateAndFinish(
                    context: context,
                    widget: const UserHomeScreen(),
                  );
                },
              );
            } else {
              showToast(
                message: state.userLoginModel!.message,
                toastStates: ToastStates.ERROR,
              );
            }
          }
        },
      ),
    );
  }
}
