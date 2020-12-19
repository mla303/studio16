import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:studio16/UI/home_page.dart';
import 'package:studio16/UI/walkthrough_1.dart';
import 'package:studio16/UI/walkthrough_2.dart';
import 'package:studio16/UI/walkthrough_3.dart';
import 'package:page_transition/page_transition.dart';

import 'login_screen.dart';
import 'navigation_bar.dart';


class walkthrough extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<walkthrough> {


  int currentIndexPage;
  int pageLength;

  @override
  void initState()
  {
    currentIndexPage = 0;
    pageLength = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        PageView(
          children: <Widget>[
            walkthrough_1(),
            walkthrough_2(),
            walkthrough_3(),

          ],
          onPageChanged: (value) {
            setState(() => currentIndexPage = value);
          },
        ),

        Positioned(
          bottom: MediaQuery.of(context).size.height /20,
          child: Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.18),
            child: GestureDetector(
              onTap: ()
              {
            Navigator.pushReplacement(
                context,
                PageTransition(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeIn,
                  alignment: Alignment.topCenter,
                  type: PageTransitionType.rightToLeftWithFade,
                    child: navigation_bar(),
                ));
              },
              child: Container(
                width: 220.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Colors.white
                ),
                child: Center(child: Text("Get Started Now",
                  style: TextStyle(
                      color: Color(0xffEDC1A6),
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),),),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: MediaQuery.of(context).size.height / 6,
          // left: MediaQuery.of(context).size.width * 0.35,
          child: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.40),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: new DotsIndicator(
                position: currentIndexPage.toDouble(),
                dotsCount: pageLength,
                decorator: DotsDecorator(
                    activeColor: Colors.white, color: Colors.grey),
//                      numberOfDot: pageLength,
//                      position: currentIndexPage,
//                      dotColor: Colors.black87,
//                      dotActiveColor: Colors.amber
//
              ),
            ),
          ),
        ),

        // Align(
        //   alignment: FractionalOffset.bottomCenter,
        //   child: Container(
        //     width: MediaQuery.of(context).size.width/1.5,
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

//


      ],
    ));
  }
}

