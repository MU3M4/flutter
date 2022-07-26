import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

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
    final ref = dRef.ref().child('garagedets');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Flexible(
            child: FirebaseAnimatedList(
                query: ref,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return ListTile(
                  title: Text(snapshot.value.toString()),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
