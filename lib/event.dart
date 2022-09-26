import 'package:flutter/foundation.dart';

class Event {
  final String title;
  Event({required this.title, required DateTime from, required DateTime to, required String description, required bool isAllDay});
  String toString() => this.title;

}
