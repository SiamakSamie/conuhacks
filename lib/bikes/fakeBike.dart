import 'package:flutter/material.dart';
import 'package:conuhacks/db/Database.dart';
import 'package:conuhacks/modals/Bike.dart';

class FakeBike extends StatefulWidget {

  @override
  FakeBikeState createState() {
    return new FakeBikeState();
  }
}

class FakeBikeState extends State<FakeBike> {
  int speed;
  int gear;
  int distance;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => init());
  }
  
void init() {
    print ('Initializing ...');
    var dbHelper = DBHelper();
    // dbHelper.deleteAllBikes();
    
    Future<List<Bike>> bikes = dbHelper.getBikes();

    bikes.then((bikes) {
      for (Bike bike in bikes) {
        print('speeed:' + bike.speed.toString());
        print('gear:' + bike.gear.toString());
        print('distance:' + bike.distance.toString());
      }
      print ("total bikes:" + bikes.length.toString());
    });
}

void _submit() {
     if (this.formKey.currentState.validate()) {
      formKey.currentState.save(); 
     }

    Bike bike = new Bike(
        id: 0,
        speed: speed,
        gear: gear,
        distance: distance,
    );

    var dbHelper = DBHelper();
    dbHelper.addBike(bike);
    _showSnackBar("Data saved successfully");
}

void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Manage Bikes")
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: new Column(
            children: [
              new TextFormField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(labelText: 'Bike Speed'),
                validator: (val) =>
                    val.length == 0 ?"Enter Bike Speed" : null,
                onSaved: (val) => this.speed = int.parse(val),
              ),
              new TextFormField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(labelText: 'Bike Gear'),
                validator: (val) =>
                    val.length ==0 ? 'Enter Bike Gear' : null,
                onSaved: (val) => this.gear = int.parse(val),
              ),
              new TextFormField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(labelText: 'Distance'),
                validator: (val) =>
                    val.length ==0 ? 'Enter Bike Distance' : null,
                onSaved: (val) => this.distance = int.parse(val),
              ),
              new Container(margin: const EdgeInsets.only(top: 10.0),child: new RaisedButton(onPressed: _submit,
                child: new Text('Add Bike'),),)
            ],
          ),
        ),
      ),
    );
  }
}