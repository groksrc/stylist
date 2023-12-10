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

import 'package:calendar_view/calendar_view.dart';

DateTime get _now => DateTime.now();

class Event {
  // final String id;
  final String title;
  // final DateTime start;
  // final DateTime end;
  // final String description;
  // final Color color;

  Event({
    // required this.id,
    required this.title,
    // required this.start,
    // required this.end,
    // this.description = '',
    // this.color = Colors.blue,
  });
}

class MyCalendarWidget extends StatefulWidget {
  MyCalendarWidget({this.width, this.height, super.key});

  final double? width;
  final double? height;

  @override
  _MyCalendarWidgetState createState() => _MyCalendarWidgetState();
}

class _MyCalendarWidgetState extends State<MyCalendarWidget> {
  DateTime _selectedDay = DateTime.now();
  DateTime? _tappedDate;
  late Duration _startDuration;

  @override
  void initState() {
    super.initState();

    // Calculate the start duration
    DateTime now = DateTime.now();
    if (now.hour >= 14) {
      // Check if the current hour is 14 (2 PM) or later
      _startDuration = Duration(hours: 14); // Set to 2 PM
    } else {
      _startDuration = Duration(hours: 9); // Default start time
    }
  }

  CalendarControllerProvider calendarControllerProvider() {
    return CalendarControllerProvider(
      controller: EventController()..addAll(_events),
      child: dayViewBuilder(),
    );
  }

  // Your existing customizations
  DayView dayViewBuilder() {
    return DayView(
        dateStringBuilder: dateStringBuilder(),
        halfHourIndicatorSettings: HourIndicatorSettings(
          color: Theme.of(context).dividerColor,
          lineStyle: LineStyle.dashed,
        ),
        headerStyle: HeaderStyle(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          headerTextStyle: Theme.of(context).textTheme.titleMedium,
        ),
        heightPerMinute: 1.3,
        initialDay: _selectedDay,
        minuteSlotSize: MinuteSlotSize.minutes30,
        onDateTap: (date) {
          setState(() => _tappedDate = date);
        },
        onPageChange: (date, page) {
          setState(() => _selectedDay = date);
        },
        showHalfHours: true,
        startDuration: _startDuration,
        timeLineBuilder: (date) {
          if (date.minute != 0) {
            // Return an empty widget if the time is not at the top of the hour
            return SizedBox.shrink();
          }

          return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
              child: Text(DateFormat('h a').format(date),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 12)));
        });
  }

  Future<List<CalendarEventData<Event>>> fetchEvents() async {
    // Replace with your actual database fetching logic
    await Future.delayed(Duration(seconds: 1)); // Simulating network delay
    return _events; // Return your list of events
  }

  List<CalendarEventData<Event>> _events = [
    CalendarEventData(
      date: _now,
      event: Event(title: "Joe's Birthday"),
      title: "Project meeting",
      description: "Today is project meeting.",
      startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
      endTime: DateTime(_now.year, _now.month, _now.day, 22),
    ),
    CalendarEventData(
      date: _now.add(Duration(days: 1)),
      startTime: DateTime(_now.year, _now.month, _now.day, 18),
      endTime: DateTime(_now.year, _now.month, _now.day, 19),
      event: Event(title: "Wedding anniversary"),
      title: "Wedding anniversary",
      description: "Attend uncle's wedding anniversary.",
    ),
    CalendarEventData(
      date: _now,
      startTime: DateTime(_now.year, _now.month, _now.day, 14),
      endTime: DateTime(_now.year, _now.month, _now.day, 17),
      event: Event(title: "Football Tournament"),
      title: "Football Tournament",
      description: "Go to football tournament.",
    ),
    CalendarEventData(
      date: _now.add(Duration(days: 3)),
      startTime: DateTime(
          _now.add(Duration(days: 3)).year,
          _now.add(Duration(days: 3)).month,
          _now.add(Duration(days: 3)).day,
          10),
      endTime: DateTime(
          _now.add(Duration(days: 3)).year,
          _now.add(Duration(days: 3)).month,
          _now.add(Duration(days: 3)).day,
          14),
      event: Event(title: "Sprint Meeting."),
      title: "Sprint Meeting.",
      description: "Last day of project submission for last year.",
    ),
    CalendarEventData(
      date: _now.subtract(Duration(days: 2)),
      startTime: DateTime(
          _now.subtract(Duration(days: 2)).year,
          _now.subtract(Duration(days: 2)).month,
          _now.subtract(Duration(days: 2)).day,
          14),
      endTime: DateTime(
          _now.subtract(Duration(days: 2)).year,
          _now.subtract(Duration(days: 2)).month,
          _now.subtract(Duration(days: 2)).day,
          16),
      event: Event(title: "Team Meeting"),
      title: "Team Meeting",
      description: "Team Meeting",
    ),
    CalendarEventData(
      date: _now.subtract(Duration(days: 2)),
      startTime: DateTime(
          _now.subtract(Duration(days: 2)).year,
          _now.subtract(Duration(days: 2)).month,
          _now.subtract(Duration(days: 2)).day,
          10),
      endTime: DateTime(
          _now.subtract(Duration(days: 2)).year,
          _now.subtract(Duration(days: 2)).month,
          _now.subtract(Duration(days: 2)).day,
          12),
      event: Event(title: "Chemistry Viva"),
      title: "Chemistry Viva",
      description: "Today is Joe's birthday.",
    ),
  ];

  StringProvider dateStringBuilder() {
    final format = 'MM/dd/yyyy';
    return (DateTime date, {DateTime? secondaryDate}) {
      return DateFormat(format).format(date);
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CalendarEventData<Event>>>(
      future: fetchEvents(), // This is where you load your events
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading spinner while the data is loading
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          );
        }

        if (snapshot.hasError) {
          // Handle errors, maybe show an error message
          return Center(child: Text('Error loading events'));
        }

        // Now you can use these events in your DayView
        // For example, you can pass them to a custom event builder function

        return calendarControllerProvider(); // Replace with actual DayView widget
      },
    );
  }
}
