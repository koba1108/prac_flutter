import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  Location location = new Location();
  Map<String, double> userLocation;

  @override
  void initState() {
    super.initState();
    _setLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            userLocation == null
                ? CircularProgressIndicator()
                : Text("Location:" + userLocation["latitude"].toString() +
                  " " + userLocation["longitude"].toString()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  _setLocation();
                },
                color: Colors.blue,
                child: Text("Get Location", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _setLocation() async {
    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();
      if (currentLocation != null) {
        this.setState(() {
          userLocation = {
            "latitude": currentLocation.latitude,
            "longitude": currentLocation.longitude,
          };
          print(userLocation);
        });
      }
    } catch (e) {
      // currentLocation = null;
    }
  }
}
