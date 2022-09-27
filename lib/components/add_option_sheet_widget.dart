import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddOptionSheetWidget extends StatefulWidget {
  const AddOptionSheetWidget({
    Key? key,
    this.menuCourse,
    this.restaurant,
    this.menuCourses,
    this.menuItem,
    this.option1,
  }) : super(key: key);

  final MenuCourseRecord? menuCourse;
  final RestaurantsRecord? restaurant;
  final DocumentReference? menuCourses;
  final MenuItemRecord? menuItem;
  final Option1Record? option1;

  @override
  _AddOptionSheetWidgetState createState() => _AddOptionSheetWidgetState();
}

class _AddOptionSheetWidgetState extends State<AddOptionSheetWidget> {
  PageController? pageViewController;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                child: PageView(
                  controller: pageViewController ??=
                      PageController(initialPage: 0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SingleChildScrollView(
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
                                  height:
                                      MediaQuery.of(context).size.height * 1,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 20, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1cyrad2v' /* Add Item Modifier #1 */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title2
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 4, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 10),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'jkjhlp42' /* 1. Input Modfier Title (Size, ... */,
                                                  ),
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
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 4, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 6, 100, 0),
                                                child: TextFormField(
                                                  controller: textController1,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'sw50edrx' /* Modifier Title */,
                                                    ),
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                            ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'to7pmihn' /* Enter your task here.... */,
                                                    ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF2D2D2D),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF2D2D2D),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xFF2D2D2D),
                                                  ),
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
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 4, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 6, 100, 0),
                                                child: TextFormField(
                                                  controller: textController2,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'qcn76boo' /* Modifier Price */,
                                                    ),
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                            ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '7g55vien' /* Enter your task here.... */,
                                                    ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF2D2D2D),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF2D2D2D),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xFF2D2D2D),
                                                  ),
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
                                                  keyboardType:
                                                      TextInputType.number,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Stack(
                                          alignment: AlignmentDirectional(0, 0),
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0.72, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 116, 0),
                                                child: TextFormField(
                                                  controller: textController3,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'yyd1dwek' /* Option name */,
                                                    ),
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                            ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '7884em51' /* Enter your task here.... */,
                                                    ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF2D2D2D),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF2D2D2D),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xFF2D2D2D),
                                                  ),
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
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(210, 0, 0, 0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xD50F0F0F),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Visibility(
                                                  visible: widget.menuItem!
                                                          .hasOption1 ??
                                                      true,
                                                  child: InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'ADD_OPTION_SHEET_Icon_6p26wfh4_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_Backend-Call');

                                                      final option1UpdateData =
                                                          {
                                                        'options': FieldValue
                                                            .arrayUnion([
                                                          textController3!.text
                                                        ]),
                                                      };
                                                      await widget
                                                          .menuItem!.option1!
                                                          .update(
                                                              option1UpdateData);
                                                    },
                                                    child: Icon(
                                                      Icons.check_rounded,
                                                      color: Color(0xFF43C643),
                                                      size: 28,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 20, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADD_OPTION_SHEET_COMP_BACK_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_Navigate-Back');
                                                  context.pop();
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'xliy8s6z' /* Back */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 70,
                                                  height: 50,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryDark,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .subtitle2
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                          ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                            if (!widget.menuItem!.hasOption1!)
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADD_OPTION_SHEET_ADD_OPTION_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_Backend-Call');

                                                  final option1CreateData = {
                                                    ...createOption1RecordData(
                                                      option1Price:
                                                          double.parse(
                                                              textController2!
                                                                  .text),
                                                      option1Title:
                                                          textController1!.text,
                                                      menuItemRef: widget
                                                          .menuItem!.reference,
                                                      hasOption1: true,
                                                    ),
                                                    'options': [
                                                      textController3!.text
                                                    ],
                                                  };
                                                  await Option1Record.collection
                                                      .doc()
                                                      .set(option1CreateData);
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'lsjbxfn2' /* Add Option */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 120,
                                                  height: 50,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .subtitle2
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 190, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'ADD_OPTION_SHEET_ADD_MODIFIER_#2_BTN_ON_');
                                            logFirebaseEvent(
                                                'Button_Navigate-To');

                                            context
                                                .pushNamed('restaurantDetails');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'jffcjemj' /* Add Modifier #2 */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 150,
                                            height: 50,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 16, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 20, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADD_OPTION_SHEET_COMP_BACK_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_Navigate-Back');
                                                  context.pop();
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'f2kby5jj' /* Back */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 70,
                                                  height: 50,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryDark,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .subtitle2
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                          ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                            if (!widget.menuItem!.hasOption1!)
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADD_OPTION_SHEET_ADD_OPTION_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_Backend-Call');

                                                  final option1CreateData = {
                                                    ...createOption1RecordData(
                                                      option1Price:
                                                          double.parse(
                                                              textController2!
                                                                  .text),
                                                      option1Title:
                                                          textController1!.text,
                                                      menuItemRef: widget
                                                          .menuItem!.reference,
                                                      hasOption1: true,
                                                    ),
                                                    'options': [
                                                      textController3!.text
                                                    ],
                                                  };
                                                  await Option1Record.collection
                                                      .doc()
                                                      .set(option1CreateData);
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'doxomfmb' /* Add Option */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 120,
                                                  height: 50,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .subtitle2
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                          ],
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
                    Image.network(
                      'https://picsum.photos/seed/309/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://picsum.photos/seed/988/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: SmoothPageIndicator(
                    controller: pageViewController ??=
                        PageController(initialPage: 0),
                    count: 3,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (i) {
                      pageViewController!.animateToPage(
                        i,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    effect: ExpandingDotsEffect(
                      expansionFactor: 2,
                      spacing: 8,
                      radius: 16,
                      dotWidth: 16,
                      dotHeight: 16,
                      dotColor: Color(0xFF9E9E9E),
                      activeDotColor: FlutterFlowTheme.of(context).primaryColor,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
