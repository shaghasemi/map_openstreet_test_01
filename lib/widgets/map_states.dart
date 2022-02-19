import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:latlong/latlong.dart';
import 'package:latlong2/latlong.dart';


class AppState with ChangeNotifier {

  bool locationServiceActive = true;

  final MapController _mapController  = MapController();
  MapController get mapController => _mapController;

  static LatLng _initialPosition = LatLng(50,48);
  var _lastPosition = _initialPosition;
  LatLng get initialPosition => _initialPosition;
  LatLng get lastPosition => _lastPosition;

  //Add to your class
  initalization() async {
    await checkGPS();
    await _getUserLocation();
  }

  checkGPS() async{
    bool conn = await Geolocator.isLocationServiceEnabled();
    if(conn == false){
      locationServiceActive = false;
    } else {
      locationServiceActive = true;
    }
    notifyListeners();
  }

  _getUserLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("/////////////////////////////////////////////////////////////////////////////////position");
    print(position);

    _initialPosition = LatLng(position.latitude, position.longitude);
    notifyListeners();
  }
}