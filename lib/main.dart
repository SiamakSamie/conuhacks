import 'package:conuhacks/bikes/bikePage.dart';
import 'package:conuhacks/billing/billingPage.dart';
import 'package:conuhacks/information/infoPage.dart';
import 'package:flutter/material.dart';
import './map/map.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bix-cité',
      theme: ThemeData(primarySwatch: Colors.teal),
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
                child: Material(child: Ink(child: InkWell(
                  child:Image.asset('images/bikee.png', width: 150.0),
                  onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => InfoPage()),
                  );
                })))),

            // BUTTON FOR THE MAP
            Material(
                child: Ink(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green[200], width: 4.0),
                color: Colors.green[100],
                shape: BoxShape.circle,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(1000.0),
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => Map()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.map,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
            new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  'View Map',
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                )),

            //BUTTON TO TAKE OUT BIKE

            Material(
                child: Ink(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green[300], width: 4.0),
                color: Colors.green[200],
                shape: BoxShape.circle,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(1000.0),
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new BikePage()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.directions_bike,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
            new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  'Take Bike',
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                )),

            // BUTTON TO VIEW BILL
            Material(
                child: Ink(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green[400], width: 4.0),
                color: Colors.green[300],
                shape: BoxShape.circle,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(1000.0),
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new BillingPage()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.attach_money,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
            new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  'View Bill',
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                )),
            // ButtonTheme(
            //     minWidth: 200.0,
            //     height: 35.0,
            //     child: new FloatingActionButton(onPressed: () {
            //       Navigator.push(
            //         context,
            //         new MaterialPageRoute(builder: (context) => new FakeBike()),
            //       );
            //     })),
          ],
        ),
      ),
    );
  }
}
