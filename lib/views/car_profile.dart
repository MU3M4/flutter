import 'package:flutter/material.dart';
import 'package:flutter_progress/views/car_type.dart';

class CarProfile extends StatefulWidget {
  const CarProfile({Key? key}) : super(key: key);

  @override
  State<CarProfile> createState() => _CarProfileState();
}

class _CarProfileState extends State<CarProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Profile'),
        centerTitle: true,
      ),
    );
  }
}
