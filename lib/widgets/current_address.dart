import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurretAddress extends StatefulWidget {
  @override
  _CurretAddressState createState() => _CurretAddressState();
}

class _CurretAddressState extends State<CurretAddress> {
  @override
  Widget build(BuildContext context) {
    var currentAddress = Provider.of<String>(context);
    return Container(
       padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: (currentAddress != null)
          ? Column(
              children: <Widget>[
                Text(
                  "Now you are at",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  "$currentAddress",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ],
            )
          : Column(
              children: <Widget>[
                Text(
                  "Fetching your current location",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
    );
  }
}