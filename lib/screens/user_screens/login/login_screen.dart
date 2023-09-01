import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                      fit: BoxFit.cover
                    ),
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
                            const SizedBox(
                              height: 224,
                            ),
                            const Text(
                              'البريد الإلكتروني',
                              style: TextStyle(
                                fontSize: 20,
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
                              fontOfHint: 16,
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            const Text(
                              'كلمة المرور',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            AppTextFormField(
                              controller: cubit.passwordController,
                              focusNode: cubit.passwordFocusNode,
                              keyBoardType: TextInputType.visiblePassword,
                              onSave: (data) {
                                cubit.password = data;
                              },
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                return Validator.validatePassword(value);
                              },
                              hintText: '*******************',
                              fontOfHint: 16,
                              secure: cubit.isPasswordSecure,
                              suffixIcon: cubit.isPasswordSecure
                                  ? IconButton(
                                      onPressed: () {
                                        cubit.hidePassword();
                                      },
                                      icon:
                                          const Icon(Icons.visibility_outlined))
                                  : IconButton(
                                      onPressed: () {
                                        cubit.hidePassword();
                                      },
                                      icon: const Icon(
                                          Icons.visibility_off_outlined)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(Routes.userForgotPassRouteName);
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.transparent),
                              ),
                              child: const Text(
                                'هل نسيت كلمه المرور؟',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: kGreyColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            AppMainButton(
                              title: 'تسجيل الدخول',
                              onTap: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.formKey.currentState!.save();
                                } else {
                                  const snackBar = SnackBar(
                                    content: Text('Faild to login!'),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pushNamed(Routes.signUpPageRouteUser);
                              },
                              child: Align(
                                child: RichText(
                                  text: const TextSpan(
                                      text: 'ليس لدي حساب ؟ ',
                                      style: TextStyle(
                                          color: kTextColor, fontSize: 12),
                                      children: [
                                        TextSpan(
                                          text: 'إنشاء حساب',
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
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
