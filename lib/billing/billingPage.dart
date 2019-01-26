import 'package:flutter/material.dart';

class BillingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Billing"),
      ),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
          Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("This Months Billing information"))
          ]),
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Total Amount: \$${format(calculatedTotal(_total, _savings))}')),
              Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Actual Amount: \$${format(_total)}')),
              Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Saved Amount: \$${format(_savings)}')),
            new RaisedButton(child: Text('Previous Months'), onPressed: () {}),
          ])
        ]),
      ),
    );
  }

  String format(double n) {
  return n.toStringAsFixed(2);
}

 double calculatedTotal(double totalAmount, double savedAmount){
   return totalAmount-savedAmount;
 }

 double _total = 90.00;
 double _savings = 20.00;
}
