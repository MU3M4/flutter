import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';

class BrakeServices extends StatefulWidget {
  const BrakeServices({Key? key}) : super(key: key);

  @override
  State<BrakeServices> createState() => _BrakeServicesState();
}

class _BrakeServicesState extends State<BrakeServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brake Services'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(20),
        child: ListView(children: <Widget>[
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(20),
            child: Card(
              elevation: 10.0,
              child: ListTile(
                title: const Text('ABS Speed Sensor Replacement'),
                subtitle: const Text('Long press for more info'),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Anti-lock Control Relay Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Anti-lock fuse or Relay Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Brake Caliper Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Brake Drum Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Brake Hose Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Brake Master Cylinder Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Brake Pad Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Brake Rotors/Disc Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Brake Shoe Replacement (Rear)'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Brake System Flush'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Brake Vacuum Pump Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Brake Wheel Cylinder Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Emergency/Parking Brake Cable Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Emergency/Parking Brake Shoe Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Emergency Brake Control Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Parking Brake Release Cable Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Vacuum Brake Booster Check Valve Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Vacuum Pump Repair'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Wheel Hub Assembly Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
              elevation: 10.0,
              child: ListTile(
                title: const Text('Wheel Speed Sensor Replacement'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.add_circle),
                contentPadding: const EdgeInsets.all(20),
                dense: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SelectGarage()))),
                onLongPress: () {},
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
