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

class CalendarDays extends StatefulWidget {
  const CalendarDays({
    Key? key,
    this.width,
    this.height,
    required this.days,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<CalendarDayStruct> days;

  @override
  _CalendarDaysState createState() => _CalendarDaysState();
}

class _CalendarDaysState extends State<CalendarDays> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final day in widget.days)
          Expanded(
            child: Center(
              child: Container(
                width: 30,
                height: 30,
                decoration: day.isSelected
                    ? BoxDecoration(
                        color: day.color,
                        borderRadius: BorderRadius.circular(15),
                      )
                    : null,
                child: Center(
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
      ],
    );
  }
}
