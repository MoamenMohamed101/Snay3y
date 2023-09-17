import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageAppBar {
 Color? background ;

     static getAppBar(bool isUser){
       Color? background ;
       String? title;
       Widget? subTitle;

       if (isUser){
       background==Colors.transparent;
       title="Mohamed Soubhi";
       subTitle=Row(children: [
         Padding(
           padding: const EdgeInsets.all(0.0),
           child: Icon(Icons.location_on_outlined,color: Color(0xffC6C7D5)),
         ),
         Text("Egypt / Cairo",style: TextStyle(color: Color(0xffC6C7D5),fontSize: 16.sp,fontWeight: FontWeight.w500),)
       ],);

       }
     else {
       background==Color(0xffA7D5F4);
       title="Hey,Mohamed ";
       subTitle=Text("welcome back",style: TextStyle( fontSize: 13.sp,color: Colors.black),textAlign: TextAlign.start,);
     }
      return
        PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 120.h,
            child: AppBar(

   backgroundColor:background





   ,elevation: 0,
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.asset("assets/images/Rectangle.png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(title,style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w500)),
                      ),
                      
                      
                      subTitle,
                    ],),

                ],),
              actions: [Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.notifications,color: Colors.black,
                ),
              )],
            ),
          ),
        );

    }
  }

