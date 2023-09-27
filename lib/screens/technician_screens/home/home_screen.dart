import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snay3y/screens/technician_screens/home/cubit/states.dart';
import 'package:snay3y/widgets/tech_booking.dart';

import '../../../widgets/booking.dart';
import '../../../widgets/home_page_app_bar (tech-user).dart';
import '../../../widgets/tech_home.dart';
import 'cubit/cubit.dart';

class TechHomeScreen extends StatelessWidget {
  const TechHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TechHomeCubit(InitialState()),
      child: BlocConsumer<TechHomeCubit, TechHomeStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: HomePageAppBar.getAppBar(false),
            bottomNavigationBar: BlocProvider.of<TechHomeCubit>(context)
                .getBottomNavigationBar(),
            body: BlocProvider.of<TechHomeCubit>(context).pages.elementAt(
                BlocProvider.of<TechHomeCubit>(context).selectedIndex),
          );
        },
        listener: (BuildContext context, TechHomeStates state) {
          if (state is HomeItemState) {
            TechHomeItem();
          } else if (state is BookingItemState) {
            TechBookingItem();

          }
        },
      ),
    );
  }
}
