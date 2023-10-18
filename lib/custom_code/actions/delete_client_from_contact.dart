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

import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<bool> deleteClientFromContact(
    ContactStruct contact, String stylistId) async {
  final supabase = Supabase.instance.client;

  if (contact.id.isNotEmpty) {
    final response = await supabase
        .from('clients')
        .update({'archived': true}).match(
            {'contact_identifier': contact.id, 'stylist_id': stylistId});

    return response.error == null;
  }

  return false;
}
