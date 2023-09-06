import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/widgets/technicianWidgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianForgotPassScreen extends StatefulWidget {
  const TechnicianForgotPassScreen({super.key});

  @override
  State<TechnicianForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<TechnicianForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    technichianButtonWord = "التالي";
    return Scaffold(
      backgroundColor: const Color(0xff91c8e4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                //const CurvedTopColor(),
                const EllipsePhoto(),
                const RectangleImage(),
                Column(
                  children: [
                    const SizedBox(height: 240),
                     Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "نسيت كلمة المرور",
                          style: TextStyle(
                              fontFamily: "Tajawal",
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      width: 180,
                      height: 60,
                      padding: EdgeInsets.only(top: 10),
                      child:  Text(
                        textAlign: TextAlign.center,
                        "ادخل رقم الهاتف الخاص بك وسوف نرسل لك الكود التأكيدى عليه",
                        style: TextStyle(
                          color: Color(0xffC6C7D5),
                          fontSize: 12.sp,
                          fontFamily: "Tajawal",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                      child: TechnicianCustomTextForm(),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
