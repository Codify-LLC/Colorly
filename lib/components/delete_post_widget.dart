import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DeletePostWidget extends StatefulWidget {
  const DeletePostWidget({
    Key? key,
    this.post,
  }) : super(key: key);

  final PostsRecord? post;

  @override
  _DeletePostWidgetState createState() => _DeletePostWidgetState();
}

class _DeletePostWidgetState extends State<DeletePostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 200,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryDark,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('DELETE_POST_COMP_DELETE_POST_BTN_ON_TAP');
                logFirebaseEvent('Button_Backend-Call');
                await widget.post!.reference.delete();
                logFirebaseEvent('Button_Alert-Dialog');
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Confirm'),
                          content: Text(
                              'Are you sure you want to delete this post?'),
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
                  logFirebaseEvent('Button_Navigate-Back');
                  context.pop();
                }
                logFirebaseEvent('Button_Backend-Call');

                final usersUpdateData = {
                  'fizzzCoin': FieldValue.increment(-20),
                  'fizzzMonthly': FieldValue.increment(-20),
                };
                await currentUserReference!.update(usersUpdateData);
              },
              text: FFLocalizations.of(context).getText(
                '73lrfw7j' /* Delete Post */,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 60,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('DELETE_POST_COMP_CANCEL_BTN_ON_TAP');
                  logFirebaseEvent('Button_Navigate-Back');
                  context.pop();
                },
                text: FFLocalizations.of(context).getText(
                  'vupr1x5q' /* Cancel */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60,
                  color: Color(0xFF2F2F2F),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
