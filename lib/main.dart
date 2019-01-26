import 'package:conuhacks/bikePage.dart';
import 'package:conuhacks/billingPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bix-cité',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(title: 'Main Page'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(
                child: Text('View the Map'),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => Text('Not implemented yet')),
                  );
                }),
            new FlatButton(
              child: Text('Take out Bike'),
              onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new BikePage()),
                  );
              }
            ),
            new FlatButton(
              child: Text('View current Bill'),
              onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new BillingPage()),
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}
