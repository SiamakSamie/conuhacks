import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:conuhacks/db/Database.dart';
import 'package:conuhacks/models/Station.dart';

class Map extends StatefulWidget {
  @override
  State createState() => MapState();
}

class MapState extends State<Map> {
  GoogleMapController mapController;

  final LatLng _conu = const LatLng(45.495293, -73.579064);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bike Locations'),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          trackCameraPosition: true,
          initialCameraPosition: CameraPosition(
            target: _conu,
            zoom: 11.0,
          ),
        ));
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });

    var db = DBHelper();
    Future<List<Station>> futureStation = db.getStations();

    futureStation.then((stations) {
        for (Station station in stations) {
          mapController.addMarker(
                MarkerOptions(
                  position: LatLng(station.lat, station.long),
                  infoWindowText:
                      InfoWindowText(station.name, "Bikes available " + station.availableBikes.toString() + "/" + station.totalBikes.toString())
                ),
              );
          }
    });
  }
}
