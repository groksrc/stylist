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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> upsertClientFromContact(
    ContactStruct contact, String stylistId) async {
  final supabase = Supabase.instance.client;

  if (contact.id.isNotEmpty) {
    final response = await supabase.from('clients').upsert({
      'stylist_id': stylistId,
      'first_name': contact.firstName,
      'last_name': contact.lastName,
      'email': contact.email,
      'phone': contact.phone,
      'contact_identifier': contact.id,
      'birth_month': 0,
      'birth_day': 0,
      'archived': false
    },
        options: const FetchOptions(count: CountOption.exact),
        onConflict: 'contact_identifier, stylist_id');

    return response.count == 1;
  }
  return false;
}
