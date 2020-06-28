import 'package:flutter/material.dart';
import 'package:geotracker/services/location_service.dart';
import 'package:geotracker/widgets/current_address.dart';
import 'package:geotracker/widgets/current_location.dart';
import 'package:geotracker/widgets/movement_track.dart';
import 'package:provider/provider.dart';

class PositionTracker extends StatefulWidget {
  @override
  _PositionTrackerState createState() => _PositionTrackerState();
}

class _PositionTrackerState extends State<PositionTracker> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<double>(
      create: (context) => LocationService().getDistance,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CurrentLocation(),
                SizedBox(
                  height: 20,
                ),
                CurretAddress(),
                SizedBox(
                  height: 20,
                ),
                MovementTrack(),
              ],
      ),
    );
  }
}
