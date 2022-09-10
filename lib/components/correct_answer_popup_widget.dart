import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CorrectAnswerPopupWidget extends StatefulWidget {
  const CorrectAnswerPopupWidget({
    Key? key,
    this.stream,
  }) : super(key: key);

  final StreamsRecord? stream;

  @override
  _CorrectAnswerPopupWidgetState createState() =>
      _CorrectAnswerPopupWidgetState();
}

class _CorrectAnswerPopupWidgetState extends State<CorrectAnswerPopupWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x33000000),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: StreamBuilder<TriviaRecord>(
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
                final containerTriviaRecord = snapshot.data!;
                return Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        containerTriviaRecord.correctAnswer!,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
