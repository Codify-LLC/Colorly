import '../backend/backend.dart';
import '../components/correct_answer_popup_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerTriviaWidget extends StatefulWidget {
  const AnswerTriviaWidget({
    Key? key,
    this.stream,
  }) : super(key: key);

  final StreamsRecord? stream;

  @override
  _AnswerTriviaWidgetState createState() => _AnswerTriviaWidgetState();
}

class _AnswerTriviaWidgetState extends State<AnswerTriviaWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        StreamBuilder<TriviaRecord>(
          stream: TriviaRecord.getDocument(widget.stream!.triviaRef!),
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
            final buttonFullWidthTriviaRecord = snapshot.data!;
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
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        buttonFullWidthTriviaRecord.question!,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'vfm304kp' /* Answer below */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  if (buttonFullWidthTriviaRecord.has1 ?? true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'ANSWER_TRIVIA_Container_nwjca4m6_ON_TAP');
                          logFirebaseEvent('Container_Bottom-Sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('Container_Bottom-Sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  child: CorrectAnswerPopupWidget(
                                    stream: widget.stream,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            buttonFullWidthTriviaRecord.answer1!,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    ),
                  if (buttonFullWidthTriviaRecord.has2 ?? true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'ANSWER_TRIVIA_Container_wuvdyhvy_ON_TAP');
                          logFirebaseEvent('Container_Bottom-Sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('Container_Bottom-Sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  child: CorrectAnswerPopupWidget(
                                    stream: widget.stream,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            buttonFullWidthTriviaRecord.answer2!,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    ),
                  if (buttonFullWidthTriviaRecord.has3 ?? true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'ANSWER_TRIVIA_Container_gnbyw7ex_ON_TAP');
                          logFirebaseEvent('Container_Bottom-Sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('Container_Bottom-Sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  child: CorrectAnswerPopupWidget(
                                    stream: widget.stream,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            buttonFullWidthTriviaRecord.answer3!,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    ),
                  if (buttonFullWidthTriviaRecord.has4 ?? true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'ANSWER_TRIVIA_Container_v6bjpsah_ON_TAP');
                          logFirebaseEvent('Container_Bottom-Sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('Container_Bottom-Sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  child: CorrectAnswerPopupWidget(
                                    stream: widget.stream,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            buttonFullWidthTriviaRecord.answer4!,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
