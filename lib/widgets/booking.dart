import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snay3y/components/components.dart';

class BookingItem extends StatefulWidget {

  const BookingItem({super.key});

  @override
  State<BookingItem> createState() => _BookingItemState();
}

class _BookingItemState extends State<BookingItem> {
  /// List of Tab Bar Item
  List<String> items = [
    "Completed",
    "Pending",
    "Canceled",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// CUSTOM TABBAR
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 7,
                    spreadRadius: 0.5,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                  const SizedBox(width: 50),
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(
                                  () {
                                currentIndex = index;
                              },
                            );
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.all(5),
                            width: 80,
                            height: 45,
                            decoration: BoxDecoration(
                              color: currentIndex == index
                                  ? Colors.white70
                                  : Colors.white54,
                              border: currentIndex == index
                                  ? const Border(
                                bottom: BorderSide(
                                  color: Color(0xFF88C3EA),
                                  width: 3,
                                ),
                              )
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                items[index],
                                style: GoogleFonts.laila(
                                  fontWeight: FontWeight.w500,
                                  color: currentIndex == index
                                      ? const Color(0xFF88C3EA)
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          /// MAIN BODY
          if (currentIndex == 0)
            Expanded(
              child: bookingCompletedCard(),
            ),
          if (currentIndex == 1)
            Expanded(
              child: bookingPendingCard(),
            ),
          if (currentIndex == 2)
            Expanded(
              child: bookingCanceledCard(),
            ),
        ],
      ),
    );
  }
}


bookingCompletedCard() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 7,
                    spreadRadius: 0.5,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage('assets/images/Photo_by_Shawn.png'),
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mohamed Ahmed",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage('assets/images/tools 2.png'),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('A fan is installed'),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image(
                                  image: AssetImage('assets/images/star.png')),
                              SizedBox(
                                width: 5,
                              ),
                              Image(
                                  image: AssetImage('assets/images/star.png')),
                              SizedBox(
                                width: 5,
                              ),
                              Image(
                                  image: AssetImage('assets/images/star.png')),
                              SizedBox(
                                width: 5,
                              ),
                              Image(
                                  image: AssetImage('assets/images/star.png')),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFA7D5F4)),
                            height: 40,
                            width: 40,
                            child: const Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 30,
            ),
            itemCount: 5,
          ),
        ),
      ],
    ),
  );
}

bookingPendingCard() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 7,
                    spreadRadius: 0.5,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Image(
                        image: AssetImage('assets/images/Photo_by_mr_lee.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mohamed Ahmed",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage('assets/images/tools 2.png'),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'He wants to repair a washing machine',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/calendar-days 1.png'),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Tue 29/8/2023'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDF3333),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Decline'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFA7D5F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Accept'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 30,
            ),
            itemCount: 3,
          ),
        ),
      ],
    ),
  );
}

bookingCanceledCard() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 7,
                    spreadRadius: 0.5,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage('assets/images/Photo_by_mr_lee.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mohamed Ahmed",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage('assets/images/tools 2.png'),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'He wants to repair a washing machine',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/calendar-days 1.png'),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Tue 29/8/2023'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'The request was rejected',
                    style: TextStyle(
                      color: Color(0xFFDF3333),
                    ),
                  )
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 30,
            ),
            itemCount: 3,
          ),
        ),
      ],
    ),
  );
}