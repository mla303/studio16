import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'strings.dart';
class walkthrough_3 extends StatelessWidget {
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
                      image: AssetImage("images/walkthrough2.png"),
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.dstATop),
                      fit: BoxFit.cover
                  )
              ),
            ),

            Center(
              child: CircleAvatar(
                  minRadius: 10,
                  maxRadius: 180,
                  backgroundColor: Colors.transparent,
                  child: Image.asset("images/walkthrough3.png",)
              ),
            ),


          ],

        ));
  }
}
