import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/core/route/routes.dart';
import 'package:snay3y/generated/l10n.dart';
import 'package:snay3y/helpers/cash_helper.dart';

class OnBoardingScreen extends StatelessWidget {


  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: 67.w,
            height: 67.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF0E709F),
                width: 3.w,
              ),
            ),
          ),
          FloatingActionButton(
            elevation: 0.0,
            onPressed: () {
              CachHelper.saveData(key: 'onBoarding', value: true);
              Navigator.of(context).pushNamed(Routes.mainPage);
            },
            backgroundColor: const Color(0xFF91C8E4),

            child:  Icon(
              Icons.chevron_right_sharp,
              size: 40.sp,
              color:const Color(0xFF322653),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).onBoardingTitle,
            style:  TextStyle(
              fontSize: 28.sp,
              color: const Color(0xFF322653),
              fontWeight: FontWeight.w700,
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style:  TextStyle(
                color: const Color(0xFFC6C7D5),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1.5.h,
              ),
              children: [
                TextSpan(
                  text: S.of(context).onBoardingDescription1,
                ),
                TextSpan(
                  text: S.of(context).onBoardingDescription2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
