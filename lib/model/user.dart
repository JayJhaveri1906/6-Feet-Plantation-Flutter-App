import 'package:firebase_database/firebase_database.dart';
import 'package:sixfeetplantation/login.dart';

class User {
  String key;
  String name;
  String userId;
  String emailId;
  String count;

  User(this.name, this.userId, this.count, this.emailId);

  User.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        userId = snapshot.value["userId"],
        name = snapshot.value["name"],
        emailId = snapshot.value["emailId"],
        count = snapshot.value["count"];

  toJson() {
    return {
      "name": name,
      "emailId": emailId,
      "count": count,
      "userId": userId,
    };
  }

  User.fromJson(var value) {
    this.name = value['name'];
    this.count = value['count'];
  }
}
