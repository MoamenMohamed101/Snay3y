import 'package:flutter/material.dart';

import '../../../widgets/home_page_app_bar (tech-user).dart';

class TechHomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar.getAppBar(false),
    );
  }

}