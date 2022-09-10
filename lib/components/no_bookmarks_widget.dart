import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NoBookmarksWidget extends StatefulWidget {
  const NoBookmarksWidget({Key? key}) : super(key: key);

  @override
  _NoBookmarksWidgetState createState() => _NoBookmarksWidgetState();
}

class _NoBookmarksWidgetState extends State<NoBookmarksWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 400,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryDark,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/images/Untitled_design_(15).gif',
                width: MediaQuery.of(context).size.width,
                height: 300,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '51d4i0c5' /* No Bookmarks */,
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '2mepw3qp' /* Be sure ot bookmark your favor... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xABFFFFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
