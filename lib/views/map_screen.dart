import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_progress/views/location_controller.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/src/details/details_result.dart';
import 'package:trust_location/trust_location.dart';

import 'map_utils.dart';
//import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

class MapScreen extends StatefulWidget {
  final DetailsResult? startPosition;
  final DetailsResult? endPosition;
  const MapScreen({Key? key, this.endPosition, this.startPosition})
      : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String? latitude;
  String? longitude;
  bool? isMock;
  late CameraPosition _initialPosition;
  final Completer<GoogleMapController> _controller = Completer();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  @override
  void initState() {
    requestPermission();
    super.initState();
    _initialPosition = CameraPosition(
      target: LatLng(widget.startPosition!.geometry!.location!.lat!,
          widget.startPosition!.geometry!.location!.lng!),
      zoom: 14.5,
    );
  }

  void requestPermission() async {
    final permission = await Permission.location.request();
    if (permission == PermissionStatus.granted) {
      TrustLocation.start(10);
      getLocation();
    } else if (permission == PermissionStatus.denied) {
      await Permission.location.request();
    }
  }

  void getLocation() async {
    try {
      TrustLocation.onChange.listen((result) {
        setState(() {
          latitude = result.latitude;
          longitude = result.longitude;
          isMock = result.isMockLocation;
        });
      });
    } catch (e) {
      print('error');
    }
  }

  _addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 1);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyAH89SmA9RnEzXN7TiwCpe2UNXccmOuZfg',
        PointLatLng(widget.startPosition!.geometry!.location!.lat!,
            widget.startPosition!.geometry!.location!.lng!),
        PointLatLng(widget.endPosition!.geometry!.location!.lat!,
            widget.endPosition!.geometry!.location!.lng!),
        travelMode: TravelMode.driving);
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> markers = {
      Marker(
        markerId: const MarkerId('start'),
        position: LatLng(widget.startPosition!.geometry!.location!.lat!,
            widget.startPosition!.geometry!.location!.lng!),
      ),
      Marker(
        markerId: const MarkerId('end'),
        position: LatLng(widget.endPosition!.geometry!.location!.lat!,
            widget.endPosition!.geometry!.location!.lng!),
      ),
    };
    return GetBuilder<LocationController>(builder: (LocationController) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Colors.black,
            )),
        body: Stack(children: [
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: constraints.maxHeight / 2,
              child: GoogleMap(
                polylines: Set<Polyline>.of(polylines.values),
                initialCameraPosition: _initialPosition,
                markers: Set.from(markers),
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  Future.delayed(const Duration(milliseconds: 2000), () {
                    controller.animateCamera(CameraUpdate.newLatLngBounds(
                        MapUtils.boundsFromLatLngList(
                            markers.map((loc) => loc.position).toList()),
                        1));
                    _getPolyline();
                  });
                },
              ),
            );
          }),
          DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  color: Colors.white,
                );
              }),
          Positioned(
              top: 100,
              left: 10,
              right: 20,
              child: GestureDetector(
                  onTap: (() {}),
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Icon(Icons.location_on,
                            size: 25, color: Theme.of(context).primaryColor),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            '${LocationController.pickPlaceMark.name ?? ''}${LocationController.pickPlaceMark.locality ?? ''}'
                            '${LocationController.pickPlaceMark.postalCode ?? ''}${LocationController.pickPlaceMark.country ?? ''}',
                            style: const TextStyle(fontSize: 20),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(Icons.search,
                            size: 25,
                            color:
                                Theme.of(context).textTheme.bodyLarge!.color),
                      ],
                    ),
                  ))),
        ]),
      );
    });
  }
}
