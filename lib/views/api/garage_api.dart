import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/garage.dart';

class GaragesApi {
  static Future<List<Garage>> getGarages() async {
    final url =
        'https://console.firebase.google.com/project/atta-web-app-a5135/database/atta-web-app-a5135-default-rtdb/data/~2FGarages';
   
    final response = await http.get(
      Uri.parse(url),
    );
     log('response: ${response.body}');
   final body = json.decode(response.body);
    return body.map<Garage>(Garage.fromJson).toList();
  }

  static Future<List<Garage>> getGaragesLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('lib/assets/garages.json');
    final body = json.decode(data);
    return body.map<Garage>(Garage.fromJson).toList();
  }
}
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

