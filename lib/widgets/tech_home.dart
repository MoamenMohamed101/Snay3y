import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/components.dart';

class TechHomeItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              leading: Icon(Icons.search),
              shape:MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
              hintText: "Search",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: ListTitle("Technicians nearby"),
            ),
            defaultListView(itemCount: , listItem: )
          ],
        ),
      );
  }

}

Widget ListTitle (String text){
  return
    Text(text,style: TextStyle(fontWeight:FontWeight.w700 ,fontSize: 16.sp),);

}