import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';
class LightServices extends StatefulWidget {
  const LightServices({Key? key}) : super(key: key);

  @override
  State<LightServices> createState() => _LightServicesState();
}

class _LightServicesState extends State<LightServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Light Services'),
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
              title: const Text('Brake Light Bulb Replacement'),
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
                  title: const Text('Brake Light Switch Replacement'),
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
                  title: const Text('Combination Switch Assembly Replacement'),
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
                  title: const Text('Console Light Bulb Replacement'),
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
                  title: const Text('Courtesy Light Bulb Replacement'),
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
                  title: const Text('Car Dome Light Bulb Replacement'),
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
                  title: const Text('Fog Light Relay Replacement'),
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
                  title: const Text('Fog/Driving Light Bulb Replacement'),
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
                  title: const Text('Hazard/Turn Signal Flasher Replacement'),
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
                  title: const Text('Headlight Bulb Replacement'),
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
                  title: const Text('Headlight Closure Relay Replacement'),
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
                  title: const Text('Headlight Switch Replacement'),
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
                  title: const Text('License Plate Light Replacement'),
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
                  title: const Text('Reset Indicator Lights'),
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
                  title: const Text('Reverse Light Bulb Replacement'),
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
                  title: const Text('Tail Light Bulb Replacement'),
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
                  title: const Text('Tail Light Lens Replacement'),
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
                  title: const Text('Trunk Light Bulb Replacement'),
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
                  title: const Text('Turn Signal Bulb Replacement'),
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
                  title: const Text('Turn Signal Switch Replacement'),
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
