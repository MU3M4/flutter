import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';

class MirrorServices extends StatefulWidget {
  const MirrorServices({Key? key}) : super(key: key);

  @override
  State<MirrorServices> createState() => _MirrorServicesState();
}

class _MirrorServicesState extends State<MirrorServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mirror Services'),
        centerTitle: true,
      ),
      body: Center(
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
