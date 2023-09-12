
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/screens/user_screens/home/cubit/cubit.dart';
import 'package:snay3y/widgets/booking.dart';
import 'package:snay3y/widgets/home.dart';

import 'cubit/states.dart';

class UserHomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) => UserHomeCubit(initialState()),
      child: BlocConsumer<UserHomeCubit,UserHomeStates>(
        builder:(context, state) {
          return
            Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(150),
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  height: 100.h,

                  child:AppBar(
                    backgroundColor: Colors.transparent,elevation: 0,
                    title: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Image.asset("assets/images/Rectangle.png"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("Mohamed Soubhi",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w500)),
                            ),
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.location_on_outlined,color: Color(0xffC6C7D5)),
                              ),
                              Text("Egypt / Cairo",style: TextStyle(color: Color(0xffC6C7D5),fontSize: 16.sp,fontWeight: FontWeight.w500),)
                            ],)
                          ],),

                      ],),
                    actions: [Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.notifications,color: Colors.black,
                      ),
                    )],
                  ),
                ),
              ),
              bottomNavigationBar:BlocProvider.of<UserHomeCubit>(context).getBottomNavigationBar() ,
body:BlocProvider.of<UserHomeCubit>(context). pages.elementAt(BlocProvider.of<UserHomeCubit>(context).selectedIndex));

        }, listener: (BuildContext context, UserHomeStates state) {
          if (state is HomeItemState){
            HomeItem();
          }
          else if (state is BookingItemState){
             BookingItem();
          }
      },

    )
    );}

}