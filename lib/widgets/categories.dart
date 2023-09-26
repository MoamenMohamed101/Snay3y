import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/category_item_model.dart';
import 'category_listview_item.dart';
class CategoriesScreen extends StatelessWidget{
  final List <CategoryItemModel> categories =[
    CategoryItemModel(imagePath:"assets/images/image 6.png", title:"Cleaning Services",),
    CategoryItemModel(imagePath:"assets/images/image 4.png" ,title: 'Repairing'),
    CategoryItemModel(imagePath:"assets/images/image 8.png" ,title: 'Carpenter'),
    CategoryItemModel(imagePath:"assets/images/image 9.png" ,title: 'Paint Worker')
  ];
   CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories",style: TextStyle(color: Colors.black)),
           backgroundColor: Colors.transparent,
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: const Icon(Icons.arrow_back,color: Colors.black,)) ,
     elevation: 0,
      toolbarHeight: 100.h,
      ),
      body: ListView.separated(itemBuilder: (context, index) => CategoryListViewItem(categoryItemModel: categories[index],),
          separatorBuilder: (context, index) => const SizedBox(height: 24),
          itemCount: categories.length),
      );
  }
}


