import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/models/best_worker_model.dart';

class BestWorkerItem extends StatelessWidget{
  final BestWorkerModel bestWorker ;

  const BestWorkerItem({super.key, required this.bestWorker});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height:85 ,
        width: 90,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(3),),child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Color(0xff91C8E4))),
                  child: Image.asset(bestWorker.imagePath))),
            ),
            Text(bestWorker.worker,textAlign: TextAlign.center,style: TextStyle(fontWeight:FontWeight.w400 ,fontSize: 16.sp,),)
          ],
        ),
      );

  }
}