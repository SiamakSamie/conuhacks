import 'package:flutter/material.dart';
import 'package:conuhacks/db/Database.dart';
import 'dart:async';
import 'package:conuhacks/models/Bike.dart';
import 'package:location/location.dart';

class YourBikePage extends StatefulWidget {
  @override
  State createState() => YourBikePageState();
}

class YourBikePageState extends State<YourBikePage> {
  final int bikeId = 1;
  Bike bike;
  var location = new Location();
  Map<String, double> userLocation;
  final _fiveSec = Duration(seconds: 1);

  double x;
  double y;

  @override
  void initState() {
    var db = DBHelper();
    super.initState();

    Future<List<Bike>> bike = db.getBike(bikeId);
    bike.then((b) {
      this.bike = b[0]; // since the id is unique, there will only be one entry
    }).whenComplete(() {
      updateBike();
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void didUpdateWidget(YourBikePage oldWidget) {
    super.didUpdateWidget(oldWidget);
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

  updateBike() {
    var myLocation = _getLocation();
    if (this.bike != null) {
      // this.bike.speed++;
      // this.bike.gear++;
      this.bike.distance++;
      new Timer.periodic(_fiveSec, (Timer t) {
        myLocation
        .whenComplete(() {
          print(myLocation.toString());
        });
    });}
  }

  @override
  Widget build(BuildContext context) {
    const oneSec = const Duration(seconds: 1);

    new Timer.periodic(
        oneSec,
        (Timer t) => setState(() {
              updateBike();
            }));

    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
              Navigator.pop(context, true);
            }),
        title: Text("Bike #"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Your current statistics")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        'Current Gear:  ${this.bike != null ? this.bike.gear : 0}'),
                    // Text('Average Gear: ${bike.avgGear}'),
                    Text(
                        'Current Speed: ${this.bike != null ? this.bike.speed : 0}'),
                    // Text('Average Speed: ${bike.avgSpeed}'),
                    Text(
                        'Distance: ${this.bike != null ? this.bike.distance : 0}'),
                    Text('Current X pos: ${this.x}'),
                    Text('Current Y pos: ${this.y}')
                    // Text('Current Electric Output: ${bike.output}'),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
