import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'client_add_contact_widget.dart' show ClientAddContactWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientAddContactModel extends FlutterFlowModel<ClientAddContactWidget> {
  ///  Local state fields for this page.

  List<ContactStruct> deviceContacts = [];
  void addToDeviceContacts(ContactStruct item) => deviceContacts.add(item);
  void removeFromDeviceContacts(ContactStruct item) =>
      deviceContacts.remove(item);
  void removeAtIndexFromDeviceContacts(int index) =>
      deviceContacts.removeAt(index);
  void insertAtIndexInDeviceContacts(int index, ContactStruct item) =>
      deviceContacts.insert(index, item);
  void updateDeviceContactsAtIndex(
          int index, Function(ContactStruct) updateFn) =>
      deviceContacts[index] = updateFn(deviceContacts[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getDeviceContacts] action in clientAddContact widget.
  List<ContactStruct>? contacts;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
