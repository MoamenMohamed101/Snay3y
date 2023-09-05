import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/core/route/routes.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text('قم بتحديد صفحة انشاء الحساب'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
             SizedBox(
              height: 50.sp,
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(Routes.loginPageRouteUser);
              },
              child: Container(
                width: double.infinity,
                height: 140.h,
                color: Colors.blue,
                child:  Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Text(
                        'هل انت مستخدم؟',
                        style: TextStyle(color: Colors.white, fontSize: 35.sp),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Image(
                        image: AssetImage('assets/images/Success.png'),
                      )
                    ],
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 50.h,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.loginPageRoute);
              },
              child: Container(
                width: double.infinity,
                height: 140.h,
                color: Colors.blue,
                child:  Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Text(
                        'هل انت صنايعي؟',
                        style: TextStyle(color: Colors.white, fontSize: 35.sp),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Image(
                        image: AssetImage('assets/images/Success.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
