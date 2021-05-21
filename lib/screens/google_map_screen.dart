import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  final LatLng _other = const LatLng(45.5210343, -122.6775448);

  Set<Marker> markers = {
    Marker(position: LatLng(45.521563, -122.677433), markerId: MarkerId('1')),
    // center
    Marker(markerId: MarkerId('2'), position: LatLng(45.5210343, -122.6775448))
  };

  Set<Polyline> _polyLines = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    // _polyLines.add(Polyline(polylineId: PolylineId('a'), points: [_center, _other]));

    return Scaffold(
      appBar: AppBar(
        title: Text('Gmap'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        markers: markers,
        polylines: _polyLines,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onButtonPressed,
      ),
    );
  }

  void _onButtonPressed() {}
}
