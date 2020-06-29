import 'package:flutter/material.dart';
import 'package:sixfeetplantation/constants.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leader Board'),
        backgroundColor: AppPrimaryColor,
      ),
      body: Container(
        child: Text("Leader Board"),
      ),
    );
  }
}
