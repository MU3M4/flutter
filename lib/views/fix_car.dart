import 'package:flutter/material.dart';
import 'package:flutter_progress/constants/routes.dart';

class FixCar extends StatefulWidget {
  const FixCar({Key? key}) : super(key: key);

  @override
  State<FixCar> createState() => _FixCarState();
}

class _FixCarState extends State<FixCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fix Car'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: const Text('Call Mechanic'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(garageRoute, (route) => false);
              },
              child: const Text('Go to Garage')),
        ],
      ),
    );
  }
}
