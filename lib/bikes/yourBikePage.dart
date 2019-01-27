import 'package:flutter/material.dart';
import 'package:conuhacks/db/Database.dart';
import 'dart:async';
import 'package:conuhacks/models/Bike.dart';
import 'package:sensors/sensors.dart';

class YourBikePage extends StatefulWidget {

  @override
  State createState() => YourBikePageState();
}

class YourBikePageState extends State<YourBikePage> {
  final int bikeId = 1;
  Bike bike;

  double x;
  double y;

  @override
  void initState() {
    var db = DBHelper();
    super.initState();

    initSensors();

    Future<List<Bike>> bike = db.getBike(bikeId);
    bike.then((b) {
      this.bike = b[0]; // since the id is unique, there will only be one entry
    })
    .catchError((e) {
      print (e);
    });


  }

  @override
  void didUpdateWidget(YourBikePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  initSensors() {
      accelerometerEvents.listen((onData) {
        this.x = onData.x.toDouble();
        this.y = onData.y.toDouble();
      });
  }

  updateBike() {
    // initSensors();
    if (this.bike != null) {
      this.bike.speed++;
      this.bike.gear++;
      this.bike.distance++;
    }
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
          onPressed: (){Navigator.pop(context,true);
                        Navigator.pop(context,true);}),
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
                    Text('Current Gear:  ${bike != null ? bike.gear : 0}'),
                    // Text('Average Gear: ${bike.avgGear}'),
                    Text('Current Speed: ${bike != null ? bike.speed : 0}'),
                    // Text('Average Speed: ${bike.avgSpeed}'),
                    Text('Distance: ${bike != null ? bike.distance : 0}'),
                    Text('Current X pos: ${x}'),
                    Text('Current Y pos: ${y}')
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