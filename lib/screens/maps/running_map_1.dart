import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RunningMap1 extends StatefulWidget {
  const RunningMap1({Key? key}) : super(key: key);

  @override
  _RunningMap1State createState() => _RunningMap1State();
}

class _RunningMap1State extends State<RunningMap1> {
  late GoogleMapController mapController;

  final LatLng _start = const LatLng(31.77964361845588, 35.1998435129115);
  final LatLng _finish = const LatLng(31.776538147989513, 35.20701073828802);

  final LatLng placeA = const LatLng(31.774741357855785, 35.20586275281026);

  List<LatLng> path = [
    LatLng(31.774385643995043, 35.205787650956566),
  ];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    var markers = {
      Marker(markerId: MarkerId('start'), position: _start),
      Marker(markerId: MarkerId('finish'), position: _finish),
      Marker(markerId: MarkerId('market'), position: placeA)
    };

    var _polyLines = {
      Polyline(
          polylineId: PolylineId('1'),
          points: [_start, path[0]],
          color: Colors.blueAccent),
      Polyline(
          polylineId: PolylineId('2'),
          points: [path[0], _finish],
          color: Colors.blueAccent),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Ram - Path1'), // TODO better name
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        markers: markers,
        polylines: _polyLines,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _start, zoom: 15.0),
      ),
    );
  }
}
