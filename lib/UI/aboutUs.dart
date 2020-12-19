
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:studio16/UI/login_screen.dart';
import 'editprofile.dart';


class aboutUs extends StatefulWidget {
  @override
  _aboutUsState createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> {
  String name= 'Mehfer Arslan';
  String location= 'Switzerland';
  String phoneNumber= '+41 79 308 45 02';



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
              Text('CEO Studio16',
                style: TextStyle(
                  fontSize: height/55
                ),
              ),
              Divider(),

              SizedBox(height: height/50,),

              Container(
                width: width/1.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text("Contact No.",style: TextStyle(fontSize: height/60,color: Colors.black45),),
                    SizedBox(height: 4),
                    Text('$phoneNumber',style: TextStyle(fontSize: height/45),),

                    SizedBox(height: height/50,),


                    Text("Location",style: TextStyle(fontSize: height/60,color: Colors.black45),),
                    SizedBox(height: 4),
                    Text('$location',style: TextStyle(fontSize: height/45),),

                    SizedBox(height: height/20,),

                    GestureDetector(
                      onTap: (){
                        SystemNavigator.pop();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.exit_to_app,size: 18,color: Color(0xffED7457),),
                          SizedBox(width: 6,),
                          Text("Exit",style: TextStyle(fontSize: height/45,color: Color(0xffED7457),fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),



                    SizedBox(height: height/15,),



                  ],
                ),
              ),

            ],
          ),
        ));
  }
}
