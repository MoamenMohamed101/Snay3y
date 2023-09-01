import 'dart:async';
import 'package:flutter/material.dart';
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
                    const Text(
                      "سوف نرسل لك الكود التأكيدى علي رقم الهاتف",
                      style: TextStyle(
                        fontFamily: "Tajawal",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$timeLeft",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: "Tajawal",
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            " إعادة إرسال الكود",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
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
                    ElevatedButton(
                      onPressed: () {
                       Navigator.of(context).pushNamed(Routes.resetPasswordPageRoute);
                      },
                      child: const Text('تأكيد'),
                    )
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
