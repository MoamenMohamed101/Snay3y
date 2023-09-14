
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/models/category_item_model.dart';

class CategotyItem extends StatelessWidget {
final CategoryItemModel category;

  const CategotyItem({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      height:85 ,
      width: 90,
      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(3),),child: Container(
                decoration: BoxDecoration(border: Border.all(color: Color(0xff91C8E4))),
                child: Image.asset(category.imagePath))),
          ),
          Text(category.title,textAlign: TextAlign.center,style: TextStyle(fontWeight:FontWeight.w400 ,fontSize: 16.sp,),)
        ],
      ),
    );
  }

}