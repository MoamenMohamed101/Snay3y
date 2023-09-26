import 'package:flutter/material.dart';
import '../models/category_item_model.dart';
class CategoryListViewItem extends StatelessWidget {
  final CategoryItemModel categoryItemModel;
  const CategoryListViewItem({Key? key, required this.categoryItemModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*.8,
        child: Container(
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
              color: const Color(0xff91C8E4),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(fit: BoxFit.fill,categoryItemModel.imagePath)),
              const SizedBox(width: 54,),
              Text(categoryItemModel.title),
              const Spacer(),
              const Icon(Icons.arrow_forward)
            ],
          ),
        ),
      ),
    );
  }
}
