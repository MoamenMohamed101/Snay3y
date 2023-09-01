import 'package:flutter/material.dart';
import 'package:snay3y/core/route/routes.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text('قم بتحديد صفحة انشاء الحساب'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(Routes.loginPageRouteUser);
              },
              child: Container(
                width: double.infinity,
                height: 140,
                color: Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Text(
                        'هل انت مستخدم؟',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image(
                        image: AssetImage('assets/images/Success.png'),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.loginPageRoute);
              },
              child: Container(
                width: double.infinity,
                height: 140,
                color: Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Text(
                        'هل انت صنايعي؟',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image(
                        image: AssetImage('assets/images/Success.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
