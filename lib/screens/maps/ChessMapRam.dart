import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChessMapRam extends StatefulWidget {
  const ChessMapRam({Key? key}) : super(key: key);

  @override
  _ChessMapRamState createState() => _ChessMapRamState();
}

class _ChessMapRamState extends State<ChessMapRam> {
  late GoogleMapController mapController;

  final LatLng _start = const LatLng(31.777192416149244, 35.19907122118137);
  final LatLng _finish = const LatLng(31.765733485287512, 35.204072159950655);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    var markers = {
      Marker(markerId: MarkerId('start'), position: _start),
      Marker(markerId: MarkerId('finish'), position: _finish),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('ram - chess'), // TODO better name
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        markers: markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
            target: LatLng(31.77146295071838, 35.20157169056601), zoom: 15.0),
      ),
    );
  }
}
