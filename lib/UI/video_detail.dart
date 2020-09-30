import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:studio16/UI/home_page.dart';
import 'package:studio16/UI/strings.dart';
import 'package:video_player/video_player.dart';
import '../data.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

class video_detail extends StatefulWidget {
  final Data data;

  video_detail({this.data});


  @override
  _video_detailState createState() => _video_detailState(data);
}

class _video_detailState extends State<video_detail> {




  VideoPlayerController  videoPlayerController;
  ChewieController chewieController;
  bool isPlaying = false, isEndPlaying = false;
  Future<void> futureController;

  @override
  void initState() {
    // TODO: implement initState
    videoPlayerController = VideoPlayerController.network(data.videourl);
    futureController = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(25.0);
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 3 / 3,
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
  Data data;
  _video_detailState(this.data);


  @override
  Widget build(BuildContext context) {





    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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

                SizedBox(height: height/40,),

                Container(
                  width: width/1.1,
//              color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
//                mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('${data.videotitle}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: height/70,),
                      Text(
                        '${data.videodesc}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),),


                      Divider(
                      ),


                      SizedBox(height: height/20,),

                      Column(
                        children: <Widget>[
                          Text("Video Powered by:",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300
                            ),
                          ),

                          Container(
                            height: height/6,
                            padding: EdgeInsets.all(18.0),
                            margin: EdgeInsets.only(right: 16.0),
                            decoration: ShapeDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/Boss.jpeg"),
                                  fit: BoxFit.contain
                                ),
                                shape: PolygonBorder(
                                    sides: 7,
                                    borderRadius: 8.0,
                                    border: BorderSide(color: Colors.blueGrey, width: 2))),
//                    child: Image(image: AssetImage("images/Boss.jpeg"),),
                          ),

                          Text("Mahfer Arslan",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),



                    ],
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _playView() {
    chewieController.play();
    return Chewie(controller: chewieController);
  }
}
