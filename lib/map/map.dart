import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Map extends StatefulWidget {
  @override
  State createState() => MapState();
}

class MapState extends State<Map> {
  GoogleMapController mapController;

  static Location position = new Location();

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

    mapController.addMarker(
      MarkerOptions(
        position: LatLng(37.4219999, -122.0862462),
        infoWindowText:
            InfoWindowText("Station Angrignon", "Bikes available 3/10"),
      ),
    );
  }
}
