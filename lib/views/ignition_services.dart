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
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(20),
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Ballast Resistor Replacement'),
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
                  title: const Text('Distributor Cap and Rotor Replacement'),
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
                  title: const Text('Electronic Ignition Pickup Replacement'),
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
                  title: const Text('Ignition Cable (Spark Plug Wires) Replacement'),
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
                  title: const Text('Ignition Coil Replacement'),
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
                  title: const Text('Ignition Ignitor Replacement'),
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
                  title: const Text('Ignition Relay Replacement'),
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
                  title: const Text('Ignition Switch Replacement'),
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
                  title: const Text('Spark Plug Replacement'),
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
