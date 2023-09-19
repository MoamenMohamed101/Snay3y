import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/screens/technician_screens/home/cubit/cubit.dart';
import 'package:snay3y/widgets/nearby_technician_item.dart';
import 'package:snay3y/widgets/today_schaduale_item.dart';

import '../components/components.dart';
import '../models/tech_nearby_model.dart';
import '../models/today_schedule_model.dart';

class TechHomeItem extends StatelessWidget{
  List<TechNearbyModel> techNearby = [
    TechNearbyModel(
        image: "assets/images/Rectangle (1).png", title: "carpenter"),
    TechNearbyModel(image: "assets/images/Rectangle (2).png", title: "plumber"),
    TechNearbyModel(
        image: "assets/images/Rectangle (1).png", title: "carpenter"),
    TechNearbyModel(
        image: "assets/images/Rectangle (2).png", title: "electrician"),
  ];
List<TodayScadualeModel> todayScaduale=[
  TodayScadualeModel(image: "assets/images/Photo by mr lee.png",title:"Fridge repair" ,time:"Today 9.30 P.M" ),
  TodayScadualeModel(image: "assets/images/Photo by mr lee.png",title:"Fridge repair" ,time:"Today 9.30 P.M" ),
  TodayScadualeModel(image: "assets/images/Photo by mr lee.png",title:"Fridge repair" ,time:"Today 9.30 P.M" ),
  TodayScadualeModel(image: "assets/images/Photo by mr lee.png",title:"Fridge repair" ,time:"Today 9.30 P.M" ),

];
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
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: ListTitle("Technicians nearby"),
            ),
            SizedBox(
              height: 90.h,
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: techNearby.length,
                itemBuilder: (context, index) =>NearbyechItem(techNearby:techNearby[index] ) ,
              ),
            ),
            ListTitle("Today's schedule"),
            SizedBox(height: 20.h,),
            SizedBox(
              height:90.h ,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 15.w),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: todayScaduale.length,
                itemBuilder: (context, index) =>Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(2, 8), // changes position of shadow
                      ),
                    ],
                    color: Colors.white
                  ),
                    child: TodatSchadualItem(todayScaduale: todayScaduale[index])) ,
              ),
            ),
            SizedBox(height: 20.h,),

            ListTitle("Clients’ Feedback")



          ],
        ),
      );
  }

}

Widget ListTitle (String text){
  return
    Text(text,style: TextStyle(fontWeight:FontWeight.w700 ,fontSize: 16.sp),);
}



