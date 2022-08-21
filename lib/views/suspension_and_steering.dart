import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';

class SuspensionSteering extends StatefulWidget {
  const SuspensionSteering({Key? key}) : super(key: key);

  @override
  State<SuspensionSteering> createState() => _SuspensionSteeringState();
}

class _SuspensionSteeringState extends State<SuspensionSteering> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suspension and Steering Services'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(8.0),
                child: Card(
            elevation: 10.0,
                  child: ListTile(
                    title: const Text('Air Shock Replacement'),
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
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10.0,
                  child: ListTile(
                    title: const Text('Air Bag Spring Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Air Springs Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Air Suspension Compressor Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('CV Axle/Shaft Assembly Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Ball Joint Replacement(Front)'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Ball Joint Replacement(Rear)'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Center(Drag) Link Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Control Arm Assembly Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Differential/Gear Oil Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Differential Fluid Service Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Drag Link Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Lateral Link Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Lubricate Ball Joints'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Lubricate Driveshaft'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Lubricate Steering and Suspension'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Lubricate Suspension'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Lubricate U-Joints'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Pitman Arm Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Power Steering Fluid Reservoir Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Power Steering Fluid Service'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Power Steering Input Shaft Seal Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Power Steering Pressure Hose Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Power Steering Pressure Switch Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Power Steering Pump Pulley Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Power Steering Pump Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Shock Absorber Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Stabilizer Bar Bushings Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Stabilizer Bar Links Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Steering Damper Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Steering Rack/Gearbox Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Steering Stabilizer Stop Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Strut Assembly Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Air Bag Suspension Repair'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Suspension Spring Coils Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Sway Bar Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Tie Rod End Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Tighten Wheel Lug Nuts'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Track Bar Replacement Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Universal Joint(U-Joint) Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Wheel Bearings Replacement'),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  title: const Text('Wheel Stud Replacement'),
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
