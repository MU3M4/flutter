import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/main.dart';
import 'package:flutter_progress/views/home_screen.dart';

class CarType extends StatefulWidget {
  const CarType({Key? key}) : super(key: key);

  @override
  State<CarType> createState() => _CarTypeState();
}

class _CarTypeState extends State<CarType> {
  final fb = FirebaseDatabase.instance;

  var _yearController = new TextEditingController();
  var _appModelController = new TextEditingController();
  var _numberPlateController = new TextEditingController();
  var _makeController = new TextEditingController();
  var _modelController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final ref = fb.ref().child("car");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Type'),
        centerTitle: true,
      ),
      body:  Column(children: <Widget>[
          Row(
            children: [
              TextFormField(
                controller: _makeController,
                enableSuggestions: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'make',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange),
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              TextFormField(
                controller: _modelController,
                enableSuggestions: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'model',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepOrange),
                    )),
              )
            ],
          ),
          // year textfield
          TextFormField(
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
          //space in between the two fields
          const SizedBox(
            height: 10,
          ),
          //applied model textfield
          TextFormField(
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
          const SizedBox(
            height: 10,
          ),
          //numberplate textfield
          TextFormField(
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
          const SizedBox(
            height: 10,
          ),
          //add car textbutton
          TextButton(
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
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const HomeScreen()),
                  ));
            },
            child: const Text('Continue'),
          ),
        ]),

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
