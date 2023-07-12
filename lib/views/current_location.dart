import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_progress/views/assistant/assistant_methods.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_directions_api/google_directions_api.dart';
import 'locationservice.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  Set<Polyline> _polyline = Set<Polyline>();

  GoogleMapController? newgoogleMapController;
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(-1.286389, 36.817223), zoom: 14.0);
  Set<Marker> markers = {};
  int _polyLineIdCounter = 1;
  // List<Marker> _marker = [];
  // List<Marker> _list = const [
  //   Marker(markerId: MarkerId('1'), position: LatLng())
  // ];
  void setPolyline(List<PointLatLng> points) {
    final String polylineIdVal = 'polyline_$_polyLineIdCounter';
    _polyLineIdCounter++;
    _polyline.add(
      Polyline(
          polylineId: PolylineId(
            polylineIdVal,
          ),
          width: 2,
          color: Colors.blue,
          points: points
              .map(
                (point) => LatLng(point.latitude, point.longitude),
              )
              .toList()),
    );
  }

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
      body: Column(children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  TextFormField(
                    controller: _originController,
                    decoration: const InputDecoration(hintText: 'origin'),
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  TextFormField(
                    controller: _destinationController,
                    decoration: const InputDecoration(hintText: 'destination'),
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () async {
                var directions = await LocationService().getDirections(
                    _originController.text, _destinationController.text);
                _goToPlace(directions['start_location']['lat'],
                    directions['start_location']['lng']);
                setPolyline(directions['polyline_decoded']);
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        Expanded(
          child: GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: markers,
            polylines: _polyline,
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newgoogleMapController = controller;
              blackThemeGoogleMap();
            },
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _determinePosition();
          newgoogleMapController?.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14),
            ),
          );
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
            Marker(
              markerId: const MarkerId('Mash AutoGarage'),
              position: const LatLng(-1.113418, 37.0224462),
              infoWindow: const InfoWindow(
                title: 'Mash AutoGarage',
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange),
            ),
          );

          markers.add(
            Marker(
              markerId: const MarkerId('Test Garage'),
              position: const LatLng(-1.113418, 37.0224462),
              infoWindow: const InfoWindow(
                title: 'Test Garage',
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange),
            ),
          );
          markers.add(
            Marker(
              markerId: const MarkerId('Tester Description'),
              position: const LatLng(-1.1132872999999999, 37.0216026),
              infoWindow: const InfoWindow(
                title: 'Tester Description',
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange),
            ),
          );

          setState(() {});
        },
        label: const Text(''),
        icon: const Icon(Icons.location_history),
      ),
    );
  }

  Future<void> _goToPlace(double lat, double lng) async {
    final GoogleMapController controller = await _controllerGoogleMap.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 12,
        ),
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
