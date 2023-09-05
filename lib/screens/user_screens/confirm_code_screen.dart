import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/widgets/userWidgets.dart';

class UserConfirmCodeScreen extends StatelessWidget {
  const UserConfirmCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Center(
        child: Column(children: [
           SizedBox(
            height: 80.h,
          ),
           Text(
            "اهلا بك!",
            style: TextStyle(
              fontFamily: "Tajawal",
              fontWeight: FontWeight.w700,
              fontSize: 32.sp,
            ),
          ),
           SizedBox(height: 25.h),
           Container(
           alignment: Alignment.center,
           height: 48.h,
           width: 270.w,
            child:  Text(
              textAlign: TextAlign.center,
              "من فضلك ادخل الكود الخاص بك للتاكيد علي تغيير كلمة المرور",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "Tajawal",
                fontSize: 20.sp,
              ),
            ),
          ),
          PinPutWidget()
        ]),
      ),
    );
  }
}
