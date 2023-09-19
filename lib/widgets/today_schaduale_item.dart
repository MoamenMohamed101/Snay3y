import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/models/today_schedule_model.dart';

class TodatSchadualItem extends StatelessWidget{
  final TodayScadualeModel todayScaduale;
  TodatSchadualItem({required this.todayScaduale});
  @override
  Widget build(BuildContext context) {
    return Container(
      height:90.h ,
      width: 106.w,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: [
      Image.asset(todayScaduale.image),

      Text(todayScaduale.title,style: TextStyle( fontSize: 14.sp,fontWeight: FontWeight.w500)),
      Text(todayScaduale.time,style: TextStyle( fontSize: 12.sp,fontWeight: FontWeight.w400))
        ],
      ),
    );
  }

}