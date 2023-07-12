import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:http/http.dart' as http;
import 'location_service.dart';


class LocationController extends GetxController {
  final Placemark _pickPlaceMark = Placemark();
  Placemark get pickPlaceMark => _pickPlaceMark;
  List<Prediction> _predictionList = [];

  Future<List<Prediction>> searchLocation(
      BuildContext context, String text) async {
    if (text.isNotEmpty) {
      http.Response response = await getLocationData(text);
      var data = jsonDecode(response.body.toString());
      print("my status is" + data['status']);
      if (data['status'] == 'OK') {
        _predictionList = [];
        data['predictions'].forEach((prediction) =>
            _predictionList.add(Prediction.fromJson(prediction)));
      } else {
        //ApiChecker.checkApi(response);
      }
    }
    return _predictionList;
  }
}
