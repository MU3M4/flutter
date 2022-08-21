import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarType extends StatefulWidget {
  const CarType({Key? key}) : super(key: key);

  @override
  State<CarType> createState() => _CarTypeState();
}

class _CarTypeState extends State<CarType> {
  final fb = FirebaseDatabase.instance;
  var selectedCar;
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _appModelController = TextEditingController();
  final TextEditingController _numberPlateController = TextEditingController();
  final TextEditingController _makeController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final GlobalKey<FormState> _formKeyValue = GlobalKey<FormState>();

  @override
  void dispose() {
    _yearController.dispose();
    _appModelController.dispose();
    _numberPlateController.dispose();
    _makeController.dispose();
    _modelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final ref = fb.ref().child("car");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Type'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        key: _formKeyValue,
        // autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('cars').snapshots(),
              builder: (context, snapshot)
              {
                if (!snapshot.hasData) {
                  return const Text("Loading");
                } else {
                  List<DropdownMenuItem> carItems = [];
                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    DocumentSnapshot snap = snapshot.data!.docs[i];
                    carItems.add(
                      DropdownMenuItem(
                        value: "${snap.id}",
                        child: Text(
                          snap.id,
                          style: const TextStyle(color: Colors.deepOrange),
                        ),
                      ),
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.car_repair,
                        size: 25.0,
                      ),
                      const SizedBox(
                        width: 50.0,
                      ),
                      DropdownButton<dynamic>(
                        items: carItems,
                        onChanged: (carValue) {
                          final snackBar = SnackBar(
                            content: Text(
                              'Selected Car is $carValue',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                          setState(() {
                            selectedCar = carValue;
                          });
                        },
                        value: selectedCar,
                        isExpanded: false,
                        hint: const Text(
                          "Choose Car Make",
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextFormField(
            //     controller: _makeController,
            //     enableSuggestions: false,
            //     keyboardType: TextInputType.text,
            //     decoration: InputDecoration(
            //         hintText: 'make',
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10),
            //           borderSide: const BorderSide(color: Colors.deepOrange),
            //         )),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _modelController,
                enableSuggestions: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'model',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange),
                    )),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            // year textfield
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _yearController,
                enableSuggestions: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Year',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.orange),
                  ),
                ),
              ),
            ),
            //space in between the two fields
            const SizedBox(
              height: 10,
            ),
            //applied model textfield
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _appModelController,
                enableSuggestions: false,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Applied Model',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.deepOrange),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //numberplate textfield
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _numberPlateController,
                enableSuggestions: false,
                decoration: InputDecoration(
                  hintText: 'Number Plate',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.deepOrange),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //add car textbutton
            ElevatedButton(
              onPressed: () {
                if (_yearController.text.isNotEmpty &&
                    _appModelController.text.isNotEmpty &&
                    _numberPlateController.text.isNotEmpty &&
                    _modelController.text.isNotEmpty &&
                    _makeController.text.isNotEmpty) {
                  insertData(
                      _yearController.text,
                      _appModelController.text,
                      _numberPlateController.text,
                      _modelController.text,
                      _makeController.text);
                }
              },
              child: const Text('ADD CAR'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const HomeScreen()),
                    ));
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  void insertData(String year, String appmodel, String numberplate,
      String model, String make) {
    fb.ref().child("car").push().set({
      "year": year,
      "appmodel": appmodel,
      "numberplate": numberplate,
      "model": model,
      "make": make,
    });
    _yearController.clear();
    _appModelController.clear();
    _makeController.clear();
    _numberPlateController.clear();
    _modelController.clear();
  }
}
