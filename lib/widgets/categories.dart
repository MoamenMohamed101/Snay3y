import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories",style: TextStyle(color: Colors.black)),
           backgroundColor: Colors.transparent,
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back,color: Colors.black,)) ,
     elevation: 0,
      toolbarHeight: 100.h,

      ),
      );

  }

}