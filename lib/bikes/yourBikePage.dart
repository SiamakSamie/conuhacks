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
          Text("Your current statistics"),
          Text('Current Gear: '),
          Text('Current Speed: '),
          Text('Current Electric Output: '),
          Text('Average Gear: '),
          Text('Average Speed: '),
          Text('Average Speed: '),
        ],
      )),
    );
  }
}
