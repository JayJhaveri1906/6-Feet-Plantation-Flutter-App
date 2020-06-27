import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/mainScreen.dart';

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
      home: MainScreen(),
    );
  }
}
