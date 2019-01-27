import 'package:conuhacks/billing/emptyBillsPage.dart';
import 'package:flutter/material.dart';

class PreviousBillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Previous Bills"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                 ButtonTheme(
                  minWidth: 200.0,
                  height: 35.0,
                  child: new RaisedButton(
                      child: Text('"Dec 26, 2018 - Jan 26, 2019"',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => EmptyBillsPage()),
                    );
                  }),
                ),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 35.0,
                  child: new RaisedButton(
                      child: Text('"Nov 26, 2018 - Dec 26, 2018"',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => EmptyBillsPage()),
                    );
                  }),
                ),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 35.0,
                  child: new RaisedButton(
                      child: Text('"Oct 26, 2018 - Nov 26, 2018"',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => EmptyBillsPage()),
                    );
                  }),
                ),
            ]),
      ),
    );
  }
}
