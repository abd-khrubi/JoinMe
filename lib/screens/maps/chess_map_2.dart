import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChessMap2 extends StatefulWidget {
  const ChessMap2({Key? key}) : super(key: key);

  @override
  _ChessMap2State createState() => _ChessMap2State();
}

class _ChessMap2State extends State<ChessMap2> {
  @override
  Widget build(BuildContext context) {
    final LatLng _start = const LatLng(31.777192416149244, 35.19907122118137);
    final LatLng _finish = const LatLng(31.765733485287512, 35.204072159950655);
    late GoogleMapController mapController;
    var markers = {
      Marker(markerId: MarkerId('start'), position: _start),
      Marker(markerId: MarkerId('finish'), position: _finish),
    };

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Mount Scopus - Chess'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        markers: markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _start, zoom: 15.0),
      ),
    );
  }
}
