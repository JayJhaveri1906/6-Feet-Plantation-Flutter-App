import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sixfeetplantation/screens/loginScreen.dart';
import 'constants.dart';
import 'screens/mainScreen.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '6 Feet Plantation',
      theme: ThemeData(
        primaryColor: AppPrimaryColor,
        primaryColorLight: AppPrimaryLightColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
