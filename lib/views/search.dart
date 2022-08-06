import 'dart:async';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:dio/dio.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:search_map_location/utils/google_search/place.dart';
import 'package:search_map_location/widget/search_widget.dart';
import 'package:search_map_location/search_map_location.dart';

class SearchScreen extends StatefulWidget {
  // SearchScreen(
  //   {Key? key,  required })
  //     : super(key: key);
  // final DetailsResult? startPosition;
  // final DetailsResult? endPosition;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

const kGoogleApiKey = 'AIzaSyAH89SmA9RnEzXN7TiwCpe2UNXccmOuZfg';
final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _SearchScreenState extends State<SearchScreen> {
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(-1.286389, 36.817223), zoom: 14.0);
  Set<Marker> markersList = {};
  late GoogleMapController googleMapController;
  final Mode _mode = Mode.overlay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        elevation: 0,
      ),
      body: Stack(children: [
        GoogleMap(
          initialCameraPosition: initialCameraPosition,
          markers: markersList,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
          },
        ),
        // SearchLocation(
        //   apiKey: kGoogleApiKey,
        //   onSelected: (Place place) {
        //     print(place.description);
        //   },
        // ),
        ElevatedButton(
          onPressed: _handlePressButton,
          child: const Text('Search Garages'),
        ),
      ]),
    );
  }

  Future<void> _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: [""],
        decoration: InputDecoration(
            // ignore: prefer_const_constructors
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.white))),
        components: [new Component(Component.country, "")]);

    displayPrediction(p!, homeScaffoldKey.currentState);
  }

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState!
        .showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  }

  Future<void> displayPrediction(
      Prediction p, ScaffoldState? currentState) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    markersList.clear();
    markersList.add(Marker(
        markerId: const MarkerId("0"),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: detail.result.name)));

    setState(() {});

    googleMapController
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
  }
}