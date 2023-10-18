import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'client_add_contact_model.dart';
export 'client_add_contact_model.dart';

class ClientAddContactWidget extends StatefulWidget {
  const ClientAddContactWidget({Key? key}) : super(key: key);

  @override
  _ClientAddContactWidgetState createState() => _ClientAddContactWidgetState();
}

class _ClientAddContactWidgetState extends State<ClientAddContactWidget> {
  late ClientAddContactModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientAddContactModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.deviceContacts =
            functions.emptyContactList().toList().cast<ContactStruct>();
      });
      _model.contacts = await actions.getDeviceContacts();
      setState(() {
        _model.deviceContacts = _model.contacts!.toList().cast<ContactStruct>();
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: Icon(
                  Icons.chevron_left,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed('clients');
                },
              ),
            ],
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/LogoHHS_Blond_ClearBkg_HiResWebFile.png',
                      height: 50.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 20.0,
                  borderWidth: 0.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).accent1,
                  icon: Icon(
                    Icons.menu,
                    color: FlutterFlowTheme.of(context).secondary,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                ),
              ],
            ),
          ],
          centerTitle: false,
          elevation: 5.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    final contact = _model.deviceContacts.toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: contact.length,
                      itemBuilder: (context, contactIndex) {
                        final contactItem = contact[contactIndex];
                        return Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.standard,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                          child: CheckboxListTile(
                            value:
                                _model.checkboxListTileValueMap[contactItem] ??=
                                    false,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.checkboxListTileValueMap[contactItem] =
                                      newValue!);
                            },
                            title: Text(
                              '${contactItem.firstName} ${contactItem.lastName}',
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                            subtitle: Text(
                              '${contactItem.phone}   ${contactItem.email}',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            activeColor: FlutterFlowTheme.of(context).secondary,
                            checkColor: FlutterFlowTheme.of(context).accent3,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
