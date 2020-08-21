import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studio16/UI/strings.dart';
import 'package:video_player/video_player.dart';

class video_detail extends StatefulWidget {
  @override
  _video_detailState createState() => _video_detailState();
}

class _video_detailState extends State<video_detail> {


  VideoPlayerController  videoPlayerController;
  ChewieController chewieController;
  bool isPlaying = false, isEndPlaying = false;
  Future<void> futureController;

  @override
  void initState() {
    // TODO: implement initState
    videoPlayerController = VideoPlayerController.network( "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",);
    futureController = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(25.0);
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(

              width: width,
              height: height/8,

              decoration: new BoxDecoration(

//                boxShadow: [
////                  BoxShadow(
////                    color: Color(0xffF18220),
////                    blurRadius: 20.0, // soften the shadow
////                    spreadRadius: 0.0, //extend the shadow
////                    offset: Offset(
////                      -2.0, // Move to right 10  horizontally
////                      -10.0, // Move to bottom 10 Vertically
////                    ),
////                  )
//                ],
              ),

              child: Card(
                elevation: 0,
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                    )
                ),

                child: Center(
                  child: Text(
                    Strings.splash,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color:  Color(0xffFFFFFF),
                        fontSize: height / 40,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),

            Center(
              child:  _playView(),
            ),

            SizedBox(height: height/60,),

            Container(
              width: width/1.1,
//              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
//                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("My Every Day Makeup Tutorial",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: height/90,),
                  Text(
                    Strings.videodescrption,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),),



                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
  Widget _playView() {
    chewieController.play();
    return Chewie(controller: chewieController);
  }
}
