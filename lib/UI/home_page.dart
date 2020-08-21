import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:studio16/UI/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'upload file.dart';
import 'video_detail.dart';

class home_page extends StatefulWidget {
  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
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

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton( onPressed: ()
                        {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: upload_file(),
                              ));
                        },
                        icon: Icon(Icons.cloud_upload,color: Colors.white,size: 28,)),
                    Text(
                      Strings.splash,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color:  Color(0xffFFFFFF),
                          fontSize: height / 40,
                          fontWeight: FontWeight.w400),
                    ),
                    IconButton(
                      onPressed: ()
                        {
                          SystemNavigator.pop();
                        },
                        icon: Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                          size: 28,))
                  ],
                ),
              ),
            ),




            Container(
//                color: Colors.redAccent,
//                padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 0.0),
              height: MediaQuery.of(context).size.height/1.2,
              child: StreamBuilder<QuerySnapshot>(
                  stream:  Firestore.instance.collection("Vidoes").snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot>snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new Center(child: new CircularProgressIndicator(),);
                    default:
                      return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
//                  physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            List<Container> videos = snapshot.data.documents.map((DocumentSnapshot document)
                            {
                              return Container(

                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 4,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: video_detail(),
                                        ));
                                  },
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[

                                        Container(
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.20,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  12.0),
                                            ),
                                            child: Container(
                                                height: 200,
                                                width: 200,
                                                decoration: BoxDecoration(
//                                      color: Color(0xff000000)
                                                    image: DecorationImage(
                                                        image: AssetImage("images/video3.jpg")
                                                    ),
                                                    borderRadius: BorderRadius
                                                        .circular(12)
                                                ),
                                                child: null

                                            ),
                                          ),
                                        ),


                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0),
                                          child: Text(document['VideoTitle'],
                                            style:
                                            TextStyle(
                                                color: Color(0xff224F75),
                                                fontSize: height / 54,
                                                fontWeight: FontWeight.w400
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0),
                                          child: Text(document["VideoDescrpt"],
                                            style:
                                            TextStyle(
                                                color: Color(0xff224F75),
                                                fontSize: height / 54,
                                                fontWeight: FontWeight.w400
                                            ),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList();

                          });
                  }

                }
              ),
            ),

//            Container(
//              color: Colors.yellow,
//              height: 200,
//              width: 200,
//              child: StreamBuilder(
//                stream:  Firestore.instance.collection("Vidoes").snapshots(),
//                builder: (context, snapshot){
//                  return ListView.builder(
//                    itemCount: snapshot.data.documents.length,
//                      itemBuilder: (context, index){
//                        DocumentSnapshot videos = snapshot.data.documents[index];
//                        return ListTile(
//
//                          leading: Image.network(videos['VideoUrl']),
//                          title: Text(videos['VideoTitle']),
//                          subtitle: Text(videos['VideoDescrpt']),
//                        );
//                      },
//
//
//
//                  );
//                },
//              ),
//            )

          ],
        ),
      ),
    );
  }
}


List VideoList = [

  Video(
      VideoName:"My Every Day Makeup Tutorial",
      imgUrl: "images/video1.jpg"
  ),
  Video(
      VideoName:"My Every Day Makeup Tutorial",
      imgUrl: "images/video2.jpg"
  ),
  Video(
      VideoName:"My Every Day Makeup Tutorial",
      imgUrl: "images/video3.jpg"
  ),
  Video(
      VideoName:"My Every Day Makeup Tutorial",
      imgUrl: "images/video1.jpg"
  ),

];

class Video{
  String VideoName;
  String imgUrl;

  Video({this.VideoName,this.imgUrl,});

}