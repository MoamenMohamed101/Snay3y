import 'package:flutter/material.dart';
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
          const SizedBox(
            height: 80,
          ),
          const Text(
            "اهلا بك!",
            style: TextStyle(
              fontFamily: "Tajawal",
              fontWeight: FontWeight.w700,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 25),
          Container(
            alignment: Alignment.center,
            // height: 48,
            // width: 270,
            child: const Text(
              textAlign: TextAlign.center,
              "من فضلك ادخل الكود الخاص بك للتاكيد علي تغيير كلمة المرور",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "Tajawal",
                fontSize: 20,
              ),
            ),
          ),
          PinPutWidget()
        ]),
      ),
    );
  }
}
