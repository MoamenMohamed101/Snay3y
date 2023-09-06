import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/core/route/routes.dart';
import 'package:snay3y/core/validator/validation.dart';


String? technichianButtonWord;
String? technicianHintWord;

class CurvedTopColor extends StatelessWidget {
  const CurvedTopColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff91c8e4),
    );
  }
}

class TechnicianCustomTextForm extends StatelessWidget {
  GlobalKey<FormState> technicianFormKey = GlobalKey();
  String? phoneNumber;

  TechnicianCustomTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: technicianFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Padding(
            padding: EdgeInsets.all(0.0),
            child: Text(
              "رقم الهاتف",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
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
              Navigator.of(context).pushNamed(Routes.technicianConfirmCodeRouteName,);
            },
            decoration:  InputDecoration(
              prefixIcon: Icon(
                Icons.phone_android_sharp,
                color: Color(0xff91c8e4),
                size: 20,
              ),
              hintText: "ادخل رقم الهاتف",
              hintStyle: TextStyle(
                  color: Colors.grey, fontSize: 12.sp, fontFamily: "Tajawal"),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff91c8e4)),
              ),
            ),
          ),

          const SizedBox(height: 40),
          ElevatedButton(
              onPressed: () {
                if (technicianFormKey.currentState!.validate()) {
                  Navigator.pushNamed(
                      context, Routes.technicianConfirmCodeRouteName);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4682A9),
                padding: const EdgeInsets.all(15),
              ),
              child: wordOfElevatedButton(technichianButtonWord!)),
        ],
      ),
    );
  }

  Widget wordOfElevatedButton(String word) {
    return Text(word,
        style:  TextStyle(fontSize: 24.sp, fontFamily: "Tajawal"));
  }
}

class RectangleImage extends StatelessWidget {
  const RectangleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 720.h,
      width: 380.w,

      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
          color: Colors.white,
        ),
        // 85
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: MediaQuery.of(context).size.height * .77,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "assets/images/Rectangle 3.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class EllipsePhoto extends StatelessWidget {
  const EllipsePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(70.0),
      child: Image.asset("assets/images/Ellipse 3.png"),
    );
  }
}

class TechnicianForgotPassWidget extends StatelessWidget {
  const TechnicianForgotPassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 240),
        const Center(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "نسيت كلمة المرور",
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
          child: TechnicianCustomTextForm(),
        ),
      ],
    );
  }
}
