import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Leaderboard"),
      ),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
          Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("This month's Leaderboard", style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: Table(border: TableBorder.all(width: 2, color: Colors.green[300]),
              children: [
            TableRow(
              children: [
                TableCell(
                  child: Text("UserName", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("Savings", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("Average Gear", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("Average Speed", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                ),
              ]
            ),
            TableRow(
              children: [
                TableCell(
                  child: Text("Siamak Samie", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("\$15.50", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("3", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("27", textAlign: TextAlign.center,)
                ),
              ]
            ),
            TableRow(
              children: [
                TableCell(
                  child: Text("MC Mario", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("\$14.15", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("3", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("23", textAlign: TextAlign.center,)
                ),
              ]
            ),TableRow(
              children: [
                TableCell(
                  child: Text("R Kelly", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("\$13.50", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("5", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("15", textAlign: TextAlign.center,)
                ),
              ]
            ),
            TableRow(
              children: [
                TableCell(
                  child: Text("Roy Khoury", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("\$11.50", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("2.5", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("27", textAlign: TextAlign.center,)
                ),
              ]
            ),TableRow(
              children: [
                TableCell(
                  child: Text("N.Champagne", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("\$10.50", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("4", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("15", textAlign: TextAlign.center,)
                ),
              ]
            ),
            TableRow(
              children: [
                TableCell(
                  child: Text("James Franco", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("\$9.50", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("2.5", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("22", textAlign: TextAlign.center,)
                ),
              ]
            ),TableRow(
              children: [
                TableCell(
                  child: Text("P. Diddy", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("\$7.50", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("2", textAlign: TextAlign.center,)
                ),
                TableCell(
                  child: Text("20", textAlign: TextAlign.center,)
                ),
              ]
            )]
            ))
            ]),
      ]),
      ),
    );
  }
}