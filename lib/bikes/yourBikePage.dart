import 'package:flutter/material.dart';
import 'package:conuhacks/db/Database.dart';
import 'dart:async';
import 'package:conuhacks/models/Bike.dart';

class YourBikePage extends StatefulWidget {

  @override
  State createState() => YourBikePageState();
}

class YourBikePageState extends State<YourBikePage> {
  Bike bike;
  final int bikeId = 1;

  @override
  void initState() {
    var db = DBHelper();
    super.initState();
    Future<Bike> bike = db.getBike(bikeId);
    bike.then((b) {
      this.bike = b;
    });
  }

  @override
  void didUpdateWidget(YourBikePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  updateBike() {
    bike.speed++;
    bike.gear++;
    bike.distance++;
  }

  @override
  Widget build(BuildContext context) {
    print('swagmuffin ${bike.gear}');
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
                    Text('Current Gear:  ${bike.gear}'),
                    // Text('Average Gear: ${bike.avgGear}'),
                    // Text('Current Speed: ${bike.avgSpeed}'),
                    // Text('Average Speed: ${bike.avgSpeed}'),
                    Text('Distance: ${bike.distance}'),
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