import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

import 'forgetPassword.dart';
import 'navigation_bar.dart';


class login_screen extends StatefulWidget {
  @override
  _login_screenState createState() => _login_screenState();
}



class _login_screenState extends State<login_screen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail;
  TextEditingController controllerPass;
  String _email;
  String _password;
  bool isLoading = false;



  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff3B5753),
          image: DecorationImage(
              image: AssetImage('images/login.png'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop))),

       child: Scaffold(
        backgroundColor: Colors.transparent,
           body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: width,
              height: height,
//              color: Colors.blue,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text(
                      "Login ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),


                    //email Textfield
                    Container(
                      width: width/1.6,
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: validateEmail,
                          controller: controllerEmail,
                          onSaved: (val) =>
                              setState(() => _email=val),




                          cursorColor: Colors.grey,
                          cursorWidth: 1,
                          style: TextStyle(
                              color: Color(0xffF1F1F1),
                              fontWeight: FontWeight.w400),
                          decoration: new InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffF1F1F1))
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffF1F1F1))
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffF1F1F1))
                            ),
                            hintText: "Enter email",
                            hintStyle: TextStyle(
                                color: Color(0xffF1F1F1),
                                fontWeight: FontWeight.w300,
                                fontSize: 14
                            ),
                            contentPadding: EdgeInsets.only(bottom:5.0,left: 6),
                            isDense: true,
                          )
                      ),

                    ),

                    SizedBox(
                      height: height / 90,
                    ),
                    //password textfield

                    Container(
                      width: width/1.6,
                      child: TextFormField(
                        validator:  validatePass,
                          controller: controllerPass,
                          onSaved: (val) =>
                              setState(() => _password=val),
                        style: TextStyle(
                            color: Color(0xffF1F1F1),
                            fontWeight: FontWeight.w400),
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            iconSize: 18,
                            color: Colors.grey,
                            onPressed: _toggle,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 0),
//                          border: InputBorder.none,
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                              color: Color(0xffF1F1F1),
                              fontWeight: FontWeight.w300,
                              fontSize: 14
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffF1F1F1))
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffF1F1F1))
                          ),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffF1F1F1))
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: height / 60,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            PageTransition(
                              curve: Curves.bounceOut,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: forgetPassword(),
                            ));
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        width: width/1.6,
                        child: Text(
                          "Forget Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13
                          ),

                          ),
                        ),
                    ),


                    SizedBox(
                      height: height / 26,
                    ),

                    //lohin button
                    //button
                    ButtonTheme(
                      minWidth: width/3,
                      child: RaisedButton(

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white,)
                        ),
                        color: Colors.white,
                        textColor: Color(0xffED7457),
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {
                          final form = _formKey.currentState;

                          if(form.validate())
                            {
                              isLoading = true;
                              form.save();
                              FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)
                              .then((AuthResult auth)
                              {
                                isLoading = false;
                                clearControllers();
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      curve: Curves.bounceOut,
                                      type: PageTransitionType.rotate,
                                      alignment: Alignment.topCenter,
                                      child: navigation_bar(),
                                    ));
                              }).catchError((e){
                                isLoading=false;
                                Fluttertoast.showToast(msg: "Sign In Failed");
                                this.setState((){
                                  isLoading = false;
                                });
                                print(e);
                              });

                            }



                        },
                        child: Text(
                          "Let\'s Go",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),







                  ],
                ),
              ),
            ),
          ),
        )),

    );
  }

  clearControllers()
  {
    controllerEmail = new TextEditingController(text: "");
    controllerPass = new TextEditingController(text: "");
  }

}


String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}


String validatePass(String value) {
  if (value.length < 5)
    return 'Password must be more than 5 charater';
  else
    return null;
}

