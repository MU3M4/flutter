import 'package:flutter/material.dart';

class MyAppointments extends StatefulWidget {
  const MyAppointments({Key? key}) : super(key: key);

  @override
  State<MyAppointments> createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Appointment History"),
      )
    );
  }
}
