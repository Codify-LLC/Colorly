import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'toggle_notifications_model.dart';
export 'toggle_notifications_model.dart';

class ToggleNotificationsWidget extends StatefulWidget {
  const ToggleNotificationsWidget({Key? key}) : super(key: key);

  @override
  _ToggleNotificationsWidgetState createState() =>
      _ToggleNotificationsWidgetState();
}

class _ToggleNotificationsWidgetState extends State<ToggleNotificationsWidget> {
  late ToggleNotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToggleNotificationsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'toggleNotifications'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'toggleNotifications',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 22.0,
              ),
              onPressed: () async {
                logFirebaseEvent('TOGGLE_NOTIFICATIONS_arrow_back_rounded_');
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'i4c3zn8k' /* Settings */,
              ),
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22.0,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'e0ydgtl3' /* Choose what notifcations you w... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: SwitchListTile.adaptive(
                  value: _model.switchListTileValue1 ??= true,
                  onChanged: (newValue) async {
                    setState(() => _model.switchListTileValue1 = newValue!);
                  },
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'vk9ffct9' /* Push Notifications */,
                    ),
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                  ),
                  subtitle: Text(
                    FFLocalizations.of(context).getText(
                      'qlp7awm5' /* Receive Push notifications fro... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                  activeColor: FlutterFlowTheme.of(context).primaryColor,
                  activeTrackColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                ),
              ),
              SwitchListTile.adaptive(
                value: _model.switchListTileValue2 ??= true,
                onChanged: (newValue) async {
                  setState(() => _model.switchListTileValue2 = newValue!);
                },
                title: Text(
                  FFLocalizations.of(context).getText(
                    'f3mmrrfi' /* Email Notifications */,
                  ),
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
                subtitle: Text(
                  FFLocalizations.of(context).getText(
                    '0ucriqi6' /* Receive email notifications fr... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
                activeColor: FlutterFlowTheme.of(context).primaryColor,
                activeTrackColor:
                    FlutterFlowTheme.of(context).primaryBackground,
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
              ),
              SwitchListTile.adaptive(
                value: _model.switchListTileValue3 ??= true,
                onChanged: (newValue) async {
                  setState(() => _model.switchListTileValue3 = newValue!);
                },
                title: Text(
                  FFLocalizations.of(context).getText(
                    'lh1yl6wp' /* Location Services */,
                  ),
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
                subtitle: Text(
                  FFLocalizations.of(context).getText(
                    'iowwuoz9' /* Allow us to track your locatio... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
                activeColor: FlutterFlowTheme.of(context).primaryColor,
                activeTrackColor:
                    FlutterFlowTheme.of(context).primaryBackground,
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
              ),
            ],
          ),
        ));
  }
}
