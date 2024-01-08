// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:calendar_view/calendar_view.dart';
import 'package:provider/provider.dart';

class CalendarDayView extends StatefulWidget {
  const CalendarDayView(
      {required this.appointments,
      required this.selectedDay,
      this.width,
      this.height,
      super.key});

  final List<AppointmentsRow> appointments;
  final DateTime selectedDay;
  final double? height;
  final double? width;

  @override
  _CalendarDayViewState createState() => _CalendarDayViewState();
}

class _CalendarDayViewState extends State<CalendarDayView> {
  final EventController _eventController = EventController();
  late List<AppointmentsRow> _appointments;
  late Duration _startDuration;

  StringProvider dateStringBuilder() {
    const format = 'MM/dd/yyyy';
    return (DateTime date, {DateTime? secondaryDate}) {
      return DateFormat(format).format(date);
    };
  }

  @override
  void initState() {
    super.initState();
    _appointments = widget.appointments;

    // Calculate the start duration
    DateTime now = DateTime.now();
    if (now.hour >= 14) {
      // Check if the current hour is 14 (2 PM) or later
      _startDuration = const Duration(hours: 14); // Set to 2 PM
    } else {
      _startDuration = const Duration(hours: 9); // Default start time
    }
  }

  DayView dayViewBuilder() {
    return DayView(
      dateStringBuilder: dateStringBuilder(),
      dayTitleBuilder: (date) => const SizedBox.shrink(),
      halfHourIndicatorSettings: HourIndicatorSettings(
        color: Theme.of(context).dividerColor,
        lineStyle: LineStyle.dashed,
      ),
      headerStyle: HeaderStyle(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        headerTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      heightPerMinute: 1.3,
      initialDay: widget.selectedDay,
      minuteSlotSize: MinuteSlotSize.minutes30,
      onDateTap: (date) {
        setState(() => FFAppState().update(() {
              FFAppState().calendarSelectedDay = date;
            }));
      },
      onEventTap: (events, date) {
        // show an alert dialog with the event title
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(events.first.title),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
      onPageChange: (date, page) {
        setState(() => FFAppState().update(() {
              FFAppState().calendarSelectedDay = date;
            }));
      },
      showHalfHours: true,
      startDuration: _startDuration,
      timeLineBuilder: (date) {
        if (date.minute != 0) {
          // Return an empty widget if the time is not at the top of the hour
          return const SizedBox.shrink();
        }

        return Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
            child: Text(DateFormat('h a').format(date),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 12)));
      },
    );
  }

  List<CalendarEventData<AppointmentsRow>> _createEvents(
      List<AppointmentsRow> appointments) {
    List<CalendarEventData<AppointmentsRow>> events = [];
    for (AppointmentsRow appointment in appointments) {
      final event = CalendarEventData<AppointmentsRow>(
          title: appointment.title,
          description:
              appointment.description != null ? appointment.description! : "",
          // color: Color(appointment.color != null ? appointment.color! : 0),
          startTime: appointment.startTime,
          endTime: appointment.endTime,
          endDate: appointment.endDate,
          date: appointment.date,
          event: appointment);

      events.add(event);
    }
    return events;
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    _eventController.addAll(_createEvents(_appointments));
    return Column(children: [
      Dismissible(
        key: ValueKey(widget.selectedDay),
        child: CalendarDays(
          days: getWeekDays(widget.selectedDay),
        ),
        onDismissed: (direction) {
          setState(() {
            FFAppState().update(() {
              FFAppState().calendarSelectedDay = FFAppState()
                  .calendarSelectedDay!
                  .add(direction == DismissDirection.endToStart
                      ? const Duration(days: 7)
                      : const Duration(days: -7));
            });
          });
        },
      ),
      Expanded(
          child: CalendarControllerProvider(
        controller: _eventController,
        child: dayViewBuilder(),
      ))
    ]);
  }
}

class CalendarDays extends StatelessWidget {
  const CalendarDays({super.key, required this.days});

  final List<CalendarDayStruct> days;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final day in days)
          Expanded(
            child: Center(
              child: Container(
                width: 35,
                height: 35,
                decoration: day.isSelected
                    ? BoxDecoration(
                        color: day.color,
                        borderRadius: BorderRadius.circular(30),
                      )
                    : null,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      // FFAppState().calendarSelectedDay = day.date;
                      FFAppState().update(() {
                        FFAppState().calendarSelectedDay = day.date;
                      });
                    },
                    child: Text(
                      day.number.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: day.isSelected ? Colors.white : day.color,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
