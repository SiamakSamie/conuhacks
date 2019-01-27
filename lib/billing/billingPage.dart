import 'package:conuhacks/billing/previousBillsPage.dart';
import 'package:flutter/material.dart';

class BillingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Billing Information"),
      ),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
          Center(
              child: Padding(
                  padding: EdgeInsets.all(35.0),
                  child: Text("Jan 26, 2019 - Feb 26, 2019"))),
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
                  '\$${format(calculatedTotal(_total, _savings))}',
                  style: new TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(20.0), child: Text('Total Amount')),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Actual Amount: \$${format(_total)}')),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Saved Amount: \$${format(_savings)}')),
            ButtonTheme(
              minWidth: 200.0,
              height: 35.0,
              child: new RaisedButton(
                  child: Text('Previous Months',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => PreviousBillsPage()),
                    );
                  }),
            )
          ])
        ]),
      ),
    );
  }

  String format(double n) {
    return n.toStringAsFixed(2);
  }

  double calculatedTotal(double totalAmount, double savedAmount) {
    return totalAmount - savedAmount;
  }

  final double _total = 55.00;
  final double _savings = 15.50;
}
