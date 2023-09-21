import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.search,
                color: Color(0xff88C3EA),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.0),
                borderSide:
                    const BorderSide(color: Color(0xff88C3EA), width: 1),
              ),
              label: SearchBar(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                hintText: "Search",
                hintStyle: MaterialStateProperty.all(
                  TextStyle(
                      color: const Color(0xffC6C7D5),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xffC6C7D5),
            ),
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        Padding(
          padding: const EdgeInsets.all(19.0),
          child: Text(
            "Welcome to our app",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xff322653)),
          ),
        ),
        Stack(
          children: [
            Image.asset("name"),
          ],
        )
      ],
    );
  }
}
