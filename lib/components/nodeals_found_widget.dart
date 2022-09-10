import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NodealsFoundWidget extends StatefulWidget {
  const NodealsFoundWidget({Key? key}) : super(key: key);

  @override
  _NodealsFoundWidgetState createState() => _NodealsFoundWidgetState();
}

class _NodealsFoundWidgetState extends State<NodealsFoundWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Image.asset(
                'assets/images/No_Deals_Found_(2).png',
                width: MediaQuery.of(context).size.width,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        FFButtonWidget(
          onPressed: () async {
            logFirebaseEvent('NODEALS_FOUND_SEE_ALL_DEALS_BTN_ON_TAP');
            logFirebaseEvent('Button_Navigate-To');

            context.pushNamed('dealPage');
          },
          text: FFLocalizations.of(context).getText(
            'jp9afosg' /* See all deals */,
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
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}
