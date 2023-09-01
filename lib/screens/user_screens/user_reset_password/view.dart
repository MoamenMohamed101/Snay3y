import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snay3y/constants.dart';
import 'package:snay3y/core/validator/validation.dart';
import 'package:snay3y/screens/user_screens/user_reset_password/cubit.dart';
import 'package:snay3y/widgets/app_main_button.dart';
import 'package:snay3y/widgets/app_text_form_field.dart';

class UserResetPasswordView extends StatelessWidget {
  const UserResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserResetPasswordCubit(),
      child: Builder(builder: (context) {
        final cubit = UserResetPasswordCubit.of(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                          AssetImage('assets/images/userLoginbackgroung.png'),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.only(top: 61),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Color(0xff15224F),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child:
                    BlocBuilder<UserResetPasswordCubit, UserResetPasswordState>(
                  builder: (context, state) {
                    return Form(
                      key: cubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 178,
                          ),
                          const Align(
                            child: Text(
                              'اعاده تسجيل كلمه المرور',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: kTextColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const SizedBox(height: 59),
                          const Text(
                            'كلمة المرور',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 5),
                          AppTextFormField(
                            fontOfHint: 16,
                            hintText: 'ادخل كلمة المرور ',
                            controller: cubit.passwordController,
                            focusNode: cubit.passwordFocusNode,
                            keyBoardType: TextInputType.visiblePassword,
                            secure: cubit.isPasswordSecure,
                            onSave: (data) {
                              cubit.password = data;
                            },
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(cubit.comfirmPasswordFocusNode);
                            },
                            validator: (value) {
                              return Validator.validatePassword(value);
                            },
                            suffixIcon: cubit.isPasswordSecure
                                ? IconButton(
                                    onPressed: () {
                                      cubit.hidePassword();
                                    },
                                    icon: const Icon(Icons.visibility_outlined))
                                : IconButton(
                                    onPressed: () {
                                      cubit.hidePassword();
                                    },
                                    icon: Icon(Icons.visibility_off_outlined)),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          const Text(
                            'تأكيد كلمة المرور',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppTextFormField(
                            fontOfHint: 16,
                            hintText: 'ادخل كلمة المرورالجديدة مره أخري',
                            secure: cubit.isComfirmPasswordSecure,
                            suffixIcon: cubit.isComfirmPasswordSecure
                                ? IconButton(
                                    onPressed: () {
                                      cubit.hideComfirmPassword();
                                    },
                                    icon: const Icon(Icons.visibility_outlined))
                                : IconButton(
                                    onPressed: () {
                                      cubit.hideComfirmPassword();
                                    },
                                    icon: const Icon(
                                        Icons.visibility_off_outlined)),
                            controller: cubit.comfirmPasswordController,
                            focusNode: cubit.comfirmPasswordFocusNode,
                            keyBoardType: TextInputType.visiblePassword,
                            onSave: (data) {
                              cubit.comfirmPassword = data;
                            },
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.isEmpty) return 'حقل فارغ!';
                              if (value != cubit.passwordController.text) {
                                return 'كلمة المرور غير متطابقة';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          AppMainButton(
                            title: 'تأكيد',
                            onTap: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.formKey.currentState!.save();
                              } else {
                                const snackBar = SnackBar(
                                  content: Text('حدث خطأ حاول مرة اخري'),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
        );
      }),
    );
  }
}
