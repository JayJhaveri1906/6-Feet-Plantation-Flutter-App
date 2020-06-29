import 'package:firebase_database/firebase_database.dart';
import 'package:sixfeetplantation/login.dart';

class TreeMarker {
  String key;
  String treeName;
  String treeDescription;
  String lat;
  String long;
  String date;
  String time;
  String emailId;

  TreeMarker(this.treeName, this.treeDescription, this.lat, this.long,
      this.date, this.time, this.emailId);

  TreeMarker.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        treeName = snapshot.value["treeName"],
        treeDescription = snapshot.value["treeDescription"],
        lat = snapshot.value["lat"],
        long = snapshot.value["long"],
        date = snapshot.value["date"],
        time = snapshot.value["time"],
        emailId = snapshot.value["emailId"];

  toJson() {
    return {
      "treeName": treeName,
      "treeDescription": treeDescription,
      "lat": lat,
      "long": long,
      "date": date,
      "time": time,
      "emailId": emailId
    };
  }
}
