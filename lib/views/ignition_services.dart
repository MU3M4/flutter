import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';

class IgnitionServices extends StatefulWidget {
  const IgnitionServices({Key? key}) : super(key: key);

  @override
  State<IgnitionServices> createState() => _IgnitionServicesState();
}

class _IgnitionServicesState extends State<IgnitionServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ignition Services'),
        centerTitle: true,
      ),
      body: Expanded(
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(20),
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Car Door Mirror Replacement'),
                  subtitle: const Text('Long Press for more info'),
                  trailing: const Icon(Icons.add_circle),
                  contentPadding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  dense: true,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SelectGarage()))),
                  onLongPress: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
