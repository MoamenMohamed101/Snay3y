import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/models/client_feedback_model.dart';

class ClientfeedBackItem extends StatelessWidget {
  final ClientFeedBackModel clientfeedBack;

  const ClientfeedBackItem({super.key, required this.clientfeedBack});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(clientfeedBack.image, alignment: Alignment.topCenter),
              Text(
                clientfeedBack.clientnName,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
              ),
              Text(
                clientfeedBack.feedBack,
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ],
    );
  }
}
