
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'profile.dart';



class navigation_bar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavigationBar();
  }
}

class NavigationBar extends State<navigation_bar> {


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedTab = 0;
  final _pageOptions = [

    home_page(),
    profile(),



  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(




      theme: ThemeData(
          primarySwatch: Colors.grey,

          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.grey),
          )),
      home: Scaffold(


        key: _scaffoldKey,

        body: _pageOptions[_selectedTab],
        bottomNavigationBar: SizedBox(height: 52,
          child: BottomNavigationBar(

            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedTab,
            selectedItemColor: Color(0xffED7457),
            elevation: 2,
            onTap: (int index) {
              setState(() {
                  _selectedTab = index;
                });
            },


            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                title: Text('Home',style: TextStyle(fontSize: height/60),),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                title: Text('Home',style: TextStyle(fontSize: height/60),),
              ),



            ],
          ),
        ),
      ),
    );
  }
}

