// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// See installation notes below regarding AndroidManifest.xml and Info.plist
import 'package:flutter_contacts/flutter_contacts.dart';

Future<List<ContactStruct>> getDeviceContacts() async {
  List<ContactStruct> customContacts = [];

  // Request contact permission
  if (await FlutterContacts.requestPermission()) {
    // Get all contacts (lightly fetched)
    List<Contact> contacts = await FlutterContacts.getContacts(
        // withProperties: true, withPhoto: true);
        withProperties: true);

    // Map Contact objects to ContactStruct objects
    customContacts = contacts.map((contact) {
      final displayNameParts = contact.displayName.split(' ');
      final firstName = displayNameParts.isNotEmpty ? displayNameParts[0] : "";
      final lastName = displayNameParts.length > 1
          ? displayNameParts.sublist(1).join(' ')
          : "";

      return ContactStruct(
        id: contact.id,
        fullName: contact.displayName,
        firstName: firstName,
        lastName: lastName,
        email: contact.emails.isNotEmpty ? contact.emails[0].address : "",
        phone: contact.phones.isNotEmpty ? contact.phones.first.number : "",
        //photo: contact.photo ?? "", // TODO: deal with the unsigned byte array
      );
    }).toList();
  }

  return customContacts;
}
