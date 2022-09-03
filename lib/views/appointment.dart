import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/appointment_history.dart';
import 'package:flutter_progress/views/current_location.dart';
import 'package:flutter_progress/views/search.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({Key? key}) : super(key: key);

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
 DatabaseReference ref = FirebaseDatabase.instance.ref();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  // ignore: prefer_final_fields
  DateTime date = DateTime(2022, 07, 21);
  TimeOfDay time = const TimeOfDay(hour: 10, minute: 30);
  // List<Garage> _aGarages = List<Garage>();
  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return Scaffold(
      // backgroundColor: Colors.grey[200],
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('${date.year}/${date.month}/${date.day}',
            //     style: const TextStyle(fontSize: 32)),
            // const SizedBox(height: 10),
            // ElevatedButton(
            //   child: const Text('Select Appointment Date'),
            //   onPressed: () async {
            //     DateTime? newDate = await showDatePicker(
            //       context: context,
            //       initialDate: date,
            //       firstDate: DateTime(1900),
            //       lastDate: DateTime(2100),
            //     );
            //     // if 'Cancel  => null
            //     if (newDate == null) return;
            //     //if 'OK' => DateTime
            //     setState(() => date = newDate);
            //   },
            // ),
            // const SizedBox(height: 10,),
            // Text(
            //   '$hours: $minutes',
            //   style: const TextStyle(fontSize: 32),
            // ),
            // ElevatedButton(
            //   child: const Text('Select Appointment Time'),
            //   onPressed: () async {
            //     TimeOfDay? newTime =
            //         await showTimePicker(context: context, initialTime: time);
            //     // if 'Cancel  => null
            //     if (newTime == null) return;
            //     //if 'OK' => DateTime
            //     setState(() => time = newTime);
            //   },
            // ),
            TextFormField(
              controller: _timeController,
              decoration: const InputDecoration(
                hintText: 'Set Your appointment Time',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _dateController,
              decoration: const InputDecoration(
                hintText: 'Set Your Appointment Date',
                labelText: 'DD/MM/YYYY',
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Visit Garage')),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const CurrentLocation())));
              },
              child: const Text(
                'Home Visit',
              ),
            ),
            const SizedBox(height: 10),

            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter Location',
                prefixIcon: Icon(Icons.gps_fixed),
                suffixIcon: Icon(Icons.edit),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_timeController.text.isNotEmpty &&
                      _dateController.text.isNotEmpty) {
                    insertData(_timeController.text, _dateController.text);
                  }
                },
                child: const Text('Confirm'))
          ],
        ),
      ),
    );
  }

  void insertData(String time, String date) {
    ref.child('appointments').set({
      'time': time,
      'date': date,
    });
    _timeController.clear();
    _dateController.clear();
  }
}
