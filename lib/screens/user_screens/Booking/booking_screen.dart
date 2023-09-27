import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snay3y/screens/user_screens/Booking/cubit/cubit.dart';
import 'package:snay3y/screens/user_screens/Booking/cubit/states.dart';

class Booking extends StatelessWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => BookingCubit(),
          child: BlocConsumer<BookingCubit, BookingStates>(
            builder: (context, index) {
              return SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 20,
                                    top: MediaQuery.of(context).size.height /
                                        30),
                                child: const Text(
                                  'Available',
                                  style: TextStyle(
                                      color: Color(0xff322653), fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 20,
                                    top: MediaQuery.of(context).size.height /
                                        60),
                                child: const Text(
                                  'Technician',
                                  style: TextStyle(
                                      color: Color(0xff322653),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 19,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff88C3EA),
                              ),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  'Search',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xffC6C7D5),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    CupertinoIcons.search,
                                    color: Color(0xff88C3EA),
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Expanded(
                        child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 30,
                                    right:
                                        MediaQuery.of(context).size.width / 30),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            2.7,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      image: const DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/snay3y2.png'),
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              150,
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        BookingCubit.get(
                                                                context)
                                                            .ToggleHeart();
                                                      },
                                                      icon: Icon(
                                                        BookingCubit.get(
                                                                context)
                                                            .Heart,
                                                        color: const Color
                                                            .fromRGBO(
                                                            70, 130, 169, 1),
                                                        size: 33,
                                                      ),
                                                    ),
                                                    //
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Stack(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    children: [
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            7,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      145,
                                                                      200,
                                                                      228,
                                                                      0.86),
                                                              offset: Offset(
                                                                  1.0, 1.0),
                                                              spreadRadius: 0.5,
                                                            )
                                                          ],
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  left: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      60,
                                                                  top: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      60),
                                                              child: Text(
                                                                'MOHAMED HASSAN ',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      22,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  120,
                                                            ),
                                                            Center(
                                                              child: Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: MediaQuery.of(context).size.width /
                                                                            16),
                                                                    child:
                                                                        Center(
                                                                      child: Image.asset(
                                                                          'assets/images/repair.png',
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 16),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          60,
                                                                      top: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          60,
                                                                    ),
                                                                    child: Text(
                                                                      'Carpenters',
                                                                      style: TextStyle(
                                                                          fontSize: MediaQuery.of(context).size.width /
                                                                              18,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  120,
                                                            ),
                                                            Center(
                                                              child: RatingBar
                                                                  .builder(
                                                                      minRating:
                                                                          1,
                                                                      itemSize:
                                                                          29,
                                                                      itemBuilder:
                                                                          (context, _) =>
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Colors.amber.shade200,
                                                                              ),
                                                                      onRatingUpdate:
                                                                          (rating) {
                                                                        BookingCubit.get(context)
                                                                            .updateRating(rating);
                                                                      }),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            13,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .lightBlue
                                                                .shade50,
                                                            borderRadius: const BorderRadius
                                                                .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        3),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        3))),
                                                      ),
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            19,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xff4682A9),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: const Center(
                                                            child: Text(
                                                          'Booking Now',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18),
                                                        )),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            2.7,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      image: const DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/worker.png'),
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              150,
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        BookingCubit.get(
                                                                context)
                                                            .ToggleHeart();
                                                      },
                                                      icon: Icon(
                                                        BookingCubit.get(
                                                                context)
                                                            .Heart,
                                                        color: const Color
                                                            .fromRGBO(
                                                            70, 130, 169, 1),
                                                        size: 33,
                                                      ),
                                                    ),
                                                    //
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Stack(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    children: [
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            7,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      145,
                                                                      200,
                                                                      228,
                                                                      0.86),
                                                              offset: Offset(
                                                                  1.0, 1.0),
                                                              spreadRadius: 0.5,
                                                            )
                                                          ],
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  left: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      60,
                                                                  top: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      60),
                                                              child: Text(
                                                                'MOHAMED HASSAN ',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      22,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  120,
                                                            ),
                                                            Center(
                                                              child: Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: MediaQuery.of(context).size.width /
                                                                            16),
                                                                    child:
                                                                        Center(
                                                                      child: Image.asset(
                                                                          'assets/images/repair.png',
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 16),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          60,
                                                                      top: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          60,
                                                                    ),
                                                                    child: Text(
                                                                      'Carpenters',
                                                                      style: TextStyle(
                                                                          fontSize: MediaQuery.of(context).size.width /
                                                                              18,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  120,
                                                            ),
                                                            Center(
                                                              child: RatingBar
                                                                  .builder(
                                                                      minRating:
                                                                          1,
                                                                      itemSize:
                                                                          29,
                                                                      itemBuilder:
                                                                          (context, _) =>
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Colors.amber.shade200,
                                                                              ),
                                                                      onRatingUpdate:
                                                                          (rating) {
                                                                        BookingCubit.get(context)
                                                                            .updateRating(rating);
                                                                      }),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            13,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .lightBlue
                                                                .shade50,
                                                            borderRadius: const BorderRadius
                                                                .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        3),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        3))),
                                                      ),
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            19,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xff4682A9),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: const Center(
                                                            child: Text(
                                                          'Booking Now',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18),
                                                        )),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 5,
                              );
                            },
                            itemCount: 4),
                      ),
                    ],
                  ),
                ),
              );
            },
            listener: (context, index) {},
          ),
        ),
      ),
    );
  }
}
