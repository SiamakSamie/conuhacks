import 'package:flutter/material.dart';

class BikePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Bikes"),
      ),
      body: new Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Select a Bike"),
          new FlatButton(child: Text('Bike #'), onPressed: () {}),
          new FlatButton(
            child: Text('Bike #'),
            onPressed: () {},
          ),
          new FlatButton(
            child: Text('Bike #'),
            onPressed: () {},
          ),
          new FlatButton(
            child: Text('Bike #'),
            onPressed: () {},
          ),
          new FlatButton(
            child: Text('Bike #'),
            onPressed: () {},
          ),
        ],
      )),
    );
  }
}
