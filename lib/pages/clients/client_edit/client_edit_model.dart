import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/client_details/client_details_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'client_edit_widget.dart' show ClientEditWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientEditModel extends FlutterFlowModel<ClientEditWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for clientDetails component.
  late ClientDetailsModel clientDetailsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    clientDetailsModel = createModel(context, () => ClientDetailsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    clientDetailsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
