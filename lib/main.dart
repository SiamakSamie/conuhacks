import 'package:conuhacks/bikes/bikePage.dart';
import 'package:conuhacks/billing/billingPage.dart';
import 'package:flutter/material.dart';

import './map/map.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bix-cité',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(title: 'Bix-cité'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Image.asset('images/bikee.jpg', width: 150.0)),
            ButtonTheme(
                minWidth: 200.0,
                height: 35.0,
                child: new RaisedButton(
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    child: Text('View the Map',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => Map()),
                      );
                    })),
            ButtonTheme(
                minWidth: 200.0,
                height: 35.0,
                child: new RaisedButton(
                    child: Text('Take out Bike',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new BikePage()),
                      );
                    })),
            ButtonTheme(
                minWidth: 200.0,
                height: 35.0,
                child: new RaisedButton(
                  child: Text('View current Bill',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new BillingPage()),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
