import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'client_details_model.dart';
export 'client_details_model.dart';

class ClientDetailsWidget extends StatefulWidget {
  const ClientDetailsWidget({
    Key? key,
    this.clientId,
    this.stylistId,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.birthMonth,
    required this.birthDay,
    this.clientPhoto,
  }) : super(key: key);

  final String? clientId;
  final String? stylistId;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final int? birthMonth;
  final int? birthDay;
  final String? clientPhoto;

  @override
  _ClientDetailsWidgetState createState() => _ClientDetailsWidgetState();
}

class _ClientDetailsWidgetState extends State<ClientDetailsWidget> {
  late ClientDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientDetailsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.currentPhoto = widget.clientPhoto;
      });
    });

    _model.firstNameController ??=
        TextEditingController(text: widget.firstName);
    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameController ??= TextEditingController(text: widget.lastName);
    _model.lastNameFocusNode ??= FocusNode();

    _model.phoneController ??= TextEditingController(text: widget.phone);
    _model.phoneFocusNode ??= FocusNode();

    _model.emailController ??= TextEditingController(text: widget.email);
    _model.emailFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (_model.currentPhoto != null && _model.currentPhoto != '')
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Remove the photo?'),
                              content: Text(
                                  'Removing this photo will allow you to add a new photo.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: Text('Confirm'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      await deleteSupabaseFileFromPublicUrl(
                          _model.currentPhoto!);
                      if (widget.clientId != null && widget.clientId != '') {
                        await ClientsTable().update(
                          data: {
                            'client_photo': null,
                          },
                          matchingRows: (rows) => rows.eq(
                            'id',
                            widget.clientId,
                          ),
                        );
                      }
                      setState(() {
                        _model.currentPhoto = null;
                      });
                    }
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: const CircleBorder(),
                    child: Container(
                      width: 130.0,
                      height: 130.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              width: 120.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(
                                    _model.currentPhoto!,
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (_model.currentPhoto == null || _model.currentPhoto == '')
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      storageFolderPath: '${currentUserUid}/clients',
                      imageQuality: 80,
                      allowPhoto: true,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      textColor: FlutterFlowTheme.of(context).primaryText,
                      pickerFontFamily: 'Poppins',
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isDataUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      var downloadUrls = <String>[];
                      try {
                        showUploadMessage(
                          context,
                          'Uploading file...',
                          showLoading: true,
                        );
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = await uploadSupabaseStorageFiles(
                          bucketName: 'stylist-savvy-images',
                          selectedFiles: selectedMedia,
                        );
                      } finally {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        _model.isDataUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl = downloadUrls.first;
                        });
                        showUploadMessage(context, 'Success!');
                      } else {
                        setState(() {});
                        showUploadMessage(context, 'Failed to upload data');
                        return;
                      }
                    }

                    setState(() {
                      _model.currentPhoto = _model.uploadedFileUrl;
                    });
                    if (widget.clientId != null && widget.clientId != '') {
                      await ClientsTable().update(
                        data: {
                          'client_photo': _model.currentPhoto,
                        },
                        matchingRows: (rows) => rows.eq(
                          'id',
                          widget.clientId,
                        ),
                      );
                    }
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: const CircleBorder(),
                    child: Container(
                      width: 130.0,
                      height: 130.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  'https://images.unsplash.com/photo-1554519515-242161756769?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60',
                                ).image,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0x90000000),
                                shape: BoxShape.circle,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 48.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: TextFormField(
            controller: _model.firstNameController,
            focusNode: _model.firstNameFocusNode,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'First Name',
              labelStyle: FlutterFlowTheme.of(context).labelMedium,
              hintStyle: FlutterFlowTheme.of(context).labelMedium,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).tertiary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            ),
            style: FlutterFlowTheme.of(context).bodyLarge,
            validator: _model.firstNameControllerValidator.asValidator(context),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: TextFormField(
            controller: _model.lastNameController,
            focusNode: _model.lastNameFocusNode,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Last Name',
              labelStyle: FlutterFlowTheme.of(context).labelMedium,
              hintStyle: FlutterFlowTheme.of(context).labelMedium,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).tertiary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            ),
            style: FlutterFlowTheme.of(context).bodyLarge,
            validator: _model.lastNameControllerValidator.asValidator(context),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: TextFormField(
            controller: _model.phoneController,
            focusNode: _model.phoneFocusNode,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Phone',
              labelStyle: FlutterFlowTheme.of(context).labelMedium,
              hintStyle: FlutterFlowTheme.of(context).labelMedium,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).tertiary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            ),
            style: FlutterFlowTheme.of(context).bodyLarge,
            validator: _model.phoneControllerValidator.asValidator(context),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: TextFormField(
            controller: _model.emailController,
            focusNode: _model.emailFocusNode,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: FlutterFlowTheme.of(context).labelMedium,
              hintStyle: FlutterFlowTheme.of(context).labelMedium,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).tertiary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            ),
            style: FlutterFlowTheme.of(context).bodyLarge,
            validator: _model.emailControllerValidator.asValidator(context),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: FlutterFlowDropDown<int>(
                  controller: _model.birthMonthValueController ??=
                      FormFieldController<int>(
                    _model.birthMonthValue ??= widget.birthMonth,
                  ),
                  options:
                      List<int>.from([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]),
                  optionLabels: [
                    'January',
                    'February',
                    'March',
                    'April',
                    'May',
                    'June',
                    'July',
                    'August',
                    'September',
                    'October',
                    'November',
                    'December'
                  ],
                  onChanged: (val) =>
                      setState(() => _model.birthMonthValue = val),
                  width: 300.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge,
                  hintText: 'Birth Month (Optional)',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 40.0,
                  margin: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: FlutterFlowDropDown<int>(
                  controller: _model.birthDayValueController ??=
                      FormFieldController<int>(
                    _model.birthDayValue ??= widget.birthDay,
                  ),
                  options: List<int>.from(
                      functions.daysInMonth(_model.birthMonthValue!)),
                  optionLabels: <String>[],
                  onChanged: (val) =>
                      setState(() => _model.birthDayValue = val),
                  width: 300.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge,
                  hintText: 'Birth Month (Optional)',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 40.0,
                  margin: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 20.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (widget.clientId != null && widget.clientId != '') {
                      await ClientsTable().update(
                        data: {
                          'first_name': _model.firstNameController.text,
                          'last_name': _model.lastNameController.text,
                          'email': _model.emailController.text,
                          'phone': _model.phoneController.text,
                          'birth_month': _model.birthMonthValue,
                          'birth_day': _model.birthDayValue,
                          'client_photo': _model.currentPhoto,
                        },
                        matchingRows: (rows) => rows.eq(
                          'id',
                          widget.clientId,
                        ),
                      );

                      context.pushNamed(
                        'client',
                        queryParameters: {
                          'clientId': serializeParam(
                            widget.clientId,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                          ),
                        },
                      );
                    } else {
                      _model.newClient = await ClientsTable().insert({
                        'stylist_id': currentUserUid,
                        'first_name': _model.firstNameController.text,
                        'last_name': _model.lastNameController.text,
                        'email': _model.emailController.text,
                        'phone': _model.phoneController.text,
                        'birth_month': _model.birthMonthValue,
                        'client_photo': _model.currentPhoto,
                        'birth_day': _model.birthDayValue,
                      });

                      context.goNamed(
                        'client',
                        queryParameters: {
                          'clientId': serializeParam(
                            _model.newClient?.id,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                          ),
                        },
                      );
                    }

                    setState(() {});
                  },
                  text: 'Save',
                  options: FFButtonOptions(
                    height: 60.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                    elevation: 5.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
