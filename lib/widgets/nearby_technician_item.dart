import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/tech_nearby_model.dart';

class NearbyechItem extends StatelessWidget{
  final TechNearbyModel techNearby;
  const NearbyechItem({super.key, required this.techNearby});
  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 85,
        child: Column(
          children: [
            ClipRRect(borderRadius: BorderRadius.all(Radius.circular(3),),child: Container(

                child: Image.asset(techNearby.image))),
            Text(techNearby.title,textAlign: TextAlign.center,
              style: TextStyle(fontWeight:FontWeight.w400 ,fontSize: 16.sp,),)
          ],
        ),
      );

  }

}