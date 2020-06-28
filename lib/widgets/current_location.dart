import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class CurrentLocation extends StatefulWidget {
  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  @override
  Widget build(BuildContext context) {
    var currentPosition = Provider.of<Position>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: (currentPosition != null)
                ? Column(
                    children: <Widget>[
                      Text(
                        "Current Geo Location",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Latitude: ${currentPosition.latitude}",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Longitude: ${currentPosition.longitude}",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w300),
                      ),
                    ],
                  )
                : Text(
                    "Please, enable location",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
          )
        ],
      ),
    );
  }
}