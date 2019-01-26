import 'package:flutter/material.dart';

class YourBikePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  Text('Current Gear: '),
                  Text('Current Speed: '),
                  Text('Current Electric Output: '),
                  Text('Average Gear: '),
                  Text('Average Speed: '),
                  Text('Average Speed: '),
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
