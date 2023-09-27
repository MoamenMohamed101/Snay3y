import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snay3y/models/client_feedback_model.dart';
import 'package:snay3y/widgets/community_item.dart';
import 'package:snay3y/widgets/nearby_technician_item.dart';
import 'package:snay3y/widgets/today_schaduale_item.dart';
import '../models/community_model.dart';
import '../models/tech_nearby_model.dart';
import '../models/today_schedule_model.dart';
import 'client_feed_back_item.dart';
class TechHomeItem extends StatelessWidget {
  final List<TechNearbyModel> techNearby = [
    TechNearbyModel(
        image: "assets/images/Rectangle (1).png", title: "carpenter"),
    TechNearbyModel(image: "assets/images/Rectangle (2).png", title: "plumber"),
    TechNearbyModel(
        image: "assets/images/Rectangle (1).png", title: "carpenter"),
    TechNearbyModel(
        image: "assets/images/Rectangle (2).png", title: "electrician"),
  ];
  final List<TodayScadualeModel> todayScaduale = [
    TodayScadualeModel(
        image: "assets/images/Photo by mr lee.png",
        title: "Fridge repair",
        time: "Today 9.30 P.M"),
    TodayScadualeModel(
        image: "assets/images/Photo by mr lee.png",
        title: "Fridge repair",
        time: "Today 9.30 P.M"),
    TodayScadualeModel(
        image: "assets/images/Photo by mr lee.png",
        title: "Fridge repair",
        time: "Today 9.30 P.M"),
    TodayScadualeModel(
        image: "assets/images/Photo by mr lee.png",
        title: "Fridge repair",
        time: "Today 9.30 P.M"),
  ];
  final List<ClientFeedBackModel> clientFeedBack = [
    ClientFeedBackModel(
        image: "assets/images/Photo by Shawn _.png",
        clientName: "Mohamed",
        feedBack:
            "The service was done perfectly and the technician was wonderful"),
    ClientFeedBackModel(
        image: "assets/images/Photo by Shawn _.png",
        clientName: "Mohamed",
        feedBack:
            "The service was done perfectly and the technician was wonderful"),
    ClientFeedBackModel(
        image: "assets/images/Photo by Shawn _.png",
        clientName: "Mohamed",
        feedBack:
            "The service was done perfectly and the technician was wonderful"),
    ClientFeedBackModel(
        image: "assets/images/Photo by Shawn _.png",
        clientName: "Mohamed",
        feedBack:
            "The service was done perfectly and the technician was wonderful"),
  ];
  final List<CommunityModel> community = [
    CommunityModel(
        image: "assets/images/Photo by Shawn _.png",
        comment: "I want to share with you my opinion"
            " about the technician, Muhammad."
            " He is a wonderful and very skilled"
            " person, and he is also very polite."
            " Thank you very much",
        name: "Mohamed Ahmed"),
    CommunityModel(
        image: "assets/images/Photo by Shawn _.png",
        comment: "I want to share with you my opinion"
            " about the technician, Muhammad."
            " He is a wonderful and very skilled"
            " person, and he is also very polite."
            " Thank you very much",
        name: "Mohamed Ahmed"),
    CommunityModel(
        image: "assets/images/Photo by Shawn _.png",
        comment: "I want to share with you my opinion"
            " about the technician, Muhammad."
            " He is a wonderful and very skilled"
            " person, and he is also very polite."
            " Thank you very much",
        name: "Mohamed Ahmed")
  ];

  TechHomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              leading: const Icon(Icons.search),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              hintText: "Search",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: listTitle("Technicians nearby"),
            ),
            SizedBox(
              height: 90.h,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: techNearby.length,
                itemBuilder: (context, index) =>
                    NearbyechItem(techNearby: techNearby[index]),
              ),
            ),
            listTitle("Today's schedule"),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 90.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 15.w),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: todayScaduale.length,
                itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(
                                2, 8), // changes position of shadow
                          ),
                        ],
                        color: Colors.white),
                    child:
                        TodatSchadualItem(todayScaduale: todayScaduale[index])),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            listTitle("Clients’ Feedback"),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 130.h,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 40,
                    crossAxisSpacing: 40),
                itemCount: 4,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(
                                2, 8), // changes position of shadow
                          ),
                        ],
                        color: Colors.white),
                    child: ClientFeedBackItem(
                      clientFeedBack: clientFeedBack[index],
                    )),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            listTitle("Community"),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 153.h,
              width: 334.w,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: community.length,
                itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(
                                2, 8), // changes position of shadow
                          ),
                        ],
                        color: Colors.white),
                    child: CommunityItem(
                      community: community[index],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget listTitle(String text) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
  );
}
