import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddOptionWidget extends StatefulWidget {
  const AddOptionWidget({
    Key? key,
    this.menuItem,
    this.restaurant,
  }) : super(key: key);

  final MenuItemRecord? menuItem;
  final RestaurantsRecord? restaurant;

  @override
  _AddOptionWidgetState createState() => _AddOptionWidgetState();
}

class _AddOptionWidgetState extends State<AddOptionWidget> {
  Map<Option1Record, bool> checkboxListTileValueMap = {};
  List<Option1Record> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  String? dropDownValue;
  TextEditingController? textController1;
  TextEditingController? textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'addOption'});
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
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
                                    'co599vm6' /* Add an Option */,
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
                                        'iqc13yvb' /* 1. Choose the modifier
2. Inpu... */
                                        ,
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowDropDown(
                                  options: widget.menuItem!.modifier!
                                      .toList()
                                      .toList(),
                                  onChanged: (val) =>
                                      setState(() => dropDownValue = val),
                                  width: 180,
                                  height: 50,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.black,
                                      ),
                                  fillColor: Colors.white,
                                  elevation: 2,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0,
                                  borderRadius: 0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12, 4, 12, 4),
                                  hidesUnderline: true,
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
                                        0, 6, 100, 0),
                                    child: TextFormField(
                                      controller: textController1,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'utugqnyf' /* Option Price */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'n99bor82' /* Enter your task here.... */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2D2D2D),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF2D2D2D),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Stack(
                              alignment: AlignmentDirectional(0, 0),
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: TextFormField(
                                    controller: textController2,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'exi3zag1' /* Option name */,
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
                                        'qmka9121' /* Enter your task here.... */,
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
                                  alignment: AlignmentDirectional(0.8, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'ADD_OPTION_Container_pgh5npbz_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_Backend-Call');

                                      final option1CreateData =
                                          createOption1RecordData(
                                        option1Name: textController2!.text,
                                        option1Price:
                                            double.parse(textController1!.text),
                                        option1Title: dropDownValue,
                                        menuItemRef: widget.menuItem!.reference,
                                        hasOption1: true,
                                      );
                                      await Option1Record.collection
                                          .doc()
                                          .set(option1CreateData);
                                      logFirebaseEvent(
                                          'Container_Clear-Text-Fields');
                                      setState(() {
                                        textController1?.clear();
                                        textController2?.clear();
                                      });
                                    },
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Color(0xD50F0F0F),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Icon(
                                        Icons.check_rounded,
                                        color: Color(0xFF00FF00),
                                        size: 24,
                                      ),
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
                                        'ADD_OPTION_PAGE_BACK_BTN_ON_TAP');
                                    logFirebaseEvent('Button_Navigate-Back');
                                    context.pop();
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '8avuojfv' /* Back */,
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
                                        'ADD_OPTION_PAGE_DONE_BTN_ON_TAP');
                                    logFirebaseEvent('Button_Navigate-To');

                                    context.goNamed(
                                      'restaurantDetails',
                                      queryParams: {
                                        'restaurant': serializeParam(
                                            widget.restaurant!.reference,
                                            ParamType.DocumentReference),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'n0evp4cv' /* Done */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 100,
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
                                        'ml30k0d5' /* List of options */,
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
                            child: StreamBuilder<List<Option1Record>>(
                              stream: queryOption1Record(
                                queryBuilder: (option1Record) => option1Record
                                    .where('menuItemRef',
                                        isEqualTo: widget.menuItem!.reference)
                                    .where('option1Title',
                                        isEqualTo: dropDownValue),
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
                                List<Option1Record> listViewOption1RecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewOption1RecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewOption1Record =
                                        listViewOption1RecordList[
                                            listViewIndex];
                                    return Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0xFFF5F5F5),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Theme(
                                                  data: ThemeData(
                                                    unselectedWidgetColor:
                                                        Color(0xFF707070),
                                                  ),
                                                  child: CheckboxListTile(
                                                    value: checkboxListTileValueMap[
                                                            listViewOption1Record] ??=
                                                        true,
                                                    onChanged: (newValue) =>
                                                        setState(() =>
                                                            checkboxListTileValueMap[
                                                                    listViewOption1Record] =
                                                                newValue!),
                                                    title: Text(
                                                      listViewOption1Record
                                                          .option1Name!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3,
                                                    ),
                                                    subtitle: Text(
                                                      formatNumber(
                                                        listViewOption1Record
                                                            .option1Price!,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .periodDecimal,
                                                        currency: '\$',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2,
                                                    ),
                                                    tileColor:
                                                        Color(0xFFF5F5F5),
                                                    dense: false,
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .trailing,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
