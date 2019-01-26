import 'package:conuhacks/bikes/yourBikePage.dart';
import 'package:flutter/material.dart';

class BikePage extends StatelessWidget {
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
          RaisedButton(
            child: Text('Bike #'),
            onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new YourBikePage()),
                  );
              },
          ),
          RaisedButton(
            child: Text('Bike #'),
            onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new YourBikePage()),
                  );
              },
          ),
        ],
      )),
    );
  }
}
