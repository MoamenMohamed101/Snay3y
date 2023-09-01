import 'package:flutter/material.dart';
import 'package:snay3y/widgets/technicianWidgets.dart';

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
                      ),
                    ),
                    Container(
                      width: 180,
                      height: 72,
                      child: const Text(
                        textAlign: TextAlign.center,
                        "ادخل رقم الهاتف الخاص بك وسوف نرسل لك الكود التأكيدى عليه",
                        style: TextStyle(
                          color: Color(0xffC6C7D5),
                          fontSize: 14,
                          fontFamily: "Tajawal",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
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
