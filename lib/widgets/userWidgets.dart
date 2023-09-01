import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:snay3y/core/route/routes.dart';
import '../core/validator/validation.dart';

String? userButtonWord;
String? userHintWord;

class UserForgotPassWidget extends StatefulWidget {
  @override
  State<UserForgotPassWidget> createState() => _UserForgotPassWidgetState();
}

class _UserForgotPassWidgetState extends State<UserForgotPassWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 180),
        const Center(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "هل نسيت كلمة المرور؟",
            style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
        )),
        Container(
          width: 180,
          height: 72,
          child: const Text(
              textAlign: TextAlign.center,
              "ادخل رقم الهاتف الخاص بك وسوف نرسل لك الكود التأكيدى عليه",
              style: TextStyle(
                  color: Color(0xffC6C7D5),
                  fontSize: 14,
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
  GlobalKey<FormState> userFormKey = GlobalKey();
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: userFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "رقم الهاتف",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  fontFamily: "Tajawal"),
            ),
          ),
          //phone field with country code

          TextFormField(
            validator: (data) {
              return Validator.validatePhone(data);
            },
            keyboardType: TextInputType.phone,
            onChanged: (data) {
              phoneNumber = data;
            },
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.phone_android_sharp,
                  color: Color(0xff91c8e4),
                  size: 20,
                ),
                hintText: "ادخل رقم الهاتف",
                hintStyle: TextStyle(
                    color: Colors.grey, fontSize: 14, fontFamily: "Tajawal"),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff91c8e4)))),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
              onPressed: () {
                // if (userFormKey.currentState!.validate()) {
                //   Navigator.pushNamed(context, Routes.userConfirmCodeRouteName);
                // }
              },
              child: wordOfElevatedButton(userButtonWord!),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4682A9),
                padding: const EdgeInsets.all(15),
              )),
        ],
      ),
    );
  }

  Widget wordOfElevatedButton(String word) {
    return Text(word, style: const TextStyle(fontSize: 20, fontFamily: "Tajawal"));
  }
}

class PinPutWidget extends StatelessWidget {
  String? oTPCode;
  final defaultPinTheme = PinTheme(
      width: 40,
      height: 68,
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(bottom: BorderSide(color: Colors.grey, width: 3))),
      textStyle: const TextStyle(fontSize: 22, color: Colors.black));

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
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 3),
          ),
        ),
      ),
      onCompleted: (code) {
        oTPCode = code;
        print(oTPCode);
      },
    );
  }
}
