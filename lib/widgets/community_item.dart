import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/models/community_model.dart';

class CommunityItem extends StatelessWidget{
  CommunityModel community;
  CommunityItem({required this.community});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(

mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(community.image),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 200.w,
                      child: Text(community.comment,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400),)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(community.name,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700),textAlign: TextAlign.start,),
                  )
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}