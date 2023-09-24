import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/models/shopping_tool_model.dart';

class ShoppingToolItem extends StatelessWidget {
  final ShoppingToolModel shoppingTool;

  const ShoppingToolItem({super.key, required this.shoppingTool});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: 90,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(3),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff91C8E4),
                  ),
                ),
                child: Image.asset(shoppingTool.imagePath),
              ),
            ),
          ),
          Text(
            shoppingTool.toolName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          )
        ],
      ),
    );
  }
}
