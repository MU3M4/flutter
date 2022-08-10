import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';

class HeatingAC extends StatefulWidget {
  const HeatingAC({Key? key}) : super(key: key);

  @override
  State<HeatingAC> createState() => _HeatingACState();
}

class _HeatingACState extends State<HeatingAC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heating and AC Services'),
        centerTitle: true,
      ),
      body: Expanded(child: ListView(
        children: <Widget>[
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Car AC Accumulator Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Car AC Clutch Cycling Switch Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Car AC Compressor Relay Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Car AC Compressor Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Car AC Condenser Fan Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('AC Condenser Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Car AC Control Switch Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Car AC High Pressure Hose Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('AC High Pressure Switch Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Car AC Low Pressure Hose Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('AC Cycling Switch Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Car AC Receiver Dryer Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Car AC Repair'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('AC is not working properly'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Blower Motor Relay Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Blower Motor Switch Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Condenser Fan Relay Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Expansion Valve(Orifice Tube) Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Car Heater Blower Motor Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Car Heater Blower Motor Resistor Replacement'),
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
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: const Text('Car Heater Control Valve Replacement'),
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
      )),
    );
  }
}
