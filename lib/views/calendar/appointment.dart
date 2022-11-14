import 'package:flutter/material.dart';
import 'package:flutter_progress/views/calendar/event_data_source.dart';
import 'package:flutter_progress/views/calendar/event_editing_page.dart';
import 'package:flutter_progress/views/calendar/event_provider.dart';
import 'package:flutter_progress/views/calendar/tasks_widget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({Key? key}) : super(key: key);

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  @override
  void initState() {
    super.initState();
  }

  CalendarView calendarView = CalendarView.month;
  final CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    calendarView = CalendarView.month;
                    _controller.view = calendarView;
                  });
                },
                child: const Text('Month View'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    calendarView = CalendarView.week;
                    _controller.view = calendarView;
                  });
                },
                child: const Text('Week View'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    calendarView = CalendarView.day;
                    _controller.view = calendarView;
                  });
                },
                child: const Text('Day View'),
              ),
            ],
          ),
          Expanded(
            child: SfCalendar(
              view: calendarView,
              controller: _controller,
              initialSelectedDate: DateTime.now(),
              firstDayOfWeek: 1,
              headerHeight: 0,
              todayHighlightColor: Colors.black,
              onLongPress: (details) {
                final provider =
                    Provider.of<EventProvider>(context, listen: false);
                provider.setDate(details.date!);
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const TasksWidget());
              },
              dataSource: EventDataSource(events),
              selectionDecoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.red, width: 2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
                shape: BoxShape.rectangle,
              ),
              monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                  showAgenda: true),
              cellBorderColor: Colors.transparent,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: ((context) => const EventEditingPage())),
              ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
