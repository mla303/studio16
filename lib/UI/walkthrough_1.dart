import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'strings.dart';
class walkthrough_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xffe3e1e1),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xff292827),
                  image: DecorationImage(
                      image: AssetImage("images/walkthrough1.png"),
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.dstATop),
                      fit: BoxFit.cover
                  )
              ),
            ),
           Center(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(
                   Strings.walkthrough1Text1,
                   maxLines: 4,
                   textAlign: TextAlign.center,
                   style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.w400,
                       fontSize: 22
                   ),
                 ),
                 SizedBox(
                   height: height/20,
                 ),
                 Text(
                   Strings.walkthrough1Text2,
                   maxLines: 1,
                   textAlign: TextAlign.center,
                   style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.w400,
                       fontSize: 22
                   ),
                 ),
               ],
             ),
           )
          ],

        ));
  }
}
