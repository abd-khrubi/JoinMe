import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RunningMap2 extends StatefulWidget {
  const RunningMap2({Key? key}) : super(key: key);

  @override
  _RunningMap2State createState() => _RunningMap2State();
}

class _RunningMap2State extends State<RunningMap2> {
  late GoogleMapController mapController;

  final LatLng _start = const LatLng(31.779134341267937, 35.19805365512837);
  List<LatLng> path = [
    LatLng(31.779324172899766, 35.19858550561187),
    LatLng(31.775950666678913, 35.20128483809384),
  ];
  final LatLng _finish = const LatLng(31.77551442907632, 35.20294646930094);
  final LatLng _market = const LatLng(31.775701388300774, 35.202188960956526);


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  void _onButtonPressed() {
  }
  @override
  Widget build(BuildContext context) {

    var markers = {
      Marker(markerId: MarkerId('start'), position:_start),
      Marker(markerId: MarkerId('finish'), position:_finish),
      Marker(markerId: MarkerId('market'), position:_market)
    };

    var _polyLines = {
      Polyline(polylineId: PolylineId('1'), points: [_start, path[0]]),
      Polyline(polylineId: PolylineId('2'), points: [path[0], path[1]]),
      Polyline(polylineId: PolylineId('3'), points: [path[1], _finish]),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Gmap'),
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

