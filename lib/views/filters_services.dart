import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';

class FilterServices extends StatefulWidget {
  const FilterServices({Key? key}) : super(key: key);

  @override
  State<FilterServices> createState() => _FilterServicesState();
}

class _FilterServicesState extends State<FilterServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Services'),
        centerTitle: true,
      ),
      body: Expanded(
        child: ListView(
          children: <Widget>[
        Container(
        color: Colors.grey[200],
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: const Text('Car AC Air Filter Replacement'),
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
                title: const Text('Car Air Filter Replacement'),
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
                title: const Text('Cabin Air Filter Replacement'),
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
      ],
        ),
      ),
    );
  }
}
