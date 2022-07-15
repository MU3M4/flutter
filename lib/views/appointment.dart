import 'package:flutter/material.dart';
import 'package:flutter_progress/views/appointment_history.dart';
import 'package:flutter_progress/views/current_location.dart';
import 'package:flutter_progress/views/garage.dart';
import 'package:flutter_progress/views/search.dart';
import 'package:firebase_database/firebase_database.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({Key? key}) : super(key: key);

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  // ignore: prefer_final_fields
  DatabaseReference ref = FirebaseDatabase.instance.ref("garagedets");
  // List<Garage> _aGarages = List<Garage>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book An Appointment'),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const MyAppointments())));
            }),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => SearchScreen())));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      // List<Garage> _getAttaGarages(){
      //   List<Garage> _aGarages = List<Garage>();
      //   _aGarages.add(Garage(garageName: "Max Auto", image: "", ratings: 5.0, specialty "Brakes", location: "Juja"));
      //   return _aGarages;
      // },
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.calendar_view_month),
                onPressed: () {},
                label: const Text('date'),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.access_alarm),
                onPressed: () {},
                label: const Text('time'),
              )
            ],
          ),
          Row(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.garage),
                onPressed: () {},
                label: const Text('visit garage'),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const CurrentLocation())));
                },
                label: const Text('Home Visit'),
              )
            ],
          ),
         const TextField(
            decoration: InputDecoration(
              hintText: 'Enter Location',
              prefixIcon: Icon(Icons.gps_fixed),
              suffixIcon: Icon(Icons.edit),
            ),
          ),
          ElevatedButton(onPressed:(){}, child: const Text('Confirm'))
        ],
      ),
    );
  }
}
