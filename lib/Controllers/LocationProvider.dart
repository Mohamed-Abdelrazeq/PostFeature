import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier{

  double lat;
  double lng;

  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    //Get Permissions
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return "SAD";
      }
    }
    //Get Location
    Position currentCoordinates = await Geolocator.getCurrentPosition();
    lat = currentCoordinates.latitude.toDouble();
    lng = currentCoordinates.longitude.toDouble();
    notifyListeners();
  }

}