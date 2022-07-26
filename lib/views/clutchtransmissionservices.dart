import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ClutchTransmissionServices extends StatefulWidget {
  const ClutchTransmissionServices({Key? key}) : super(key: key);

  @override
  State<ClutchTransmissionServices> createState() =>
      _ClutchTransmissionServicesState();
}

class _ClutchTransmissionServicesState
    extends State<ClutchTransmissionServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clutch and Transmission Services'),
        centerTitle: true,
      ),
      body: Expanded(
          child: ListView(
            children: [
              
            ]
          ),
        ),
      
    );
  }
}
