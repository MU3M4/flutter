import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/batteryservice.dart';
import 'package:flutter_progress/views/brakeservices.dart';
import 'package:flutter_progress/views/clutchtransmissionservices.dart';
import 'package:flutter_progress/views/engineservices.dart';
import 'package:flutter_progress/views/exhaustservices.dart';
import 'package:flutter_progress/views/fuel_system.dart';
import 'package:flutter_progress/views/lights_services.dart';
import 'package:flutter_progress/views/navigation_drawer.dart';
import 'package:flutter_progress/views/select_garage.dart';
import 'package:flutter_progress/views/sensors.dart';
import 'package:flutter_progress/views/suspension_and_steering.dart';
import 'package:flutter_progress/views/tyre_services.dart';
import 'package:flutter_progress/views/windowservices.dart';
import 'package:flutter_progress/views/wiperservices.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'door.dart';
import 'filters_services.dart';
import 'fluids_services.dart';
import 'heating_and_ac.dart';
import 'hoses_services.dart';
import 'ignition_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool _iconBool = false;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;
ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.orange,
  brightness: Brightness.light,
  backgroundColor: Colors.white,
);
ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
  backgroundColor: Colors.black,
);
final fb = FirebaseDatabase.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class _HomeScreenState extends State<HomeScreen> {
  
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    TextEditingController _text = TextEditingController();
    final ref = fb.ref().child('Attausers');
    void insertData(String text) {
    ref.child('appointments').set({
      'message': _text,
    
    });
    _text.clear();
    
  }
    return MaterialApp(
      theme: _iconBool ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {
                  _iconBool = !_iconBool;
                });
              },
              icon: Icon(_iconBool ? _iconDark : _iconLight),
              color: Colors.black,
              tooltip: "Theme",
            )
          ],
        ),
        drawer: NavigationDrawer(),
        body: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Center(
                child: Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // ignore: avoid_unnecessary_containers
              const SizedBox(
                height: 10,
              ),
              // ignore: prefer_const_constructors
              Center(
                child: const Text(
                  'Car Problem Description',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _text,
                  minLines: 2,
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: 'Enter your car problem description',
                    hintStyle: TextStyle(color: Colors.deepOrange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    if (_text.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg:
                              'Please input your car problem description to proceed');
                    } else {
                      Fluttertoast.showToast(msg: 'Message Successfully sent');
                       insertData(_text.text, );
                       Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const SelectGarage())));
                      // try {
                      //   User user = FirebaseAuth.instance.currentUser!;
                      //   ref.child(user.uid).set({
                      //     'message': _text,
                      //   });
                      // } catch (e) {
                      //   Fluttertoast.showToast(msg: 'Something went wrong');
                      // }
                    

                     
                    }
                  },
                  child: const Text('Get Mechanic'))
            ]),
            
      ),
      
    );
    
  }
   
  
}
