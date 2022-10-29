import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_progress/views/assistant/assistant_methods.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newgoogleMapController;
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(-1.286389, 36.817223), zoom: 14.0);
  Set<Marker> markers = {};
  // List<Marker> _marker = [];
  // List<Marker> _list = const [
  //   Marker(markerId: MarkerId('1'), position: LatLng())
  // ];
  blackThemeGoogleMap() {
    newgoogleMapController!.setMapStyle('''
                    [
                      {
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#242f3e"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#746855"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.text.stroke",
                        "stylers": [
                          {
                            "color": "#242f3e"
                          }
                        ]
                      },
                      {
                        "featureType": "administrative.locality",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "poi",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "poi.park",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#263c3f"
                          }
                        ]
                      },
                      {
                        "featureType": "poi.park",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#6b9a76"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#38414e"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "geometry.stroke",
                        "stylers": [
                          {
                            "color": "#212a37"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#9ca5b3"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#746855"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "geometry.stroke",
                        "stylers": [
                          {
                            "color": "#1f2835"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#f3d19c"
                          }
                        ]
                      },
                      {
                        "featureType": "transit",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#2f3948"
                          }
                        ]
                      },
                      {
                        "featureType": "transit.station",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#17263c"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#515c6d"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "labels.text.stroke",
                        "stylers": [
                          {
                            "color": "#17263c"
                          }
                        ]
                      }
                    ]
                ''');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers:

        markers,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controllerGoogleMap.complete(controller);
          newgoogleMapController = controller;
          blackThemeGoogleMap();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _determinePosition();
          newgoogleMapController?.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));
          markers.clear();
          markers.add(
            Marker(
              markerId: const MarkerId('Current Location'),
              position: LatLng(position.latitude, position.longitude),
              infoWindow: const InfoWindow(
                title: 'My Position',
              ),
            ),
          );
          markers.add(
            const Marker(
              markerId: MarkerId('Mash AutoGarage'),
              position: LatLng(-1.113418, 37.0224462),
              infoWindow: InfoWindow(
                title: 'Mash AutoGarage',
              ),
            ),
          );
          // markers.add(
          //   const Marker(
          //     markerId: MarkerId('Mash AutoGarage'),
          //     position: LatLng(-1.113418, 37.0224462),
          //     infoWindow: InfoWindow(
          //       title: 'Mash AutoGarage',
          //     ),
          //   ),
          // );
          markers.add(
            const Marker(
              markerId: MarkerId('Test Garage'),
              position: LatLng(-1.113418, 37.0224462),
              infoWindow: InfoWindow(
                title: 'Test Garage',
              ),
            ),
          );
          markers.add(
            const Marker(
              markerId: MarkerId('Tester Description'),
              position: LatLng(-1.1132872999999999, 37.0216026),
              infoWindow: InfoWindow(
                title: 'Tester Description',
              ),
            ),
          );

          setState(() {});
        },
        label: const Text('Current Location'),
        icon: const Icon(Icons.location_history),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location Permission denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location Permissions are permanently disabled");
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String address = await AssistantMethods.searchCoordinateAddress(position);
    Fluttertoast.showToast(msg: "This is your Address ::$address");
    return position;
  }
}
