import '/auth/supabase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/search_bartranslucent/search_bartranslucent_widget.dart';
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
import 'package:text_search/text_search.dart';

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

  List<ContactStruct> filteredDeviceContacts = [];
  void addToFilteredDeviceContacts(ContactStruct item) =>
      filteredDeviceContacts.add(item);
  void removeFromFilteredDeviceContacts(ContactStruct item) =>
      filteredDeviceContacts.remove(item);
  void removeAtIndexFromFilteredDeviceContacts(int index) =>
      filteredDeviceContacts.removeAt(index);
  void insertAtIndexInFilteredDeviceContacts(int index, ContactStruct item) =>
      filteredDeviceContacts.insert(index, item);
  void updateFilteredDeviceContactsAtIndex(
          int index, Function(ContactStruct) updateFn) =>
      filteredDeviceContacts[index] = updateFn(filteredDeviceContacts[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getDeviceContacts] action in clientAddContact widget.
  List<ContactStruct>? contacts;
  // Model for SearchBartranslucent component.
  late SearchBartranslucentModel searchBartranslucentModel;
  List<String> simpleSearchResults = [];
  // State field(s) for CheckboxListTile widget.

  Map<ContactStruct, bool> checkboxListTileValueMap1 = {};
  List<ContactStruct> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Custom Action - upsertClientFromContact] action in CheckboxListTile widget.
  bool? upsertClientFromContactResult;
  // State field(s) for CheckboxListTile widget.

  Map<ContactStruct, bool> checkboxListTileValueMap2 = {};
  List<ContactStruct> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Custom Action - upsertClientFromContact] action in CheckboxListTile widget.
  bool? upsertClientFromFilteredContactResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchBartranslucentModel =
        createModel(context, () => SearchBartranslucentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    searchBartranslucentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
