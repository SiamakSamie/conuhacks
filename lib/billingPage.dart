import 'package:flutter/material.dart';

class BillingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Billing"),
      ),
      body: new Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("This months Billing information:"),
          new FlatButton(
            child: Text('Last Month'), 
            onPressed: () {}
          ),
          new FlatButton(
            child: Text('LastLast Month'), 
            onPressed: () {}
          ),
          new FlatButton(
            child: Text('LastLastLast Month'), 
            onPressed: () {}
          ),
        ],
      )),
    );
  }
}
