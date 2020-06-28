import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sixfeetplantation/constants.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GoogleMapController mapController;

  final dateFormat = DateFormat("MM-dd-yyyy");
  final timeFormat = DateFormat("HH:mm");

  final LatLng _center = const LatLng(41.83444043884994, -87.61638505301339);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('6 Feet Plantation'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              padding: EdgeInsets.only(bottom: 50),
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 18.0,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(color: AppPrimaryColor),
              height: 50,
            ),
          ),
          Positioned(
            bottom: 10,
            child: IconButton(
              iconSize: 60,
              icon: Image.asset(
                'assets/icons/add_button.png',
              ),
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        elevation: 16,
                        child: Container(
                          height: 380,
                          width: 400,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Add Plant Information',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    height: 40,
                                    child: TextField(
                                      cursorColor: AppSecondaryColor,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Plant Name',
                                          labelStyle: TextStyle(fontSize: 16)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    height: 40,
                                    child: TextField(
                                      cursorColor: AppSecondaryColor,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Plant Description',
                                          labelStyle: TextStyle(fontSize: 16)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    height: 40,
                                    child: DateTimeField(
                                      format: dateFormat,
                                      onShowPicker: (context, currentValue) {
                                        return showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1900),
                                            initialDate:
                                                currentValue ?? DateTime.now(),
                                            lastDate: DateTime(2100));
                                      },
                                      cursorColor: AppSecondaryColor,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Date',
                                        labelStyle: TextStyle(fontSize: 16),
                                        prefixIcon: Icon(Icons.date_range),
                                        suffixIcon: Icon(Icons.arrow_drop_down),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    height: 40,
                                    child: DateTimeField(
                                      format: timeFormat,
                                      onShowPicker:
                                          (context, currentValue) async {
                                        final time = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.fromDateTime(
                                              currentValue ?? DateTime.now()),
                                        );
                                        return DateTimeField.convert(time);
                                      },
                                      cursorColor: AppSecondaryColor,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Time',
                                        labelStyle: TextStyle(fontSize: 16),
                                        prefixIcon: Icon(Icons.date_range),
                                        suffixIcon: Icon(Icons.arrow_drop_down),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: ButtonBar(
                                      alignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              side: BorderSide(
                                                  color: Colors.black)),
                                          child: Text(
                                            'Cancel',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context, true);
                                          },
                                          elevation: 2.0,
                                          highlightElevation: 8.0,
                                          disabledElevation: 0.0,
                                          color: Colors.black,
                                          splashColor: Colors.grey,
                                        ),
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              side: BorderSide(
                                                  color: AppPrimaryColor)),
                                          child: Text('Plant Tree'),
                                          elevation: 2.0,
                                          highlightElevation: 8.0,
                                          disabledElevation: 0.0,
                                          color: AppPrimaryColor,
                                          onPressed: () {},
                                          splashColor: AppSecondaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
