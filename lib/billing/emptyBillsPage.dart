import 'package:flutter/material.dart';

class EmptyBillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Billing Information"),
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: Padding(
                      padding: EdgeInsets.all(35.0),
                      child: Text("Date: n/a in System"))),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
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
                          '\$${format(0.00)}',
                          style: new TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ]),
      ),
    );
  }

  String format(double n) {
    return n.toStringAsFixed(2);
  }
}
