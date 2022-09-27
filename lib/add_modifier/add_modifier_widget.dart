import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddModifierWidget extends StatefulWidget {
  const AddModifierWidget({
    Key? key,
    this.menuItem,
    this.restaurant,
  }) : super(key: key);

  final MenuItemRecord? menuItem;
  final RestaurantsRecord? restaurant;

  @override
  _AddModifierWidgetState createState() => _AddModifierWidgetState();
}

class _AddModifierWidgetState extends State<AddModifierWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'addModifier'});
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryDark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7,
                            color: Color(0x5D000000),
                            offset: Offset(0, -2),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'cntn8chk' /* Add A Modifier */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: AutoSizeText(
                                      FFLocalizations.of(context).getText(
                                        'vq4pgkr5' /* Add a modifier and click the g... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Color(0xFF2D2D2D),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional(0, 0),
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: TextFormField(
                                    controller: textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'pfy72sic' /* Modifier name */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'wk8fnedb' /* Enter your task here.... */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2D2D2D),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2D2D2D),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFF2D2D2D),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.85, 0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xD50F0F0F),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: Icon(
                                        Icons.check_rounded,
                                        color: Color(0xFF00FF00),
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'ADD_MODIFIER_check_rounded_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_Backend-Call');

                                        final menuItemUpdateData = {
                                          'modifier': FieldValue.arrayUnion(
                                              [textController!.text]),
                                        };
                                        await widget.menuItem!.reference
                                            .update(menuItemUpdateData);
                                        logFirebaseEvent(
                                            'IconButton_Clear-Text-Fields');
                                        setState(() {
                                          textController?.clear();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ADD_MODIFIER_PAGE_BACK_BTN_ON_TAP');
                                    logFirebaseEvent('Button_Navigate-Back');
                                    context.pop();
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '8q4f1i41' /* Back */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 70,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryDark,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ADD_MODIFIER_PAGE_ADD_OPTIONS_BTN_ON_TAP');
                                    logFirebaseEvent('Button_Navigate-To');

                                    context.pushNamed(
                                      'addOption',
                                      queryParams: {
                                        'menuItem': serializeParam(
                                            widget.menuItem,
                                            ParamType.Document),
                                        'restaurant': serializeParam(
                                            widget.restaurant,
                                            ParamType.Document),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'menuItem': widget.menuItem,
                                        'restaurant': widget.restaurant,
                                      },
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'ugc1ey06' /* Add Options */,
                                  ),
                                  icon: Icon(
                                    Icons.add_rounded,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 170,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                        ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 30, 0, 10),
                                    child: AutoSizeText(
                                      FFLocalizations.of(context).getText(
                                        'b0maj57h' /* List of modifiers */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 10),
                              child: StreamBuilder<List<ModifiersRecord>>(
                                stream: queryModifiersRecord(
                                  queryBuilder: (modifiersRecord) =>
                                      modifiersRecord.where('modItem',
                                          isEqualTo:
                                              widget.menuItem!.reference),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: SpinKitThreeBounce(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 30,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ModifiersRecord>
                                      listViewModifiersRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewModifiersRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewModifiersRecord =
                                          listViewModifiersRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF2D2D2D),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.85, 0),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xD50F0F0F),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 60,
                                                    icon: Icon(
                                                      Icons.cancel_outlined,
                                                      color: Color(0xFFEC0B0B),
                                                      size: 30,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'ADD_MODIFIER_cancel_outlined_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_Backend-Call');
                                                      await listViewModifiersRecord
                                                          .reference
                                                          .delete();
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.8, 0),
                                                child: Text(
                                                  listViewModifiersRecord
                                                      .modName!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.8, 0),
                                                child: Text(
                                                  listViewModifiersRecord
                                                      .modName!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
