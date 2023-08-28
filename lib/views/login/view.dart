import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_margin_widget/flutter_margin_widget.dart';
import 'package:snay3y/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snay3y/core/validator/validation.dart';
import 'package:snay3y/views/login/cubit.dart';
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
            //physics: const NeverScrollableScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  color: kMainColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 42),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: Color(0xff15224F),
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      const CircleAvatar(
                        backgroundColor: kGreyColor,
                        radius: 50,
                      ),
                    ],
                  ),
                ),
                Margin(
                  margin: const EdgeInsets.only(top: 140),
                  child: Column(
                    children: [
                      Container(
                        transform: Matrix4.translationValues(0.0, -91.0, 0.0),
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            SvgPicture.asset(
                              'assets/images/Path2.svg',
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
                                    const SizedBox(
                                      height: 150,
                                    ),
                                    const Align(
                                      child: Text(
                                        'تسجيل الدخول ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: kTextColor,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    const Text(
                                      'رقم الهاتف',
                                      style: TextStyle(
                                          fontSize: 18,
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
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    const Text(
                                      'كلمة المرور',
                                      style: TextStyle(
                                          fontSize: 18,
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
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        overlayColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.transparent),
                                      ),
                                      child: const Text(
                                        'هل نسيت كلمه المرور؟',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: kMainColor),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    AppMainButton(
                                      title: 'تسجيل الدخول',
                                      onTap: () {
                                        if (cubit.formKey.currentState!
                                            .validate()) {
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
                                      child: Align(
                                        child: RichText(
                                            text: const TextSpan(
                                                text: 'ليس لدي حساب ؟ ',
                                                style: TextStyle(
                                                    color: kTextColor),
                                                children: [
                                              TextSpan(
                                                text: 'إنشاء حساب',
                                                style: TextStyle(
                                                    color: kPrimaryColor),
                                              ),
                                            ])),
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
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
