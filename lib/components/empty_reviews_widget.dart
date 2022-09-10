import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyReviewsWidget extends StatefulWidget {
  const EmptyReviewsWidget({
    Key? key,
    this.restaurant,
  }) : super(key: key);

  final RestaurantsRecord? restaurant;

  @override
  _EmptyReviewsWidgetState createState() => _EmptyReviewsWidgetState();
}

class _EmptyReviewsWidgetState extends State<EmptyReviewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.videocam_off_outlined,
          color: Color(0xFF8B97A2),
          size: 20,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'cu89r4nh' /* Seems there are no reviews */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF090F13),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  FFLocalizations.of(context).getText(
                    'jly92ee7' /* Be the first to leave a review */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF8B97A2),
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ],
          ),
        ),
        FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 10,
          borderWidth: 1,
          buttonSize: 50,
          icon: Icon(
            Icons.add_circle_rounded,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 25,
          ),
          onPressed: () async {
            logFirebaseEvent('EMPTY_REVIEWS_add_circle_rounded_ICN_ON_');
            logFirebaseEvent('IconButton_Navigate-To');

            context.pushNamed(
              'submitReviewPage',
              queryParams: {
                'restaurant':
                    serializeParam(widget.restaurant, ParamType.Document),
              }.withoutNulls,
              extra: <String, dynamic>{
                'restaurant': widget.restaurant,
              },
            );
          },
        ),
      ],
    );
  }
}
