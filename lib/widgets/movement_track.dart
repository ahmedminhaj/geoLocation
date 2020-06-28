import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovementTrack extends StatefulWidget {
  @override
  _MovementTrackState createState() => _MovementTrackState();
}

class _MovementTrackState extends State<MovementTrack> {
  @override
  Widget build(BuildContext context) {
    var distanceChange = Provider.of<double>(context);
    var distanceMeter = (distanceChange == null)
        ? 0.0
        : distanceChange.toStringAsFixed(2);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ( distanceChange == null || distanceChange >= 0.0 && distanceChange <= 2.00)
          ? Text(
              "Position unchanged",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            )
          : (distanceChange > 2.00 && distanceChange <= 10.00)
              ? Text(
                  "Walked solwly $distanceMeter meters",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                )
              : (distanceChange > 10.00 && distanceChange <= 20.00)
                  ? Text(
                      "Walked $distanceMeter meters",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    )
                  : (distanceChange > 20.00 && distanceChange <= 40.00)
                      ? Text(
                          "Walked fast $distanceMeter meters",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        )
                      : (distanceChange > 40.00 && distanceChange <= 60.00)
                          ? Text(
                              "Ran $distanceMeter meters",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            )
                          : (distanceChange > 60.00 && distanceChange <= 90.00)
                              ? Text(
                                  "Ran fast $distanceMeter meters",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
                                )
                              : Text(
                                  "Distance cover $distanceMeter meters",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
    );
  }
}
