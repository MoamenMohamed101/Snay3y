import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/core/route/routes.dart';
import 'package:snay3y/widgets/technicianWidgets.dart';
import 'package:snay3y/widgets/userWidgets.dart';

class TechnicianConfirmCodeScreen extends StatefulWidget {
  const TechnicianConfirmCodeScreen({super.key});

  @override
  State<TechnicianConfirmCodeScreen> createState() =>
      _TechnicianConfirmCodeScreenState();
}

class _TechnicianConfirmCodeScreenState
    extends State<TechnicianConfirmCodeScreen> {
  int timeLeft = 30;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    technichianButtonWord = "إرسال";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                const CurvedTopColor(),
                const EllipsePhoto(),
                const RectangleImage(),
                Column(
                  children: [
                    const SizedBox(height: 240),
                     Text(
                      "سوف نرسل لك الكود التأكيدى علي رقم الهاتف",
                      style: TextStyle(
                        fontFamily: "Tajawal",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$timeLeft",
                          style:  TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            fontFamily: "Tajawal",
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child:  Text(
                            " إعادة إرسال الكود",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              fontFamily: "Tajawal",
                              color: Color(0xff91c8e4),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: PinPutWidget(),
                    ),
// SizedBox(height: 30,),
//                     ElevatedButton(
//
//
//                         onPressed: () {
//                           Navigator.of(context).pushNamed(Routes.resetPasswordPageRoute);
//
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xff4682A9),
//                           padding: const EdgeInsets.symmetric(horizontal: 150,vertical: 12),
//                         ),child: Text("تأكيد",style:  TextStyle(fontSize: 24.sp, fontFamily: "Tajawal")),)


                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
