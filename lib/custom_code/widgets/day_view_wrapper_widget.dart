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

import 'package:calendar_view/calendar_view.dart';

class DayViewWrapperWidget extends StatefulWidget {
  const DayViewWrapperWidget(
      {Key? key,
      this.width,
      this.height,
      this.dateTitleFormat,
      required this.onDateTap,
      required this.onPageChange,
      required this.selectedDay})
      : super(key: key);

  final double? width;
  final double? height;
  final String? dateTitleFormat;
  final Future<dynamic> Function() onDateTap;
  final Future<dynamic> Function() onPageChange;
  final DateTime selectedDay;

  @override
  _DayViewWrapperWidgetState createState() => _DayViewWrapperWidgetState();
}

class _DayViewWrapperWidgetState extends State<DayViewWrapperWidget> {
  late DateTime _selectedDay;
  late DateTime _tappedDate;
  late Duration _startDuration;

  StringProvider dateStringBuilder() {
    final format = widget.dateTitleFormat ?? 'MM/dd/yyyy';
    return (DateTime date, {DateTime? secondaryDate}) {
      return DateFormat(format).format(date);
    };
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.selectedDay;

    // Calculate the start duration
    DateTime now = DateTime.now();
    if (now.hour >= 14) {
      // Check if the current hour is 14 (2 PM) or later
      _startDuration = Duration(hours: 14); // Set to 2 PM
    } else {
      _startDuration = Duration(hours: 9); // Default start time
    }
  }

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller:
          EventController(), // You might need to manage this as per your need
      child: Scaffold(
        body: DayView(
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
              widget.onDateTap();
              //FFAppState().dayViewTappedDate = date;
              setState(() => _tappedDate = date);
            },
            onPageChange: (date, page) {
              widget.onPageChange();
              //FFAppState().dayViewSelectedDay = date;
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
            }),
      ),
    );
  }
}
