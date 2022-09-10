import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseLocationWidget extends StatefulWidget {
  const ChooseLocationWidget({
    Key? key,
    this.stream,
  }) : super(key: key);

  final StreamsRecord? stream;

  @override
  _ChooseLocationWidgetState createState() => _ChooseLocationWidgetState();
}

class _ChooseLocationWidgetState extends State<ChooseLocationWidget> {
  var placePickerValue = FFPlace();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
      child: Container(
        width: double.infinity,
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
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 10),
              child: FlutterFlowPlacePicker(
                iOSGoogleMapsApiKey: 'AIzaSyBH1fZaBJ0aBUx4Y6fjsVaEs6cD9FhYgow',
                androidGoogleMapsApiKey:
                    'AIzaSyB8YLpQ-pVGaEOSZEfaoDBbniyzNHREMP0',
                webGoogleMapsApiKey: 'AIzaSyCI7LeCn7jPdiTPwKiLhn6xMxPlcLevReM',
                onSelect: (place) async {
                  setState(() => placePickerValue = place);
                },
                defaultText: FFLocalizations.of(context).getText(
                  'j7eoskzy' /* Select Location */,
                ),
                icon: Icon(
                  Icons.place,
                  color: Colors.white,
                  size: 16,
                ),
                buttonOptions: FFButtonOptions(
                  width: 200,
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
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('CHOOSE_LOCATION_ADD_LOCATION_BTN_ON_TAP');
                logFirebaseEvent('Button_Backend-Call');

                final streamsUpdateData = createStreamsRecordData(
                  location: placePickerValue.latLng,
                );
                await widget.stream!.reference.update(streamsUpdateData);
                logFirebaseEvent('Button_Bottom-Sheet');
                Navigator.pop(context);
              },
              text: FFLocalizations.of(context).getText(
                'he1r41j4' /* Add Location */,
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
          ],
        ),
      ),
    );
  }
}
