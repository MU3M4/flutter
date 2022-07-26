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
                title: const Text('Brake pedal is hard to push'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.arrow_forward_ios),
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
                title: const Text('Brake pedal is spongy'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.arrow_forward_ios),
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
                title: const Text('Brake pedal vibrates or shakes'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.arrow_forward_ios),
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
                title: const Text('Brake pedal is hard to push'),
                subtitle: const Text('Long press for more info'),
                trailing: const Icon(Icons.arrow_forward_ios),
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
