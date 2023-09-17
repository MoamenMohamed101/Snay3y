import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snay3y/screens/technician_screens/home/cubit/states.dart';

import '../../../../widgets/tech_booking.dart';
import '../../../../widgets/tech_home.dart';

class UserHomeCubit extends Cubit<TechHomeStates>{
  int selectedIndex=0;
  UserHomeCubit(super.initialState);
  List <Widget> pages=[
    TechHomeItem(),
    TechBookingItem()
  ];
  Widget getBottomNavigationBar(){
    return
      BottomAppBar(surfaceTintColor: Colors.black,
        child: Container(
          padding: EdgeInsets.only(top: 20),
          // decoration: BoxDecoration(border: Border.all(color: Color(0xff4682A9))),
          child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home" ,),
                BottomNavigationBarItem(icon:
                Icon(Icons.event_note_rounded,),label: "Booking" ),
                BottomNavigationBarItem(icon:Icon(Icons.shopping_cart_outlined,),label: "Chat" ),
                BottomNavigationBarItem(icon:Icon(Icons.person,),label: "Community" ),
                BottomNavigationBarItem(icon:Icon(Icons.person,),label: "Profile" ),

              ],
              onTap: (index){
                selectedIndex=index;
                emit(BottomNavigationBarState());

              },
              currentIndex: selectedIndex,
              unselectedItemColor: Colors.black,
              selectedItemColor: Color(0xff4682A9)),
        ),
      )
    // ,body: pages.elementAt(selectedIndex))
        ;
  }
  selectedWidget(Widget page) {
    if (selectedIndex==0){
      emit (HomeItemState());
    }
    else if (selectedIndex==1){
      emit(BookingItemState());
    }
  }
}