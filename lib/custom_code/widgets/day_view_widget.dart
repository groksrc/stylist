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

import 'index.dart'; // Imports other custom widgets

import 'package:calendar_view/calendar_view.dart';

class DayViewWidget extends StatefulWidget {
  const DayViewWidget(
      {Key? key, this.width, this.height, this.dateTitleFormat, this.onDateTap})
      : super(key: key);

  final double? width;
  final double? height;
  final String? dateTitleFormat;
  final Future<dynamic> Function()? onDateTap;

  @override
  _DayViewWidgetState createState() => _DayViewWidgetState();
}

class _DayViewWidgetState extends State<DayViewWidget> {
  // Create an EventController instance
  final EventController _eventController = EventController();

  StringProvider dateStringProvider() {
    final format = widget.dateTitleFormat ?? 'MM/dd/yyyy';
    return (DateTime date, {DateTime? secondaryDate}) {
      return DateFormat(format).format(date);
    };
  }

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: _eventController,
      child: Scaffold(
        body: DayView(
            dateStringBuilder: dateStringProvider(),
            dayTitleBuilder: (date) => SizedBox.shrink(),
            minDay: DateTime(2020, 1, 1),
            maxDay: DateTime(2050, 1, 1),
            onDateTap: widget.onDateTap,
            startDuration: Duration(hours: 9),
            timeLineBuilder: (date) {
              return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                  child: Text(DateFormat('h a').format(date),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12)));
            }
            // Configure the DayView widget as needed
            // You can set properties such as date, style, events, etc.
            ),
      ),
    );
  }
}
