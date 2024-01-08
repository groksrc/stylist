import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<int> daysInMonth(int month) {
  // Define the days in each month
  List<int> daysPerMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  // Validate month number
  if (month < 1 || month > 12) {
    return []; // Return empty list for invalid month
  }

  // Get days for the given month
  int days = daysPerMonth[month - 1];

  return List.generate(days, (index) => index + 1);
}

List<ContactStruct> emptyContactList() {
  return [];
}

DateTime today() {
  final now = DateTime.now();
  return new DateTime(now.year, now.month, now.day);
}

List<CalendarDayStruct> getWeekDays(DateTime date) {
  // Find out the weekday number (where Monday is 1 and Sunday is 7)
  int weekday = date.weekday;

  // Calculate the difference in days from the previous Sunday
  int daysToPreviousSunday = weekday % 7;

  // Get the previous Sunday's date
  DateTime sunday = date.subtract(Duration(days: daysToPreviousSunday));

  // Create an array to store the week's dates
  List<CalendarDayStruct> weekDates = [];

  // see if today is the selected day
  DateTime now = DateTime.now();
  bool todayIsSelected =
      now.year == date.year && now.month == date.month && now.day == date.day;

  // Add each day of the week to the array
  for (int i = 0; i < 7; i++) {
    DateTime day = sunday.add(Duration(days: i));
    weekDates.add(CalendarDayStruct(
      color: todayIsSelected &&
              day.year == date.year &&
              day.month == date.month &&
              day.day == date.day
          ? Colors.red
          : Colors.black,
      date: day,
      isSelected: day.year == date.year &&
          day.month == date.month &&
          day.day == date.day,
      number: day.day,
    ));
  }

  return weekDates;
}

DateTime dateWithoutTime(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}
