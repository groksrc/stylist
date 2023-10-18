// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase/supabase.dart';

Future<bool> upsertClientFromContact(
    ContactStruct contact, String stylistId) async {
  final supabase = Supabase.instance.client;

  if (contact.id.isNotEmpty()) {
    final response = await supabase.from('clients').upsert({
      'stylist_id': stylistId,
      'first_name': contact.firstName,
      'last_name': contact.lastName,
      'email': contact.email,
      'phone': contact.phone,
      'birth_month': contact.birthMonth,
      'birth_day': contact.birthDay,
      'contact_identifier': contact.id,
      'archived': false
    }, onConflict: 'contact_identifier, stylist_id');

    return response.error == null;
  }

  return false;
}
