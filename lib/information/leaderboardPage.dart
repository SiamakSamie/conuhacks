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
              Text("This month's Leaderboard"),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
                  child: Table(border: TableBorder.all(width: 1, color: Colors.black),
              children: [
            TableRow(
              children: [
                TableCell(
                  child: Text("UserName")
                ),
                TableCell(
                  child: Text("Savings")
                ),
                TableCell(
                  child: Text("Average Gear")
                ),
                TableCell(
                  child: Text("Average Speed")
                ),
              ]
            ),
            TableRow(
              children: [
                TableCell(
                  child: Text("Siamak Samie")
                ),
                TableCell(
                  child: Text("\$1.25")
                ),
                TableCell(
                  child: Text("3")
                ),
                TableCell(
                  child: Text("25")
                ),
              ]
            ),TableRow(
              children: [
                TableCell(
                  child: Text("Roy Khoury")
                ),
                TableCell(
                  child: Text("\$1.15")
                ),
                TableCell(
                  child: Text("2.5")
                ),
                TableCell(
                  child: Text("27")
                ),
              ]
            ),TableRow(
              children: [
                TableCell(
                  child: Text("Nicolas Brodeur-Champagne")
                ),
                TableCell(
                  child: Text("\$1.05")
                ),
                TableCell(
                  child: Text("4")
                ),
                TableCell(
                  child: Text("15")
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