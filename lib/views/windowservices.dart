import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';
class WindowsServices extends StatefulWidget {
  const WindowsServices({Key? key}) : super(key: key);

  @override
  State<WindowsServices> createState() => _WindowsServicesState();
}

class _WindowsServicesState extends State<WindowsServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Windows Services'),
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
                  title: const Text('Power Window Switch Repair'),
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
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(20),
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Window Motor Regulator Replacement'),
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
        )
      ),
    );
  }
}
