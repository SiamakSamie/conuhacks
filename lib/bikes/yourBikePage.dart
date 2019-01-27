import 'package:flutter/material.dart';

import 'dart:async';

class YourBikePage extends StatefulWidget {
  final BikeInfo bikeInfo = new BikeInfo(0, 0, 0, 0, 0, 0);
  @override
  State createState() => YourBikePageState();
}

class YourBikePageState extends State<YourBikePage> {
  BikeInfo bikeInfo;

  @override
  void initState() {
    bikeInfo = widget.bikeInfo;
    super.initState();
  }

  @override
  void didUpdateWidget(YourBikePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('swagmuffin ${bikeInfo.gear}');
    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(
        oneSec,
        (Timer t) => setState(() {
              bikeInfo = new BikeInfo(1, 1, 1, 1, 1, 1);
            }));

    print('hello ${bikeInfo.gear}');

    return Scaffold(
      appBar: AppBar(
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
                    Text('Current Gear:  ${bikeInfo.gear}'),
                    Text('Average Gear: ${bikeInfo.avgGear}'),
                    Text('Current Speed: ${bikeInfo.avgSpeed}'),
                    Text('Average Speed: ${bikeInfo.avgSpeed}'),
                    Text('Distance: ${bikeInfo.distance}'),
                    Text('Current Electric Output: ${bikeInfo.output}'),
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

class BikeInfo {
  int gear = 1;
  int avgGear = 2;
  int speed = 3;
  int avgSpeed = 4;
  int distance = 5;
  int output = 6;

  BikeInfo(int gear, int avgGear, int speed, int avgSpeed, int distance,
      int output) {
    this.gear = gear;
    this.avgGear = avgGear;
    this.speed = speed;
    this.avgSpeed = avgSpeed;
    this.distance = distance;
    this.output = output;
  }
}
