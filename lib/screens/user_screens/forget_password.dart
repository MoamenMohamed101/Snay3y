import 'package:flutter/material.dart';
import 'package:snay3y/widgets/userWidgets.dart';

class UserForGotPassScreen extends StatelessWidget {
  const UserForGotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    userButtonWord = "التالي";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
                children: [
              //Image.asset("assets/images/img.png"),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/img.png'),
                  ),
                ),
              ),
              const UserForgotPassWidget()
              // Column(children: [SizedBox(height: 140),
              //   Center(child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text("نسيت كلمة المرور",style: TextStyle(fontFamily: 'Tajawal',fontSize: 26,fontWeight:FontWeight.bold),),
              //   ))
              //   ,Container(width: 180,height:72,
              //     child: Text(textAlign: TextAlign.center,"ادخل رقم الهاتف الخاص بك وسوف نرسل لك الكود التأكيدى عليه"
              //         , style: TextStyle(color: Color(0xffC6C7D5),fontSize: 14,fontFamily: "Tajawal"
              //         )),
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: CustomTextForm()
              //   )
              // ],)
            ]),
          ],
        ),
      ),
    );
  }
}
