

import 'package:flutter/material.dart';

class Event {
  final String eventName;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;
  const Event(
      {required this.eventName,
      required this.from,
      required this.to,
      this.backgroundColor = Colors.lightGreen,
      required this.isAllDay,
      required this.description});
}
