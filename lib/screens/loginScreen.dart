import 'package:firebase_auth/firebase_auth.dart';
import 'package:sixfeetplantation/constants.dart';
import 'package:sixfeetplantation/login.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'mainScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver {
  double width = 0.0;
  double height = 0.0;
  FirebaseUser loggedUser;
  @override
  void initState() {
    super.initState();
    googleSignIn.isSignedIn().then((value) {
      if (value) {
        FirebaseAuth.instance.currentUser().then((value) {
          user = value;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    setState(() {
      width = MediaQueryData.fromWindow(window).size.width;
      height = MediaQueryData.fromWindow(window).size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: AppPrimaryColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(
              child: new Image.asset(
                'assets/icons/tree.png',
                width: 180,
                height: 224,
              ),
            ),
            AnimatedPadding(
              padding: EdgeInsets.fromLTRB(0, height * 0.0764, 0, 0),
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Text(
                'Login with',
                style: TextStyle(
                    fontSize: 16.0,
                    color: AppSecondaryColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: RawMaterialButton(
                elevation: 0.5,
                shape: CircleBorder(),
                onPressed: () {
                  signInWithGoogle()
                      .then((user) => {
                            if (user != null)
                              {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainScreen(),
                                  ),
                                ),
                              }
                          })
                      .catchError((e) => {
                            Fluttertoast.showToast(
                                msg: "Error occurred while login",
                                toastLength: Toast.LENGTH_LONG,
                                backgroundColor: Colors.white.withOpacity(0.3),
                                textColor: Colors.black),
                          });
//                  signInWithGoogle().whenComplete(() {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => mainToDoList()),
//                    );
//                  });
                },
                child: Image.asset('assets/icons/google_button.png',
                    height: 55, width: 55),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
