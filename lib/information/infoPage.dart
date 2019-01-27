import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Our Vision"),
      ),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
          Center(
              child: Padding(
                  padding: EdgeInsets.all(35.0),
                  child: Text("Bixcité"))),
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            new Container(
              padding: EdgeInsets.all(60),
              decoration: new BoxDecoration(
                color: Colors.green[300],
                shape: BoxShape.circle,
                border: new Border.all(
                  color: Colors.green[400],
                  width: 10,
                ),
              ),
              child: new Center(
                child: new Text(
                  '''We are a group of software engineering students, passionate about physical activity, sustainability, and especially creativity.
                  Our companies vision is to provide an incentive for individuals to decrease their carbon footprint, live a healthy lifestyle, and feel rewarded for doing so.''',
                  style: new TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ])
        ]),
      ),
    );
  }
}