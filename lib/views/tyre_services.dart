import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';

class TyreServices extends StatefulWidget {
  const TyreServices({Key? key}) : super(key: key);

  @override
  State<TyreServices> createState() => _TyreServicesState();
}

class _TyreServicesState extends State<TyreServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tyre Services'
        ),
        centerTitle: true,
      ),
      body: Expanded(child: ListView(
        children: <Widget>[
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(20),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Tyre Rotation'),
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
                title: const Text('Spare Tyre Installation'),
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
      ),),
    );
  }
}
