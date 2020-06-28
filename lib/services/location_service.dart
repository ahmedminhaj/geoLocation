import 'dart:async';

import 'package:geolocator/geolocator.dart' as geo;
import 'package:location/location.dart';

class LocationService {
  geo.Position currentLocation;
  geo.Position lastLocation;
  String currentAddress;
  double distanceCover;
  var timer = Duration(seconds: 20);
  var location = Location();

  StreamController<geo.Position> _locationController =
      StreamController<geo.Position>();
  StreamController<String> _addressController = StreamController<String>();
  StreamController<double> _distanceController = StreamController<double>();

  LocationService() {
    findLocation();
    Timer.periodic(timer, (t) {
      findLocation();
    });
  }

  Stream<geo.Position> get getLocation => _locationController.stream;
  Stream<String> get getAddress => _addressController.stream;
  Stream<double> get getDistance => _distanceController.stream;

  Future<geo.Position> getCurrentLocation() async {
    //print("fetch position");
    geo.Position position = await geo.Geolocator()
        .getCurrentPosition(desiredAccuracy: geo.LocationAccuracy.high);
    return position;
  }

  Future<double> findDistance() async {
    if (lastLocation != null) {
      geo.Position currentPos = await getCurrentLocation();
      geo.Position lastPos = lastLocation;
      print(currentPos);
      print(lastPos);
      double distanceInMeters = await geo.Geolocator().distanceBetween(
          currentPos.latitude,
          currentPos.longitude,
          lastPos.latitude,
          lastPos.longitude);
      return distanceInMeters;
    } else {
      return 0.0;
    }
  }

  getCurrentAddress(geo.Position currentloc) async {
    if (currentloc != null) {
      try {
        List<geo.Placemark> p = await geo.Geolocator().placemarkFromCoordinates(
            currentloc.latitude, currentloc.longitude);

        geo.Placemark place = p[0];
        return "${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
      } catch (e) {
        print(e);
      }
    } else {
      return null;
    }
  }

  findLocation() async {
    //print("fetch location");
    currentLocation = await getCurrentLocation();
    //print("fetch complet");
    currentAddress = await getCurrentAddress(currentLocation);
    print("current location + $currentLocation");
    print("last location + $lastLocation");
    distanceCover = await findDistance();
    lastLocation = currentLocation;
    print("Distance change + $distanceCover");
    print("new last location + $lastLocation");
    _locationController.add(currentLocation);
    _addressController.add(currentAddress);
    _distanceController.add(distanceCover);
  }
}
