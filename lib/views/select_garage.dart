import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/possible_problems.dart';

class SelectGarage extends StatefulWidget {
  const SelectGarage({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectGarage> createState() => _SelectGarageState();
}

class _SelectGarageState extends State<SelectGarage> {
  final dRef = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    // final ref = _database.ref();
    final ref = dRef.ref().child('GarageInfo/MechanicDetails');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Text(
            'Here is the list of garages:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: FirebaseAnimatedList(
                query: ref,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return Container(
                      color: Colors.grey[200],
                      padding: const EdgeInsets.all(20),
                      child: Card(
                          elevation: 10.0,
                          child: ListTile(
                            title: Text(snapshot.value.toString()),

                            contentPadding: const EdgeInsets.all(20),
                            dense: true,
                            trailing: const Icon(Icons.arrow_forward_ios),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const PossibleProblems())));
                            },
                          )));
                }),
          ),
        ],
      ),
    );
  }
}
