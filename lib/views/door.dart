import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';

class DoorServices extends StatefulWidget {
  const DoorServices({Key? key}) : super(key: key);

  @override
  State<DoorServices> createState() => _DoorServicesState();
}

class _DoorServicesState extends State<DoorServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Door Services'),
        centerTitle: true,
      ),
      body: Expanded(
        child: ListView(
         children: <Widget>[
           Container(
             color: Colors.grey[200],
             padding: const EdgeInsets.all(8.0),
             child: ListTile(
               title: const Text('Car Door Latch Replacement'),
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
               title: const Text('Car Door Lock Actuator Replacement'),
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
               title: const Text('Car Door Lock Relay Replacement'),
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
               title: const Text('Car Door Lock Switch Replacement'),
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
               title: const Text('Exterior Car Door Handle Replacement'),
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
               title: const Text('Hood Latch Replacement'),
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
               title: const Text('Hood Lift Support Shock Replacement'),
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
               title: const Text('Interior Car Door Handle Replacement'),
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
               title: const Text('Lubricate Doors'),
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
               title: const Text('Lubricate Hood Hinge'),
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
               title: const Text('Lubricate Trunk'),
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
               title: const Text('Trunk Latch Adjustment'),
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
               title: const Text('Trunk Latch Release Cable Replacement'),
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
               title: const Text('Trunk Latch Replacement'),
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
               title: const Text('Trunk Lift Support Shocks Replacement'),
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
               title: const Text('Trunk Lock Actuator Replacement'),
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
