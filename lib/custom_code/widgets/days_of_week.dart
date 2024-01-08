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

class DaysOfWeek extends StatefulWidget {
  const DaysOfWeek({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _DaysOfWeekState createState() => _DaysOfWeekState();
}

class _DaysOfWeekState extends State<DaysOfWeek> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              'S',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: const Color.fromARGB(255, 150, 150, 150),
                  ),
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'M',
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'T',
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'W',
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'T',
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'F',
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text('S',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color.fromARGB(255, 150, 150, 150),
                    )),
          ),
        ),
      ],
    );
  }
}
