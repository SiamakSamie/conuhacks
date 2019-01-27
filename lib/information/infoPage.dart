import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Our Vision"),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Center(
                        child: Padding(
                            padding: EdgeInsets.all(35.0),
                            child: Text("Bixcité",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)))),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.all(56),
                            decoration: new BoxDecoration(
                              color: Colors.green[300],
                              shape: BoxShape.circle,
                              border: new Border.all(
                                color: Colors.green[400],
                                width: 15,
                              ),
                            ),
                            child: new Center(
                              child: new Text(
                                '''Three SOEN students, passionate about physical activity, sustainability, and IoT.
Our vision is to incentivize individuals to decrease their carbon footprint, live a healthy lifestyle, and feel rewarded for doing so.''',
                                style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child:
                                Image.asset('images/bikee.png', width: 150.0),
                          ),
                        ])
                  ]),
            ),
          ],
        ));
  }
}
