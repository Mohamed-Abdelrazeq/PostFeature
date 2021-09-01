import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends ChangeNotifier{

  double lat;
  double lng;

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    //Check if location service enabled in the phone
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //Open location service if it is closed
    if(!serviceEnabled){
      await Geolocator.openLocationSettings();
    }
    //Check location permission for our app
    permission = await Geolocator.checkPermission();
    //Request permissions if we don't have it
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }
    //Get User Location
    if(permission == LocationPermission.whileInUse || permission == LocationPermission.always){
      try{
        Position coordinates = await Geolocator.getCurrentPosition();
        lat = coordinates.latitude;
        lng = coordinates.longitude;
      } catch (e){
        print(e);
      }
    }
  }

}