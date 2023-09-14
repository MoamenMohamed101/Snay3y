import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/widgets/categoryItem.dart';

import '../models/category_item_model.dart';
class HomeItem extends StatelessWidget{
 final List <CategoryItemModel> categories =[
 CategoryItemModel(imagePath:    "assets/images/image 6.png", title:"Cleaning Services",),
   CategoryItemModel(imagePath:"assets/images/image 4.png" ,title: 'Repairing'),
   CategoryItemModel(imagePath:"assets/images/image 8.png" ,title: 'Carpenter'),
   CategoryItemModel(imagePath:"assets/images/image 9.png" ,title: 'Paint Worker')

 ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7,right: 7),
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: [
        Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: TextField(decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color(0xff88C3EA),width: 1,)),
              suffixIcon: Icon(Icons.search,color:Color(0xff88C3EA)),
              border:OutlineInputBorder(borderRadius: BorderRadius.circular(13.0,),),label: SearchBar(
            elevation: MaterialStateProperty.all(0),backgroundColor: MaterialStateProperty.all(Colors.transparent)
            ,hintText: "Search",
            hintStyle: MaterialStateProperty.all(TextStyle(color: Color(0xffC6C7D5),fontSize: 16.sp,fontWeight: FontWeight.w500)), )),
            style: TextStyle(fontSize:16.sp,fontWeight: FontWeight.w500 ,color: Color(0xffC6C7D5)),

          ),
        ),
        SizedBox(height: 20.h,),
        // Padding(
          // padding: const EdgeInsets.all(19.0),
          // child:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Welcome to our app",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,color: Color(0xff322653)),),
      ),
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
          children: [
            Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25))),
                clipBehavior: Clip.antiAliasWithSaveLayer,child: Image.asset("assets/images/image 2.png")),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("30",style: TextStyle(fontSize:36.sp ,fontWeight:FontWeight.w500 ,color:Colors.white )),
                      Stack(alignment: Alignment.center,
                          children: [ Image.asset("assets/images/Restart (1).png"),
                        Text("%",style: TextStyle(fontSize:20.sp ,fontWeight:FontWeight.w500 ,color:Colors.white )),

                      ]),
                      Text("FF",style: TextStyle(fontSize:36.sp ,fontWeight:FontWeight.w500 ,color:Colors.white )),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("On First Cleaning Services",style: TextStyle(color: Colors.white,fontWeight:FontWeight.w500 ,fontSize:16.sp ),),
                  ),
                  SizedBox(height: 16,),
                  ElevatedButton(onPressed: (){},style:ButtonStyle
                    (backgroundColor: MaterialStateProperty.all(Colors.white)),
                      child: Text("Book Now",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Colors.black),)),
                ],
              ),
            )

          ],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Categories",style: TextStyle(fontWeight:FontWeight.w600 ,fontSize: 20.sp),),
              Spacer(),
              Text("See All",style: TextStyle(fontSize:16.sp ,fontWeight:FontWeight.w500,color: Colors.grey ),)
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context,index)=> CategotyItem(category:categories[index]),

              ),
            ),
          ),
        )
      ],),
    );
  }
}
