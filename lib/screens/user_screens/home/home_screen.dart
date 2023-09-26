import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snay3y/screens/user_screens/home/cubit/cubit.dart';
import 'package:snay3y/widgets/booking.dart';
import 'package:snay3y/widgets/home.dart';
import '../../../widgets/home_page_app_bar (tech-user).dart';
import '../../../widgets/tech_booking.dart';
import 'cubit/states.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeCubit(),
      child: BlocConsumer<UserHomeCubit, UserHomeStates>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xff4682A9)),
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(
                Icons.add,
                color: Color(0xff4682A9),
                size: 28,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            appBar: HomePageAppBar.getAppBar(true),
            bottomNavigationBar: BlocProvider.of<UserHomeCubit>(context)
                .getBottomNavigationBar(),
            body: BlocProvider.of<UserHomeCubit>(context).pages.elementAt(
                  BlocProvider.of<UserHomeCubit>(context).selectedIndex,
                ),
          );
        },
        listener: (BuildContext context, UserHomeStates state) {
          if (state is HomeItemState) {
            HomeItem();
          } else if (state is BookingItemState) {
            TechBookingItem();
          }
        },
      ),
    );
  }
}
