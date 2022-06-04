import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/api_services.dart';
import 'package:flutter_progress/views/garage_details.dart';

import 'package:flutter_progress/views/search_widget.dart';

class SelectGarage extends StatefulWidget {
  const SelectGarage({Key? key}) : super(key: key);

  @override
  State<SelectGarage> createState() => _SelectGarageState();
}

class _SelectGarageState extends State<SelectGarage>
    with SingleTickerProviderStateMixin {
  late List<_SelectGarageState> garages;
  String query = '';
  late AnimationController _controller;
  FetchGarage _garage = FetchGarage();
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(vsync: this);
  //   // garages = allGarages;
  // }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Garage'),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
        ),
        body: Container(
          child: FutureBuilder<List<GarageDetail>>(
              future: _garage.getGarageList(),
              builder: (context, snapshot) {
                var data = snapshot.data;
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            title: Row(
                          children: <Widget>[
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  '${data?[index].adminDetails}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          const SizedBox(width: 10),
                            Column(
                              children: [
                                Text('${data?[index].garageDetails}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('${data?[index].mechanicsDetails}'),
                                Text('${data?[index].garageDetails}'),
                              ],
                            )
                          ],
                        )),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
