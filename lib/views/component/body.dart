import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_progress/views/api/garage_api.dart';
import 'package:flutter_progress/views/message.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_progress/views/model/garage.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Garage> _garage = [];
  Future<List<Garage>> fetchJson() async {
    var response = await http.get(Uri.parse(
        'https://console.firebase.google.com/project/atta-web-app-a5135/database/atta-web-app-a5135-default-rtdb/data/~2FGarages'));
    List<Garage> ulist = [];
    if (response.statusCode == 200) {
      var urjson = json.decode(response.body);
      for (var jsondata in urjson) {
        ulist.add(Garage.fromJson(jsondata));
      }
    }
    return ulist;
  }

  @override
  void initState() {
    fetchJson().then((value) {
      setState(() {
        _garage.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(itemBuilder: (context, index) {
      return Card(child: Column(children: [
        Text(_garage[index].garageName.toString())
      ],));
    }));
  }

  Widget buildGarages(List<Garage>? garages) => ListView.builder(
        itemBuilder: (context, index) {
          final garage = garages![index];
          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const MessageCenter())));
            },
            title: const Text('garage.garageName'),
            subtitle: const Text('garage.officeNumber'),
          );
        },
        physics: const BouncingScrollPhysics(),
        itemCount: garages?.length,
      );
}
