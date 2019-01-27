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
          ButtonTheme(
                minWidth: 200.0,
                height: 35.0,
                child: RaisedButton(
            child: Text('Bike #', style: TextStyle(color: Colors.white)),
            onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new YourBikePage()),
                  );
              },
          )),
          ButtonTheme(
                minWidth: 200.0,
                height: 35.0,
                child:  RaisedButton(
            child: Text('Bike #', style: TextStyle(color: Colors.white)),
            onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new YourBikePage()),
                  );
              },
          ),)
        ],
      )),
    );
  }
}
