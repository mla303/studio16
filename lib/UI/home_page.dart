import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:studio16/UI/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../data.dart';
import 'upload file.dart';
import 'video_detail.dart';
import 'package:studio16/model.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
class home_page extends StatefulWidget {
  @override
  _home_pageState createState() => _home_pageState();
}




class _home_pageState extends State<home_page> {
  String VideoTitle = "", VideoDescrpt = "", VideoUrl = "";
  FirebaseUser user;
  DocumentSnapshot userdata;
  List<Video> list = List();


  List<Widget> _homeScreenData () => [

    //top header
    Container(

      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 8,
      decoration: new BoxDecoration(
      ),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
        color: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
//                  IconButton(
//                      onPressed: () {
//                        Navigator.push(
//                            context,
//                            PageTransition(
//                              type: PageTransitionType.rightToLeftWithFade,
//                              child: upload_file(),
//                            ));
//                      },
//                      icon: Icon(
//                        Icons.cloud_upload,
//                        color: Colors.white,
//                        size: 28,
//                      )),
            Text(
              Strings.splash,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: MediaQuery.of(context).size.height / 40,
                  fontWeight: FontWeight.w400),
            ),


            SizedBox(width: MediaQuery.of(context).size.width/3.7,),

            IconButton(
                onPressed: () {
                  SystemNavigator.pop();
//                  exit(0);
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 24,
                ))

          ],
        ),
      ),
    ),


    //listview
    Expanded(
      // color: Colors.redAccent,
      // padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 0.0),
      // height: MediaQuery.of(context).size.height,

      child: StreamBuilder<QuerySnapshot>(

        stream: Firestore.instance.collection("studio16").snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Center(
              child: new Image(image: AssetImage("images/loading.gif")));
          return new ListView(children: getExpenseItems(snapshot));
        },
      ),
    ),
  ];







  VideoPlayerController  videoPlayerController;
  ChewieController chewieController;
  bool isPlaying = false, isEndPlaying = false;
  Future<void> futureController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
        children: _homeScreenData(),
      )),




    );
  }








  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents
        .map((doc) => new ListTile(

            //leading: Text(doc["VideoTitle"]),
            title: InkWell(
              onTap: ()
              {
                final videodata = Data(
                  videourl: doc["VideoUrl"].toString(),
                  videotitle: doc["VideoTitle"].toString(),
                  videodesc: doc["VideoDescrpt"].toString(),
                );



                Navigator.push(context,
                    MaterialPageRoute(
                    builder: (context) => new video_detail(
                       data: videodata,
                    )
                ));
              },
              child: Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                    Center(
                      child: Image(
                        image: AssetImage("images/video2.jpg"),
                      )

//                    _playView(
//                    doc["VideoUrl"],
//                ),
                    ),
                      SizedBox(height: 12,),
                      Text(doc["VideoTitle"].toString()),
                      SizedBox(height: 12,),
                    ],
                  )
//
                ),
              ),
            ),
            //title: new Text(doc["VideoUrl"]),
//            subtitle: new Text(doc["VideoDescrpt"].toString())
    ),

    )
        .toList();
  }
}








