import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: TextField(decoration: InputDecoration(label: SearchBar(backgroundColor: [MaterialStatePropertyAll<Color>(value)
        ], ,)),
          style: TextStyle(fontSize:16.sp,fontWeight: FontWeight.w500 ,color: Color(0xffC6C7D5)),
        ),
      )
    ],);
  }
}