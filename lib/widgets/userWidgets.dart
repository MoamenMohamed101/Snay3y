import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:snay3y/core/route/routes.dart';
import '../core/validator/validation.dart';

String? userButtonWord;
String? userHintWord;

class UserForgotPassWidget extends StatefulWidget {
  const UserForgotPassWidget({super.key});

  @override
  State<UserForgotPassWidget> createState() => _UserForgotPassWidgetState();
}

class _UserForgotPassWidgetState extends State<UserForgotPassWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 180),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "هل نسيت كلمة المرور؟",
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 270.w,
          height: 75.h,
          child: Text(
              textAlign: TextAlign.center,
              "ادخل رقم الهاتف الخاص بك وسوف نرسل لك الكود التأكيدى عليه",
              style: TextStyle(
                  color: const Color(0xffC6C7D5),
                  fontSize: 20.sp,
                  fontFamily: "Tajawal")),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: UserCustomTextForm(),
        ),
      ],
    );
  }
}

class UserCustomTextForm extends StatelessWidget {
  final GlobalKey<FormState> userFormKey = GlobalKey();
  String? phoneNumber;

  UserCustomTextForm({super.key, this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: userFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "رقم الهاتف",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                fontFamily: "Tajawal",
              ),
            ),
          ),
          //phone field with country code

          TextFormField(
            validator: (data) {
              return Validator.validatePhone(data);
            },
            keyboardType: TextInputType.phone,
            onFieldSubmitted: (data) {
              phoneNumber = data;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.phone_android_sharp,
                color: const Color(0xff91c8e4),
                size: 16.sp,
              ),
              hintText: "ادخل رقم الهاتف",
              hintStyle: const TextStyle(
                  color: Colors.grey, fontSize: 14, fontFamily: "Tajawal"),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff91c8e4),
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h),
          ElevatedButton(
            onPressed: () {
              if (userFormKey.currentState!.validate()) {
                Navigator.of(context)
                    .pushNamed(Routes.userConfirmCodeRouteName);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff4682A9),
              padding: const EdgeInsets.all(15),
            ),
            child: wordOfElevatedButton(userButtonWord!),
          ),
        ],
      ),
    );
  }

  Widget wordOfElevatedButton(String word) {
    return Text(word, style: TextStyle(fontSize: 24.sp, fontFamily: "Tajawal"));
  }
}

class PinPutWidget extends StatelessWidget {
  String? oTPCode;
  final defaultPinTheme = PinTheme(
    width: 40.w,
    height: 68.h,
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.transparent,
      border: Border(
        bottom: BorderSide(color: Colors.grey, width: 3.w),
      ),
    ),
    textStyle: const TextStyle(fontSize: 22, color: Colors.black),
  );

  PinPutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 3),
          ),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 3.w),
          ),
        ),
      ),
      onCompleted: (code) {
        oTPCode = code;
        print(oTPCode);
        Navigator.of(context).pushNamed(Routes.userResetPasswordPageRoute);
      },
    );
  }
}
