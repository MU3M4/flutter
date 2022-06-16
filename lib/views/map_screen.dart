import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(-1.286389, 36.817223),
    zoom: 11.5,
  );
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition targetPosition = CameraPosition(
      target: LatLng(-1.102554, 37.013193),
      zoom: 11.5,
      bearing: 192.0,
      tilt: 60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
        centerTitle: true,
      ),
      body: GoogleMap(
          initialCameraPosition: initialPosition,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          goToJuja();
        },
        label: const Text('go to Juja'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> goToJuja() async {
    final GoogleMapController controller = await _controller.future;
    controller.moveCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}
