import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: TextField(decoration: InputDecoration(suffixIcon: Icon(Icons.search,color:Color(0xff88C3EA)),border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),borderSide: BorderSide(color: Color(0xff88C3EA),width: 1)),label: SearchBar(
          elevation: MaterialStateProperty.all(0),backgroundColor: MaterialStateProperty.all(Colors.transparent)
          ,hintText: "Search",
          hintStyle: MaterialStateProperty.all(TextStyle(color: Color(0xffC6C7D5),fontSize: 16.sp,fontWeight: FontWeight.w500)), )),
          style: TextStyle(fontSize:16.sp,fontWeight: FontWeight.w500 ,color: Color(0xffC6C7D5)),
        ),
      ),
      SizedBox(height: 25.h,),
      Padding(
        padding: const EdgeInsets.all(19.0),
        child: Text("Welcome to our app",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,color: Color(0xff322653)),),
      ),
      Stack(children: [
        Container(
          child: Image.asset("name"),
        )
      ],)
    ],);
  }
}