import 'package:flutter/material.dart';

class BikePage extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bikes"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Select a Bike"),
          FlatButton(
            child: Text('Bike #'),
            onPressed: () {},
          ),
          FlatButton(
            child: Text('Bike #'),
            onPressed: () {},
          ),
        ],
      )),
    );
  }

  final _numberOfBikes = List(4);
}
