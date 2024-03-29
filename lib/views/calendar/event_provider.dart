import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_progress/views/calendar/event.dart';

class EventProvider extends ChangeNotifier {
  DatabaseReference appointmentRef =
      FirebaseDatabase.instance.ref().child('Appointments');

  final List<Event> _events = [];
  List<Event> get events => _events;
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  void setDate(DateTime date) => _selectedDate = date;
  List<Event> get eventsOfSelectedDate => _events;
  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }
}
