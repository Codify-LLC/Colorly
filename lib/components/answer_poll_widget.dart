import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/poll_graph_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'answer_poll_model.dart';
export 'answer_poll_model.dart';

class AnswerPollWidget extends StatefulWidget {
  const AnswerPollWidget({
    Key? key,
    this.stream,
  }) : super(key: key);

  final StreamsRecord? stream;

  @override
  _AnswerPollWidgetState createState() => _AnswerPollWidgetState();
}

class _AnswerPollWidgetState extends State<AnswerPollWidget> {
  late AnswerPollModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnswerPollModel());

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
        StreamBuilder<PollRecord>(
          stream: PollRecord.getDocument(widget.stream!.pollRef!),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: SpinKitThreeBounce(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 30.0,
                  ),
                ),
              );
            }
            final buttonFullWidthPollRecord = snapshot.data!;
            return Container(
              width: double.infinity,
              height: 500.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    color: Color(0x411D2429),
                    offset: Offset(0.0, -2.0),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(99.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        buttonFullWidthPollRecord.question!,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'i8iyoz3p' /* Answer below */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  if (buttonFullWidthPollRecord.has1 ?? true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'ANSWER_POLL_Container_taku12fp_ON_TAP');
                          logFirebaseEvent('Container_backend_call');

                          final pollUpdateData = {
                            'answer1Stats': FieldValue.increment(1.0),
                            'totalAnswersGiven': FieldValue.increment(1),
                          };
                          await buttonFullWidthPollRecord.reference
                              .update(pollUpdateData);
                          logFirebaseEvent('Container_bottom_sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('Container_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 1.0,
                                  child: PollGraphWidget(
                                    poll: buttonFullWidthPollRecord,
                                    stream: widget.stream,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(99.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            buttonFullWidthPollRecord.answer1!,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    ),
                  if (buttonFullWidthPollRecord.has2 ?? true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'ANSWER_POLL_Container_rt603plq_ON_TAP');
                          logFirebaseEvent('Container_backend_call');

                          final pollUpdateData = {
                            'totalAnswersGiven': FieldValue.increment(1),
                            'answer2Stats': FieldValue.increment(1.0),
                          };
                          await buttonFullWidthPollRecord.reference
                              .update(pollUpdateData);
                          logFirebaseEvent('Container_bottom_sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('Container_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 1.0,
                                  child: PollGraphWidget(
                                    poll: buttonFullWidthPollRecord,
                                    stream: widget.stream,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(99.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            buttonFullWidthPollRecord.answer2!,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    ),
                  if (buttonFullWidthPollRecord.has3 ?? true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'ANSWER_POLL_Container_5zuag6lm_ON_TAP');
                          logFirebaseEvent('Container_backend_call');

                          final pollUpdateData = {
                            'totalAnswersGiven': FieldValue.increment(1),
                            'answer3Stats': FieldValue.increment(1.0),
                          };
                          await buttonFullWidthPollRecord.reference
                              .update(pollUpdateData);
                          logFirebaseEvent('Container_bottom_sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('Container_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 1.0,
                                  child: PollGraphWidget(
                                    poll: buttonFullWidthPollRecord,
                                    stream: widget.stream,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(99.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            buttonFullWidthPollRecord.answer3!,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    ),
                  if (buttonFullWidthPollRecord.has4 ?? true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'ANSWER_POLL_Container_mmi7of2v_ON_TAP');
                          logFirebaseEvent('Container_backend_call');

                          final pollUpdateData = {
                            'totalAnswersGiven': FieldValue.increment(1),
                            'answer4Stats': FieldValue.increment(1.0),
                          };
                          await buttonFullWidthPollRecord.reference
                              .update(pollUpdateData);
                          logFirebaseEvent('Container_bottom_sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('Container_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 1.0,
                                  child: PollGraphWidget(
                                    poll: buttonFullWidthPollRecord,
                                    stream: widget.stream,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(99.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            buttonFullWidthPollRecord.answer4!,
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
