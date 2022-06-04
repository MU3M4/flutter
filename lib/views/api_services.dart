import 'dart:convert';

import 'package:flutter_progress/views/garage_details.dart';
import 'package:http/http.dart' as http;

class FetchGarage {
  var data = [];
  List<GarageDetail> results = [];
  String fetchurl =
      "https://console.firebase.google.com/project/atta-9029d/database/atta-9029d-default-rtdb/data/~2F";
  Future<List<GarageDetail>>getGarageList() async {
    var url = Uri.parse(fetchurl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => GarageDetail.fromJson(e)).toList();
      } else {
        print('api error');
      }
    } on Exception catch (e) {
      print('error $e');
    }
    return results;
  }
}
