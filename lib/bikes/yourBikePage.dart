import 'package:flutter/material.dart';
import 'package:conuhacks/db/Database.dart';
import 'dart:async';
import 'package:conuhacks/models/Bike.dart';
import 'package:location/location.dart';
import 'package:sensors/sensors.dart';

class YourBikePage extends StatefulWidget {
  @override
  State createState() => YourBikePageState();
}

class YourBikePageState extends State<YourBikePage> {
  final int bikeId = 1;
  Bike bike;
  var location = new Location();
  Map<String, double> userLocation;

  double x;
  double y;

  @override
  void initState() {
    var db = DBHelper();
    super.initState();

    accelerometerEvents.listen((AccelerometerEvent event) {
       this.x = event.x.roundToDouble();
       this.y = event.y.roundToDouble();
       updateBike();
    });

    Future<List<Bike>> bike = db.getBike(bikeId);
    bike.then((b) {
      this.bike = b[0]; // since the id is unique, there will only be one entry
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
    setState(() {
    if (this.bike != null) {
      this.bike.distance = this.bike.distance + this.x.abs();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.all(28.0),
                  child: Text("Your current statistics")),
            ],
          ),
          //FIRST STATISTIC
          new Center(
            child: new Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: new BoxDecoration(
                    color: Colors.green[300],
                    shape: BoxShape.circle,
                    border: new Border.all(
                      color: Colors.green[400],
                      width: 2,
                    ),
                  ),
                  child: new Center(
                    child: new Text(
                      '${this.bike != null ? this.bike.gear : 0}',
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                new Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: new Text(
                      'Current Gear:',
                      style: new TextStyle(
                        fontSize: 20.0,
                      ),
                    )),
              ],
            ),
          ),

          //SECOND STATISTIC
          new Center(
            child: new Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: new BoxDecoration(
                    color: Colors.green[300],
                    shape: BoxShape.circle,
                    border: new Border.all(
                      color: Colors.green[400],
                      width: 2,
                    ),
                  ),
                  child: new Center(
                    child: new Text(
                      '${this.bike != null ? this.bike.speed : 0}',
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                new Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: new Text(
                      'Current Speed:',
                      style: new TextStyle(
                        fontSize: 20.0,
                      ),
                    )),
              ],
            ),
          ),

          //THIRD STATISTIC
          new Center(
            child: new Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: new BoxDecoration(
                    color: Colors.green[300],
                    shape: BoxShape.circle,
                    border: new Border.all(
                      color: Colors.green[400],
                      width: 2,
                    ),
                  ),
                  child: new Center(
                    child: new Text(
                      '${this.bike != null ? this.bike.distance.toInt() : 0}',
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                new Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: new Text(
                      'Distance:',
                      style: new TextStyle(
                        fontSize: 20.0,
                      ),
                    )),
              ],
            ),
          ),

          //FOURTH STATISTIC
          new Center(
            child: new Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: new BoxDecoration(
                    color: Colors.green[300],
                    shape: BoxShape.circle,
                    border: new Border.all(
                      color: Colors.green[400],
                      width: 2,
                    ),
                  ),
                  child: new Center(
                    child: new Text(
                      '${this.x != null && this.y != null ? this.x + this.y : 0}',
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                new Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: new Text(
                      'Current Lat/Long:',
                      style: new TextStyle(
                        fontSize: 20.0,
                      ),
                    )),
              ],
            ),
          ),

          //FIFTH STATISTIC
          new Center(
            child: new Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: new BoxDecoration(
                    color: Colors.green[300],
                    shape: BoxShape.circle,
                    border: new Border.all(
                      color: Colors.green[400],
                      width: 2,
                    ),
                  ),
                  child: new Center(
                    child: new Text(
                      '${this.bike != null ? this.bike.distance.toInt() * bike.gear : 0}',
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                new Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: new Text(
                      'Electric Output:',
                      style: new TextStyle(
                        fontSize: 20.0,
                      ),
                    )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
