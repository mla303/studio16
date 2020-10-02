
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:studio16/UI/login_screen.dart';
import 'editprofile.dart';


class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  String name= 'Mehfer Arslan';
  String id= '810410';
  String phoneNumber= '+41 79 308 45 02';
  String email = 'admin@gmail.com';
  String username = 'admin333';


  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
        home: Scaffold(
          //backgroundColor: Color(0xfff0fff3),

          body: Column(
            children: <Widget>[
              SizedBox(height: height/10,),

              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundImage:
                  ExactAssetImage('images/Boss.jpeg'),
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
              Text('Admin',
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

                    Text("Your ID",style: TextStyle(fontSize: height/60,color: Colors.black45),),
                    SizedBox(height: 4),
                    Text('$id',style: TextStyle(fontSize: height/45),),

                    SizedBox(height: height/30,),

                    Text("Username",style: TextStyle(fontSize: height/60,color: Colors.black45),),
                    SizedBox(height: 4),
                    Text('$username',style: TextStyle(fontSize: height/45),),

                    SizedBox(height: height/30,),

                    Text("Email",style: TextStyle(fontSize: height/60,color: Colors.black45),),
                    SizedBox(height: 4),
                    Text('$email',style: TextStyle(fontSize: height/45),),
//
                    SizedBox(height: height/30,),

                    Text("Contact No.",style: TextStyle(fontSize: height/60,color: Colors.black45),),
                    SizedBox(height: 4),
                    Text('$phoneNumber',style: TextStyle(fontSize: height/45),),

                    SizedBox(height: height/20,),

                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                              curve: Curves.decelerate,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: login_screen(),
                            ));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.exit_to_app,size: 18,color: Color(0xffED7457),),
                          SizedBox(width: 6,),
                          Text("Logout",style: TextStyle(fontSize: height/45,color: Color(0xffED7457),fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),



                    SizedBox(height: height/15,),



                  ],
                ),
              ),

              ButtonTheme(
                minWidth: width/1.3,
                height: height/18,
                child: RaisedButton(

                  shape: new RoundedRectangleBorder(

                    borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white,)
                  ),


                  color: Colors.white,
                  textColor: Color(0xffED7457),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                        fontSize: height / 55,
                        fontWeight: FontWeight.w500
                      //letterSpacing: 1

                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          curve: Curves.easeInCirc,
                          type: PageTransitionType.rotate,
                          alignment: Alignment.topCenter,
                          child: EditProfile(),
                        ));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
