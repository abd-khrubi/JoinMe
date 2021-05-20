import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// class GoogleMapScreen extends St {
//   final UserService userSrv = locator<UserService>();
//   @override
//   Widget build(BuildContext context) {
//     print(userSrv.getCachedUser().toString());
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('wow'),
//       ),
//       body: Text(''),
//     );
//   }
// }

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gmap'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onButtonPressed,
      ),
    );
  }

  void _onButtonPressed() {
  }
}
