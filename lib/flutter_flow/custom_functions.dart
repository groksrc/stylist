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
