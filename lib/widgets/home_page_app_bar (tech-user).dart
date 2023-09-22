import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageAppBar {

     static getAppBar(bool isUser){
       Color? background ;
       String? title;
       Widget? subTitle;
       Widget? wave ;
       Widget? flag;

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
       background==Color(0xff91c8e5);
       title="Hey,Mohamed ";
       wave=Image.asset("assets/images/Vector.png");
       flag=Image.asset("assets/images/united-arab-emirates 1.png");
       subTitle=Text("welcome back",style: TextStyle( fontSize: 13.sp,color: Colors.black),textAlign: TextAlign.start,);
     }
      return
        PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 100.h,
            child: AppBar(

   backgroundColor:background

   ,elevation: 0,
              title: Padding(
                padding: const EdgeInsets.only(top:0),
                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Container(
                          height: 54.h,
                          width: 54.h,
                          child: Image.asset("assets/images/Rectangle.png",fit: BoxFit.fill,)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(title,style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w500)),
                          wave?? Container()
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: subTitle,
                        ),
                      ],),

                  ],),
              ),
              actions: [Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.notifications,color: Colors.black,
                ),
              )
              ,
              flag??Container()
              ],
            ),
          ),
        );
    }
  }

