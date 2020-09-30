
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';

import 'navigation_bar.dart';


class EditProfile extends StatefulWidget {
  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  String name= 'Ali Talib';
  String id= '810410';
  String phoneNumber= '03400888104';
  String email = 'alitalib16867@gmail.com';
  String username = 'ali420';
  String address = 'DHA pahse 2 Islamabad';


  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
          //backgroundColor: Color(0xfff0fff3),

          body: Column(
            children: <Widget>[
              SizedBox(height: height/10,),

              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundImage:
                  ExactAssetImage('assets/person.jpg'),
                  minRadius: height / 30,
                  maxRadius: height / 15,

                ),
              ),
              SizedBox(height: height/60,),
              Text(
                '$name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: height / 30,
                    fontWeight: FontWeight.bold),
              ),
              Text('UI/UX Designer',
                style: TextStyle(
                    fontSize: height/55
                ),
              ),
              Divider(),



              Container(
                width: width/1.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    SizedBox(height: height/50,),

                    Text("Your Name",style: TextStyle(fontSize: height/60,color: Colors.black45),),
                    SizedBox(height: 4),
                    Text('Ali Talib',style: TextStyle(fontSize: height/45),),

                    SizedBox(height: height/30,),

                    Text("Username",style: TextStyle(fontSize: height/60,color: Colors.black45),),
                    SizedBox(height: 4),
                    Text('$username',style: TextStyle(fontSize: height/45),),

                    SizedBox(height: height/30,),

                    Text("Email",style: TextStyle(fontSize: height/60,color: Colors.black45),),
                    SizedBox(height: 4),
                    Text('$email)',style: TextStyle(fontSize: height/45),),
//
                    SizedBox(height: height/30,),

                    Text("Contact No.",style: TextStyle(fontSize: height/60,color: Colors.black45),),
                    SizedBox(height: 4),
                    Text('$phoneNumber',style: TextStyle(fontSize: height/45),),

                    SizedBox(height: height/30,),

                    Text("Address",style: TextStyle(fontSize: height/60,color: Colors.black45),),
                    SizedBox(height: 4),
                    Text('$address',style: TextStyle(fontSize: height/45),),

                    SizedBox(height: height/15,),



                  ],
                ),
              ),

              ButtonTheme(
                minWidth: width/1.3,
                height: height/18,
                child: RaisedButton(

                  shape: new RoundedRectangleBorder(

                    borderRadius: new BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.white,)
                  ),


                  color: Colors.white,
                  textColor: Color(0xffED7457),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Update Profile",
                    style: TextStyle(
                        fontSize: height / 55,
                        fontWeight: FontWeight.w500
                      //letterSpacing: 1
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                          curve: Curves.easeInCirc,
                          type: PageTransitionType.rotate,
                          alignment: Alignment.topCenter,
                          child: navigation_bar(),
                        ));
                  },
                ),
              ),
            ],
          ),
        );
  }
}
