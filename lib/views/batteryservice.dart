import 'package:flutter/material.dart';


class BatteryServices extends StatefulWidget {
  const BatteryServices({Key? key}) : super(key: key);

  @override
  State<BatteryServices> createState() => _BatteryServicesState();
}

class _BatteryServicesState extends State<BatteryServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Services'),
        centerTitle: true,
      ),
      
       body: 
        Expanded(
          child: ListView(
            children: [
             
            ]
          ),
        ),
    );
  }
}
