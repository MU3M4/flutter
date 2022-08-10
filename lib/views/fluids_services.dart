import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';

class FluidServices extends StatefulWidget {
  const FluidServices({Key? key}) : super(key: key);

  @override
  State<FluidServices> createState() => _FluidServicesState();
}

class _FluidServicesState extends State<FluidServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fluids Services'),
        centerTitle: true,
      ),
      body: Expanded(
        child: ListView(
          children: <Widget>[
        Container(
        color: Colors.grey[200],
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: const Text('Brake System Flush'),
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
                title: const Text('Oil Change'),
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
                title: const Text('Clutch Fluid Replacement'),
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
                title: const Text('Cooling System Flush'),
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
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const Text('Radiator Flush'),
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
                title: const Text('Transfer Case Fluid Replacement'),
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
                title: const Text('Transmission Fluid Service'),
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
        ],
      ),
      ),
    );
  }
}
