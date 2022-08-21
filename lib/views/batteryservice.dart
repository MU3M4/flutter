import 'package:flutter/material.dart';
import 'package:flutter_progress/views/select_garage.dart';


class BatteryServices extends StatefulWidget {
  const BatteryServices({Key? key}) : super(key: key);

  @override
  State<BatteryServices> createState() => _BatteryServicesState();
}

class _BatteryServicesState extends State<BatteryServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Services'),
        centerTitle: true,
      ),
      
       body: 
        Center(
          child: ListView(
            children: <Widget> [
             Container(
               color: Colors.grey[200],
               padding: const EdgeInsets.all(20),
               child: Card(
                 elevation: 10,
                 child: ListTile(
                   title: const Text('Auxiliary Battery Replacement'),
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
                      title: const Text('Car Battery Cable Replacement'),
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
                      title: const Text('Car Battery Replacement'),
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
                      title: const Text('Service Battery/Cables'),
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
