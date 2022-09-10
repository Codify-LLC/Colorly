import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteItemWidget extends StatefulWidget {
  const DeleteItemWidget({
    Key? key,
    this.itemParameter,
  }) : super(key: key);

  final MenuItemRecord? itemParameter;

  @override
  _DeleteItemWidgetState createState() => _DeleteItemWidgetState();
}

class _DeleteItemWidgetState extends State<DeleteItemWidget> {
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
                logFirebaseEvent('DELETE_ITEM_COMP_DELETE_ITEM_BTN_ON_TAP');
                logFirebaseEvent('Button_Backend-Call');
                await widget.itemParameter!.reference.delete();
                logFirebaseEvent('Button_Navigate-Back');
                context.pop();
              },
              text: FFLocalizations.of(context).getText(
                '7oishyie' /* Delete Item */,
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
                  logFirebaseEvent('DELETE_ITEM_COMP_CANCEL_BTN_ON_TAP');
                  logFirebaseEvent('Button_Navigate-Back');
                  context.pop();
                },
                text: FFLocalizations.of(context).getText(
                  'c2gi3uon' /* Cancel */,
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
