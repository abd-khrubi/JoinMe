import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RunningMapHar extends StatefulWidget {
  const RunningMapHar({Key? key}) : super(key: key);

  @override
  _RunningMapHarState createState() => _RunningMapHarState();
}

class _RunningMapHarState extends State<RunningMapHar> {
  late GoogleMapController mapController;

  final LatLng _start = const LatLng(31.791569716622586, 35.2449198485044);
  final LatLng _finish = const LatLng(31.792939040214605, 35.24470315929009);

  final LatLng placeA = const LatLng(31.793964017699412, 35.24361971312207);

  List<LatLng> path = [
    LatLng(31.793619690593857, 35.24259279457738),
    LatLng(31.794220260291, 35.241537612213314),
    LatLng(31.794940938776616, 35.24267758601735),
  ];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    var markers = {
      Marker(markerId: MarkerId('start'), position: _start, infoWindow: InfoWindow(title: 'start path')),
      Marker(markerId: MarkerId('finish'), position: _finish, infoWindow: InfoWindow(title: 'Finish path')),
      Marker(markerId: MarkerId('market'), position: placeA, infoWindow: InfoWindow(title: 'Maybe consider stopping here'))
    };

    var _polyLines = {
      Polyline(
          polylineId: PolylineId('1'),
          points: [_start, path[0]],
          color: Colors.blueAccent),
      Polyline(
          polylineId: PolylineId('2'),
          points: [path[0], path[1]],
          color: Colors.blueAccent),
      Polyline(
          polylineId: PolylineId('3'),
          points: [path[1], path[2]],
          color: Colors.blueAccent),
      Polyline(
          polylineId: PolylineId('4'),
          points: [path[2], _finish],
          color: Colors.blueAccent),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Har - Path1'), // TODO better name
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        markers: markers,
        polylines: _polyLines,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _start, zoom: 16.2),
      ),
    );
  }
}
