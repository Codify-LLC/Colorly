import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTriviaWidget extends StatefulWidget {
  const AddTriviaWidget({
    Key? key,
    this.stream,
  }) : super(key: key);

  final StreamsRecord? stream;

  @override
  _AddTriviaWidgetState createState() => _AddTriviaWidgetState();
}

class _AddTriviaWidgetState extends State<AddTriviaWidget> {
  TextEditingController? textController1;
  TextEditingController? textField1Controller;
  TextEditingController? textField2Controller;
  TextEditingController? textField3Controller;
  TextEditingController? textField4Controller;
  TriviaRecord? triviaOutput;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textField1Controller = TextEditingController();
    textField2Controller = TextEditingController();
    textField3Controller = TextEditingController();
    textField4Controller = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textField1Controller?.dispose();
    textField2Controller?.dispose();
    textField3Controller?.dispose();
    textField4Controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RestaurantsRecord>>(
      stream: queryRestaurantsRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: SpinKitThreeBounce(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 30,
              ),
            ),
          );
        }
        List<RestaurantsRecord> buttonFullWidthRestaurantsRecordList =
            snapshot.data!;
        return Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x411D2429),
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
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: TextFormField(
                      controller: textController1,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: FFLocalizations.of(context).getText(
                          'f56teg44' /* Enter question here... */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).subtitle1,
                    ),
                  ),
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'ch201m5n' /* Enter up to 4 answers below */,
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'ffpspgwr' /* 1. */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: TextFormField(
                            controller: textField1Controller,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'ks0mz6py' /* Answer... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'wfxiugax' /* 2. */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: TextFormField(
                            controller: textField2Controller,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'guz8hrjb' /* Answer... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'zjkk17ni' /* 3. */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: TextFormField(
                            controller: textField3Controller,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'udox0vhs' /* Answer... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'cyf9k341' /* 4. */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: TextFormField(
                            controller: textField4Controller,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'nqvv7kzq' /* Answer... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ADD_TRIVIA_COMP_DONE_BTN_ON_TAP');
                    logFirebaseEvent('Button_Backend-Call');

                    final triviaCreateData = createTriviaRecordData(
                      stream: widget.stream!.reference,
                      current: true,
                      question: textController1!.text,
                    );
                    var triviaRecordReference = TriviaRecord.collection.doc();
                    await triviaRecordReference.set(triviaCreateData);
                    triviaOutput = TriviaRecord.getDocumentFromData(
                        triviaCreateData, triviaRecordReference);
                    if (textField1Controller!.text != null &&
                        textField1Controller!.text != '') {
                      logFirebaseEvent('Button_Backend-Call');

                      final triviaUpdateData = createTriviaRecordData(
                        has1: true,
                        answer1: textField1Controller!.text,
                      );
                      await triviaOutput!.reference.update(triviaUpdateData);
                    } else {
                      logFirebaseEvent('Button_Backend-Call');

                      final triviaUpdateData = createTriviaRecordData(
                        has1: false,
                      );
                      await triviaOutput!.reference.update(triviaUpdateData);
                    }

                    if (textField2Controller!.text != null &&
                        textField2Controller!.text != '') {
                      logFirebaseEvent('Button_Backend-Call');

                      final triviaUpdateData = createTriviaRecordData(
                        has2: true,
                        answer2: textField2Controller!.text,
                      );
                      await triviaOutput!.reference.update(triviaUpdateData);
                    } else {
                      logFirebaseEvent('Button_Backend-Call');

                      final triviaUpdateData = createTriviaRecordData(
                        has2: false,
                      );
                      await triviaOutput!.reference.update(triviaUpdateData);
                    }

                    if (textField3Controller!.text != null &&
                        textField3Controller!.text != '') {
                      logFirebaseEvent('Button_Backend-Call');

                      final triviaUpdateData = createTriviaRecordData(
                        has3: true,
                        answer3: textField3Controller!.text,
                      );
                      await triviaOutput!.reference.update(triviaUpdateData);
                    } else {
                      logFirebaseEvent('Button_Backend-Call');

                      final triviaUpdateData = createTriviaRecordData(
                        has3: false,
                      );
                      await triviaOutput!.reference.update(triviaUpdateData);
                    }

                    if (textField4Controller!.text != null &&
                        textField4Controller!.text != '') {
                      logFirebaseEvent('Button_Backend-Call');

                      final triviaUpdateData = createTriviaRecordData(
                        has4: true,
                        answer4: textField4Controller!.text,
                      );
                      await triviaOutput!.reference.update(triviaUpdateData);
                    } else {
                      logFirebaseEvent('Button_Backend-Call');

                      final triviaUpdateData = createTriviaRecordData(
                        has4: false,
                      );
                      await triviaOutput!.reference.update(triviaUpdateData);
                    }

                    logFirebaseEvent('Button_Bottom-Sheet');
                    Navigator.pop(context);

                    setState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    '795uc176' /* Done */,
                  ),
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).btnText,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
