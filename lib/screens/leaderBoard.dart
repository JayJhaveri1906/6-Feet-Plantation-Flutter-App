import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sixfeetplantation/constants.dart';
import 'package:sixfeetplantation/model/user.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  FirebaseDatabase database = new FirebaseDatabase();
  List<User> list = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leader Board'),
        backgroundColor: AppPrimaryColor,
      ),
      body: Container(
        child: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: new Card(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: new Text(
                        (index + 1).toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      width: 30,
                      padding: EdgeInsets.only(left: 30),
                    ),
                    Container(
                      child: new Text(
                        list[index].name,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      child: new Text(
                        list[index].count.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      width: 30,
                      padding: EdgeInsets.only(right: 40),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: list == null ? 0 : list.length,
        ),
      ),
    );
  }

  getList() async {
    await database
        .reference()
        .child("users")
        .once()
        .then((DataSnapshot dataSnapshot) {
      this.setState(() {
        for (var value in dataSnapshot.value.values) {
          list.add(new User.fromJson(value));
        }
      });
    });
  }
}
