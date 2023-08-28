import 'package:flutter/material.dart';

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
            width: 67,
            height: 67,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF0E709F),
                width: 3,
              ),
            ),
          ),
          FloatingActionButton(
            elevation: 0.0,
            onPressed: () {},
            backgroundColor: const Color(0xFF91C8E4), // background: #;

            child: const Icon(
              Icons.chevron_right_sharp,
              size: 40,
              color: Color(0xFF322653),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'زيادة دخلك',
            style: TextStyle(
                fontSize: 28,
                color: Color(0xFF322653),
                fontWeight: FontWeight.w700),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                  color: Color(0xFFC6C7D5),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              children: [
                TextSpan(
                    text:
                        'اياً كانت صنعتك، قم بإنشاء حسابك الان وأنشر صور لعملك ،'),
                TextSpan(
                  text: 'واستقبل الحجوزات من العملاء للزيادة من دخلك',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
