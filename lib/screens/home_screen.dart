import 'package:flutter/material.dart';
import 'package:geotracker/screens/position_tracker.dart';
import 'package:geotracker/services/location_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<String>(
      create: (context) => LocationService().getAddress,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[800],
          title: Text("geo Tracker"),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: PositionTracker(),
          ),
        ),
      ),
    );
  }
}
