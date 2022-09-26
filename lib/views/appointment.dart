import 'package:flutter/material.dart';
import 'package:flutter_progress/event.dart';
import 'package:flutter_progress/views/appointment_history.dart';
import 'package:flutter_progress/views/search.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({Key? key}) : super(key: key);

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  final TextEditingController _appointmentController = TextEditingController();
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  void initState() {
    selectedEvents = {};

    super.initState();
  }

  @override
  void dispose() {
    _appointmentController.dispose();
    super.dispose();
  }

  List<Event> _getEventsFromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Calendar'),
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
      body: Column()
    );
  }
}
