import 'package:flutter/material.dart';
import 'package:flutter_progress/views/calendar/appointment.dart';

class PossibleProblems extends StatefulWidget {
  const PossibleProblems({Key? key}) : super(key: key);

  @override
  State<PossibleProblems> createState() => _PossibleProblemsState();
}

class _PossibleProblemsState extends State<PossibleProblems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Possible Problems'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          const Text(
            'POSSIBLE PROBLEMS:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Call Mechanic'),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Go to Garage'))
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const AppointmentDetails()),
                ),
              );
            },
            child: const Text('Make an Appointment'),
          ),
        ]),
      ),
    );
  }
}
