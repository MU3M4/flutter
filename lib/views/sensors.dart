import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';

class SensorsServices extends StatefulWidget {
  const SensorsServices({Key? key}) : super(key: key);

  @override
  State<SensorsServices> createState() => _SensorsServicesState();
}

class _SensorsServicesState extends State<SensorsServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Sensor Services'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(children: <Widget>[
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('ABS Speed Sensor Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('ABS Speed Sensor Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Air Charge Temperature Sensor Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Air Cleaner Temperature Sensor Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Camshaft Position Sensor Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Coolant Level Sensor Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Crankshaft Position Sensor Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Instrument Voltage Regulator Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Intermittent Wiper Relay Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Manifold Temperature Sensor Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Mass Airflow Sensor Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Oil Temperature Sensor Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Speedometer Sensor Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Throttle Position Sensor(TPS) Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Throttle/Accelerator Pedal Position Sensor Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Top Dead Center(TDC) Sensor Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Wheel Speed Sensor Replacement'),
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
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('Yaw Rate Sensor Replacement'),
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
        ]
        ),
      ),
    );
  }
}
