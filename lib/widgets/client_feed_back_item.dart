import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/models/client_feedback_model.dart';

class ClientFeedBackItem extends StatelessWidget {
  final ClientFeedBackModel clientFeedBack;

  const ClientFeedBackItem({super.key, required this.clientFeedBack});

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
              Image.asset(clientFeedBack.image, alignment: Alignment.topCenter),
              Text(
                clientFeedBack.clientName,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
              ),
              Text(
                clientFeedBack.feedBack,
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ],
    );
  }
}
