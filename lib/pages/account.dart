import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Account extends StatefulWidget {
  @override
  State<Account> createState() => MapSampleState();
}

class MapSampleState extends State<Account> {
  Location location = new Location();

  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex;

  @override
  void initState() {
    super.initState();
    if (_kGooglePlex == null) {
      _setMyLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _kGooglePlex != null
          ? GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            )
          : null,
    );
  }

  Future _setMyLocation() async {
    try {
      LocationData currentLocation = await location.getLocation();
      if (currentLocation != null) {
        this.setState(() {
          _kGooglePlex = CameraPosition(
            target: LatLng(currentLocation.latitude, currentLocation.longitude),
            zoom: 14.4746,
          );
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
