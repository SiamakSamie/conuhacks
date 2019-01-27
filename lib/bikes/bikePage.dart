import 'package:conuhacks/bikes/yourBikePage.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'dart:async';

class BikePage extends StatefulWidget {
  @override
  State createState() => BikeState();
}

class BikeState extends State<BikePage> {
  bool isInLocation;
  var location = new Location();
  Map<String, double> userLocation;
  var oneSec = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bikes"),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildChild())),
    );
  }

  List<Widget> _buildChild() {
    if (isInLocation) {
      return [
        Text("Select a Bike"),
        ButtonTheme(
            minWidth: 200.0,
            height: 35.0,
            child: RaisedButton(
              child: Text('Bike #', style: TextStyle(color: Colors.white)),
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: new Text("Success"),
                          content: new Text("Bike # Unlocked"),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                                child: new Text("Continue"),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            new YourBikePage()),
                                  );
                                }),
                          ]);
                    });
              },
            )),
        ButtonTheme(
            minWidth: 200.0,
            height: 35.0,
            child: RaisedButton(
              child: Text('Bike #', style: TextStyle(color: Colors.white)),
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: new Text("Success"),
                          content: new Text("Bike # Unlocked"),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                                child: new Text("Continue"),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            new YourBikePage()),
                                  );
                                }),
                          ]);
                    });
              },
            )),
      ];
    } else {
      return [Text("You aren't in the proximity of any Bikes.")];
    }
  }

  Future<Map<String, double>> _getLocation() async {
    var currentLocation = <String, double>{};
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  @override
  initState() {
    super.initState();

    setState(() {
      isInLocation = true; //_getLocation() == null;
    });
  }
}
