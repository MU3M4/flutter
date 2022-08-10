import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';

class FuelSystemServices extends StatefulWidget {
  const FuelSystemServices({Key? key}) : super(key: key);

  @override
  State<FuelSystemServices> createState() => _FuelSystemServicesState();
}

class _FuelSystemServicesState extends State<FuelSystemServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fuel System Services'),
      centerTitle: true,),
      body: Expanded(
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Carburetor Repair'),
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
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Fuel Filler Cap Replacement'),
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
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Fuel Filler Neck Replacement'),
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
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Fuel Filter Replacement'),
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
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Fuel Gauge Sender Replacement'),
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
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Fuel Injector o Rings Replacement'),
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
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Fuel Injector Replacement'),
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
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Fuel Pressure Regulator Replacement'),
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
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Fuel Pressure Sensor Replacement'),
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
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Fuel Pump Replacement'),
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
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Gas Cap Replacement'),
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
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Injector Control Pressure Sensor Replacement'),
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
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: const Text('Oxygen Sensor Replacement'),
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
