// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
import 'package:calendar_view/calendar_view.dart';
import 'package:provider/provider.dart';

class MainCalendar extends StatefulWidget {
  final double? width;
  final double? height;

  MainCalendar({this.height, this.width, super.key});

  @override
  State<MainCalendar> createState() => _MainCalendarState();
}

class _MainCalendarState extends State<MainCalendar> {
  final EventController controller = EventController();

  Future fetchEvents() async {
    // Replace with your actual database fetching logic
    await Future.delayed(
        const Duration(seconds: 1)); // Simulating network delay

    controller.addAll(_events);
    // return _events; // Return your list of events
  }

  @override
  Widget build(BuildContext context) {
    final calendarData = Provider.of<CalendarData>(context);
    return FutureBuilder(
        future: fetchEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading spinner while the data is loading
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            );
          }

          if (snapshot.hasError) {
            // Handle errors, maybe show an error message
            return const Center(
                child: Text('Error loading events. Add Retry Button'));
          }

          return CalendarControllerProvider(
              controller: controller,
              child: calendarData.calendarView == CalendarView.day
                  ? CalendarDayView()
                  : CalendarMonthView());
        });
  }
}

enum CalendarView { day, month }

class CalendarDay {
  final Color color;
  final DateTime date;
  final bool isSelected;

  CalendarDay(
      {required this.color, required this.date, required this.isSelected});
}

class CalendarWeek {
  final List<CalendarDay> days;

  CalendarWeek(this.days);
}

class CalendarDayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calendarData = Provider.of<CalendarData>(context);
    final controller =
        CalendarControllerProvider.of<EventController>(context).controller;
    final events = controller.getEventsOnDay(calendarData.selectedDay);
    return Column(
      children: [
        const Text('Day View')
        // CalendarHeader(),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: events.length,
        //     itemBuilder: (context, index) {
        //       final event = events[index];
        //       return ListTile(
        //         title: Text(event.title),
        //         subtitle: Text(event.description),
        //         trailing: Text(
        //             "${event.startTime.format(context)} - ${event.endTime.format(context)}"),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}

class CalendarMonthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calendarData = Provider.of<CalendarData>(context);
    final controller =
        CalendarControllerProvider.of<EventController>(context).controller;
    final events = controller.getEventsOnDay(calendarData.selectedDay);
    return Column(
      children: [
        const Text('Month View')
        // CalendarHeader(),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: events.length,
        //     itemBuilder: (context, index) {
        //       final event = events[index];
        //       return ListTile(
        //         title: Text(event.title),
        //         subtitle: Text(event.description),
        //         trailing: Text(
        //             "${event.startTime.format(context)} - ${event.endTime.format(context)}"),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}

class CalendarData with ChangeNotifier {
  final List<CalendarEventData<Event>> _events = [];
  DateTime _selectedDay = DateTime.now().withoutTime;
  CalendarView _calendarView = CalendarView.day;
  final List<CalendarWeek> _weeks = [];

  CalendarData() {
    _initializeWeeks();
  }

  get calendarView => _calendarView;
  get events => [..._events];
  get selectedDay => _selectedDay;
  get today => DateTime.now().withoutTime;
  get weeks => [..._weeks];

  void addEvent(CalendarEventData<Event> event) {
    _events.add(event);
    notifyListeners();
  }

  void removeEvent(CalendarEventData<Event> event) {
    _events.remove(event);
    notifyListeners();
  }

  void selectDay(DateTime day) {
    _selectedDay = day.withoutTime;
    notifyListeners();
  }

  void selectView(CalendarView view) {
    _calendarView = view;
    notifyListeners();
  }

  void _initializeWeeks() {
    _weeks.clear();
    DateTime startOfWeek = _findStartOfWeek(_selectedDay);
    _weeks.add(_createWeek(
        startOfWeek.subtract(const Duration(days: 7)))); // Previous week
    _weeks.add(_createWeek(startOfWeek)); // Current week
    _weeks.add(
        _createWeek(startOfWeek.add(const Duration(days: 7)))); // Next week
    notifyListeners();
  }

  DateTime _findStartOfWeek(DateTime date) {
    // Assuming the week starts on Sunday (change this according to your needs)
    int daysToSubtract = date.weekday % 7;
    return date.subtract(Duration(days: daysToSubtract));
  }

  CalendarWeek _createWeek(DateTime startOfWeek) {
    List<CalendarDay> weekDays = [];
    for (int i = 0; i < 7; i++) {
      final date = startOfWeek.add(Duration(days: i));
      weekDays.add(CalendarDay(
        date: date,
        color: date.withoutTime == today ? Colors.red : Colors.black,
        isSelected: date.withoutTime == selectedDay,
      ));
    }
    return CalendarWeek(weekDays);
  }
}

class Event {
  final String id;

  const Event({required this.id});
}

DateTime get _now => DateTime.now();

final List<CalendarEventData<Event>> _events = [
  CalendarEventData(
    date: _now,
    event: const Event(id: "Joe's Birthday"),
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 22),
  ),
  CalendarEventData(
    date: _now.add(const Duration(days: 1)),
    startTime: DateTime(_now.year, _now.month, _now.day, 18),
    endTime: DateTime(_now.year, _now.month, _now.day, 19),
    event: const Event(id: "Wedding anniversary"),
    title: "Wedding anniversary",
    description: "Attend uncle's wedding anniversary.",
  ),
  CalendarEventData(
    date: _now,
    startTime: DateTime(_now.year, _now.month, _now.day, 14),
    endTime: DateTime(_now.year, _now.month, _now.day, 17),
    event: const Event(id: "Football Tournament"),
    title: "Football Tournament",
    description: "Go to football tournament.",
    color: Colors.purple.shade100,
    titleStyle: TextStyle(color: Colors.purple.shade900),
    descriptionStyle: TextStyle(color: Colors.purple.shade700),
  ),
  CalendarEventData(
    date: _now,
    startTime: DateTime(_now.year, _now.month, _now.day, 14),
    endTime: DateTime(_now.year, _now.month, _now.day, 17),
    event: const Event(id: "Baseball Tournament"),
    title: "Baseball Tournament",
    description: "Go to baseball tournament.",
    color: Colors.blue.shade100,
    titleStyle: TextStyle(color: Colors.blue.shade900),
    descriptionStyle: TextStyle(color: Colors.blue.shade700),
  ),
  CalendarEventData(
    date: _now.add(const Duration(days: 3)),
    startTime: DateTime(
        _now.add(const Duration(days: 3)).year,
        _now.add(const Duration(days: 3)).month,
        _now.add(const Duration(days: 3)).day,
        10),
    endTime: DateTime(
        _now.add(const Duration(days: 3)).year,
        _now.add(const Duration(days: 3)).month,
        _now.add(const Duration(days: 3)).day,
        14),
    event: const Event(id: "Sprint Meeting."),
    title: "Sprint Meeting.",
    description: "Last day of project submission for last year.",
  ),
  CalendarEventData(
    date: _now.subtract(const Duration(days: 2)),
    startTime: DateTime(
        _now.subtract(const Duration(days: 2)).year,
        _now.subtract(const Duration(days: 2)).month,
        _now.subtract(const Duration(days: 2)).day,
        14),
    endTime: DateTime(
        _now.subtract(const Duration(days: 2)).year,
        _now.subtract(const Duration(days: 2)).month,
        _now.subtract(const Duration(days: 2)).day,
        16),
    event: const Event(id: "Team Meeting"),
    title: "Team Meeting",
    description: "Team Meeting",
  ),
  CalendarEventData(
    date: _now.subtract(const Duration(days: 2)),
    startTime: DateTime(
        _now.subtract(const Duration(days: 2)).year,
        _now.subtract(const Duration(days: 2)).month,
        _now.subtract(const Duration(days: 2)).day,
        10),
    endTime: DateTime(
        _now.subtract(const Duration(days: 2)).year,
        _now.subtract(const Duration(days: 2)).month,
        _now.subtract(const Duration(days: 2)).day,
        12),
    event: const Event(id: "Chemistry Viva"),
    title: "Chemistry Viva",
    description: "Today is Joe's birthday.",
  ),
];
