import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geotracker/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'services/location_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Position>(
      create: (context) => LocationService().getLocation,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
