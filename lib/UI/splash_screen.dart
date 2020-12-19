import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'strings.dart';

class Splash extends StatefulWidget {


  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var _duration = new Duration(milliseconds: 2000);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {

    Navigator.of(context).pushReplacementNamed('/Home');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffEDC1A6),
      body: SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        child:Stack(
          children: <Widget>[
            Positioned(
              left: 200,
              top: 40,
              child: CircleAvatar(
                minRadius: 10,
                maxRadius: 50,
                backgroundColor: Colors.transparent,
                child: Image.asset("images/splashimage2.png",)
              ),
            ),
            Positioned(
              left: 200,
              top: 190,
              child: CircleAvatar(
                minRadius: 10,
                maxRadius: 70,
                backgroundColor: Colors.transparent,
                child: Image.asset("images/splashimage1.png",)
              ),
            ),
            Positioned(
              left: 20,
              top: 140,
              child: Container(
                width: width/2,
                child: Text(
                  Strings.splash,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 44
                  ),
                ),
              )
            ),
            Positioned(
              left: 30,
              top: 400,
              child: CircleAvatar(
                minRadius: 10,
                maxRadius: 96,
                backgroundColor: Colors.transparent,
                child: Image.asset("images/splashimage3.png",)
              ),
            ),

            // Align(
            //   alignment: FractionalOffset.bottomCenter,
            //   child: Container(
            //     width: width/1.5,
            //     child: Text(
            //       "By creating an account, you agree to our Terms of Service and Privacy Policy",
            //       maxLines: 2,
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.w400,
            //           fontSize: 10
            //       ),
            //     ),
            //   ),
            // ),
          ],
        )
      ),
    );
  }
}
