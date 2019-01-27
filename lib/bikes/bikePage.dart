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
  bool isLoading = false;
  var location = new Location();
  Map<String, double> userLocation;
  var oneSec = const Duration(seconds: 1);
  var fiveSec = const Duration(seconds: 5);

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
    if (isLoading && isInLocation) {
      return [new CircularProgressIndicator()];
    } else if (isInLocation) {
      return [
        Center(
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'You are in range of the Concordia Station, Select Your Bike',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              )),
        ),
        ButtonTheme(
            minWidth: 200.0,
            height: 35.0,
            child: RaisedButton(
              child:
                  Text('Unlock Bike #1', style: TextStyle(color: Colors.white)),
              onPressed: () {
                new Timer.periodic(
                    oneSec,
                    (Timer t) => setState(() {
                          isLoading = true;
                          _buildChild();
                        }));
                delay();
              },
            )),
        ButtonTheme(
            minWidth: 200.0,
            height: 35.0,
            child: RaisedButton(
              child:
                  Text('Unlock Bike #2', style: TextStyle(color: Colors.white)),
              onPressed: () {
                new Timer.periodic(
                    oneSec,
                    (Timer t) => setState(() {
                          isLoading = true;
                          _buildChild();
                        }));
                delay();
              },
            )),
        ButtonTheme(
            minWidth: 200.0,
            height: 35.0,
            child: RaisedButton(
              child:
                  Text('Unlock Bike #3', style: TextStyle(color: Colors.white)),
              onPressed: () {
                new Timer.periodic(
                    oneSec,
                    (Timer t) => setState(() {
                          isLoading = true;
                          _buildChild();
                        }));
                delay();
              },
            )),
        ButtonTheme(
            buttonColor: Colors.grey,
            minWidth: 200.0,
            height: 35.0,
            child: RaisedButton(
              child: Text('Bike #4 unnavailable',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {},
            )),
        ButtonTheme(
            buttonColor: Colors.grey,
            minWidth: 200.0,
            height: 35.0,
            child: RaisedButton(
              child: Text('Bike #5 unnavailable',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {},
            )),
        ButtonTheme(
            buttonColor: Colors.grey,
            minWidth: 200.0,
            height: 35.0,
            child: RaisedButton(
              child: Text('Bike #6 unnavailable',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {},
            )),
        ButtonTheme(
            buttonColor: Colors.grey,
            minWidth: 200.0,
            height: 35.0,
            child: RaisedButton(
              child: Text('Bike #7 unnavailable',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {},
            )),
        ButtonTheme(
            buttonColor: Colors.grey,
            minWidth: 200.0,
            height: 35.0,
            child: RaisedButton(
              child: Text('Bike #8 unnavailable',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {},
            )),
      ];
    } else {
      return [Text("You aren't in the proximity of any Bikes.")];
    }
  }

  Future delay() async {
    await new Future.delayed(Duration(milliseconds: 2000), () {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
                title: new Text(
                  "Bike Unlocked!",
                  textAlign: TextAlign.center,
                ),
                content: Wrap(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.lock_open, size: 68.0)),
                  ],
                ),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new FlatButton(
                      child: new Text("Continue"),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new YourBikePage()),
                        );
                      }),
                ]);
          });
    });
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
