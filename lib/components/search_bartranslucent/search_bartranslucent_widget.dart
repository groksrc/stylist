import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'search_bartranslucent_model.dart';
export 'search_bartranslucent_model.dart';

class SearchBartranslucentWidget extends StatefulWidget {
  const SearchBartranslucentWidget({
    Key? key,
    required this.searchItems,
  }) : super(key: key);

  final List<String>? searchItems;

  @override
  _SearchBartranslucentWidgetState createState() =>
      _SearchBartranslucentWidgetState();
}

class _SearchBartranslucentWidgetState
    extends State<SearchBartranslucentWidget> {
  late SearchBartranslucentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchBartranslucentModel());

    _model.textController ??= TextEditingController();
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

    return Container(
      width: double.infinity,
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
              child: Icon(
                Icons.search_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                child: TextFormField(
                  controller: _model.textController,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController',
                    Duration(milliseconds: 2000),
                    () async {
                      safeSetState(() {
                        _model.simpleSearchResults = TextSearch(widget
                                .searchItems!
                                .map((str) => TextSearchItem(str, [str]))
                                .toList())
                            .search(_model.textController.text)
                            .map((r) => r.object)
                            .toList();
                        ;
                      });
                    },
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
