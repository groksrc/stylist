import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/request_contacts_permissions_widget.dart';
import '/components/search_bartranslucent_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'clients_widget.dart' show ClientsWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientsModel extends FlutterFlowModel<ClientsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SearchBartranslucent component.
  late SearchBartranslucentModel searchBartranslucentModel;

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
