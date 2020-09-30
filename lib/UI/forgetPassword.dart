import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:studio16/UI/verificationCode.dart';

import 'login_screen.dart';

class forgetPassword extends StatefulWidget {
  @override
  _forgetPasswordState createState() => _forgetPasswordState();
}



class _forgetPasswordState extends State<forgetPassword> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail;
  String _email;







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
                        "Forget Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                        ),
                      ),

                      SizedBox(
                        height: 45,
                      ),


                      //email Textfield
                      Container(
                        width: width/1.6,
                        child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            // validator: validateEmail,
                            // controller: controllerEmail,
                            // onSaved: (val) =>
                            //     setState(() => _email=val),




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
                              hintText: "Enter Your email",
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
                        height: 16,
                      ),

                      // button
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
                            // final form = _formKey.currentState;
                            //
                            // if(form.validate())
                            // {
                            //   isLoading = true;
                            //   form.save();
                            //   FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)
                            //       .then((AuthResult auth)
                            //   {
                            //     isLoading = false;
                            //     clearControllers();
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                  curve: Curves.bounceOut,
                                  type: PageTransitionType.rotate,
                                  alignment: Alignment.topCenter,
                                  child: verification_code(),
                                ));
                            //   }).catchError((e){
                            //     isLoading=false;
                            //     Fluttertoast.showToast(msg: "Sign In Failed");
                            //     this.setState((){
                            //       isLoading = false;
                            //     });
                            //     print(e);
                            //   });
                            //
                            // }



                          },
                          child: Text(
                            "Reset Password",
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



}


