//=========================================  done  =========================================

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:security/screens/home.dart';
import 'package:security/screens/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
//      duration time

        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
//             ===================================== the  stack of the photo and logo
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Colors.blue,
                    image: DecorationImage(
                        image: AssetImage('assets/splash.png'),
                        fit: BoxFit.fill)),
              ),
//              ============================================================================================================ logo class
              CustomLogo()
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Padding(
        padding: EdgeInsets.only(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
