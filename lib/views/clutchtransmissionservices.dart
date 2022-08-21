import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_progress/views/select_garage.dart';

class ClutchTransmissionServices extends StatefulWidget {
  const ClutchTransmissionServices({Key? key}) : super(key: key);

  @override
  State<ClutchTransmissionServices> createState() =>
      _ClutchTransmissionServicesState();
}

class _ClutchTransmissionServicesState
    extends State<ClutchTransmissionServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clutch and Transmission Services'),
        centerTitle: true,
      ),
      body: Center(
          child: ListView(
            children: [
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Axle Shaft Seal Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Center Support Bearing Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Clutch Cable Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Clutch Master & Slave Cylinder Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Clutch Safety Switch Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Differential Gasket Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Differential Output Seal Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Flexible Clutch Hose Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Shift Interlock Solenoid Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Shift Selector Cable Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Shifter Interlock Solenoid Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Gearbox Speed Sensor Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Speedometer Cable Repair'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Speedometer Cable and Housing Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Transmission Oil Pressure Switch Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Transmission Position Sensor/Switch Replacement'),
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
                    )
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Transmission Speed Sensor Replacement'),
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
                    )
                ),
              ),
            ]
          ),
        ),
      
    );
  }
}
