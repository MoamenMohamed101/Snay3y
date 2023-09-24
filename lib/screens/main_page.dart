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
        title: const Text('User types'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50.sp,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.loginPageRouteUser);
                },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 188,
                  width: 201,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                    color: const Color(0xFFA7D5F4),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/man 1.png'),
                    ),
                  ),
                  child: const Text(
                    'Client',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
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
                  alignment: Alignment.bottomCenter,
                  height: 188,
                  width: 201,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                    color: const Color(0xFFA7D5F4),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/engineer 1.png'),
                    ),
                  ),
                  child: const Text(
                    'Technicain',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
