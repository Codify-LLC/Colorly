import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdventurePopUpWidget extends StatefulWidget {
  const AdventurePopUpWidget({
    Key? key,
    this.restaurant,
    this.user,
    this.adventure,
  }) : super(key: key);

  final RestaurantsRecord? restaurant;
  final UsersRecord? user;
  final AdventuresRecord? adventure;

  @override
  _AdventurePopUpWidgetState createState() => _AdventurePopUpWidgetState();
}

class _AdventurePopUpWidgetState extends State<AdventurePopUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Container(
        width: double.infinity,
        height: 520,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 7,
              color: Color(0x32171717),
              offset: Offset(0, -4),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: Color(0xFFDBE2E7),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'cp6a4hjn' /* Mark Your Adventure */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF090F13),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'inqkuqfw' /* Adventures are a great way to ... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF57636C),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Color(0x32171717),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/happy-couple-having-burger-LRW8TMS.jpg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Color(0x950F0F0F),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '7wnroqe7' /* Enjoy With Friends & Family */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'm1vavrlv' /* Choose where it goes */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF57636C),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: AuthUserStreamWidget(
                  child: StreamBuilder<AdventuresRecord>(
                    stream: AdventuresRecord.getDocument(
                        currentUserDocument!.adventureRef!),
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
                      final rowAdventuresRecord = snapshot.data!;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: StreamBuilder<RestaurantsRecord>(
                              stream: RestaurantsRecord.getDocument(
                                  rowAdventuresRecord.slot1!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: SpinKitThreeBounce(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 30,
                                      ),
                                    ),
                                  );
                                }
                                final circleImageRestaurantsRecord =
                                    snapshot.data!;
                                return InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'ADVENTURE_POP_UP_CircleImage_tufnlbcu_ON');
                                    logFirebaseEvent(
                                        'CircleImage_Backend-Call');

                                    final adventuresUpdateData =
                                        createAdventuresRecordData(
                                      slot1: widget.restaurant!.reference,
                                    );
                                    await rowAdventuresRecord.reference
                                        .update(adventuresUpdateData);
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      circleImageRestaurantsRecord.logo!,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.plus,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: StreamBuilder<RestaurantsRecord>(
                              stream: RestaurantsRecord.getDocument(
                                  rowAdventuresRecord.slot2!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: SpinKitThreeBounce(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 30,
                                      ),
                                    ),
                                  );
                                }
                                final containerRestaurantsRecord =
                                    snapshot.data!;
                                return Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'ADVENTURE_POP_UP_CircleImage_8lp0f43e_ON');
                                      logFirebaseEvent(
                                          'CircleImage_Backend-Call');

                                      final adventuresUpdateData =
                                          createAdventuresRecordData(
                                        slot2: widget.restaurant!.reference,
                                      );
                                      await rowAdventuresRecord.reference
                                          .update(adventuresUpdateData);
                                    },
                                    child: Container(
                                      width: 120,
                                      height: 120,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        containerRestaurantsRecord.logo!,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.plus,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: StreamBuilder<RestaurantsRecord>(
                              stream: RestaurantsRecord.getDocument(
                                  rowAdventuresRecord.slot3!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: SpinKitThreeBounce(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 30,
                                      ),
                                    ),
                                  );
                                }
                                final containerRestaurantsRecord =
                                    snapshot.data!;
                                return Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'ADVENTURE_POP_UP_CircleImage_3tqe3ibv_ON');
                                      logFirebaseEvent(
                                          'CircleImage_Backend-Call');

                                      final adventuresUpdateData =
                                          createAdventuresRecordData(
                                        slot3: widget.restaurant!.reference,
                                      );
                                      await rowAdventuresRecord.reference
                                          .update(adventuresUpdateData);
                                    },
                                    child: Container(
                                      width: 120,
                                      height: 120,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        containerRestaurantsRecord.logo!,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: AuthUserStreamWidget(
                  child: StreamBuilder<AdventuresRecord>(
                    stream: AdventuresRecord.getDocument(
                        currentUserDocument!.adventureRef!),
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
                      final rowAdventuresRecord = snapshot.data!;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: Icon(
                                  Icons.arrow_circle_up_rounded,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADVENTURE_POP_UP_arrow_circle_up_rounded');
                                  logFirebaseEvent('IconButton_Backend-Call');

                                  final adventuresUpdateData =
                                      createAdventuresRecordData(
                                    slot1: widget.restaurant!.reference,
                                  );
                                  await rowAdventuresRecord.reference
                                      .update(adventuresUpdateData);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: StreamBuilder<RestaurantsRecord>(
                              stream: RestaurantsRecord.getDocument(
                                  rowAdventuresRecord.slot2!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: SpinKitThreeBounce(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 30,
                                      ),
                                    ),
                                  );
                                }
                                final containerRestaurantsRecord =
                                    snapshot.data!;
                                return Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.arrow_circle_up_rounded,
                                      color: Colors.black,
                                      size: 40,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'ADVENTURE_POP_UP_arrow_circle_up_rounded');
                                      logFirebaseEvent(
                                          'IconButton_Backend-Call');

                                      final adventuresUpdateData =
                                          createAdventuresRecordData(
                                        slot2: widget.restaurant!.reference,
                                      );
                                      await rowAdventuresRecord.reference
                                          .update(adventuresUpdateData);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                            child: StreamBuilder<RestaurantsRecord>(
                              stream: RestaurantsRecord.getDocument(
                                  rowAdventuresRecord.slot3!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: SpinKitThreeBounce(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 30,
                                      ),
                                    ),
                                  );
                                }
                                final containerRestaurantsRecord =
                                    snapshot.data!;
                                return Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.arrow_circle_up_rounded,
                                      color: Colors.black,
                                      size: 40,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'ADVENTURE_POP_UP_arrow_circle_up_rounded');
                                      logFirebaseEvent(
                                          'IconButton_Backend-Call');

                                      final adventuresUpdateData =
                                          createAdventuresRecordData(
                                        slot3: widget.restaurant!.reference,
                                      );
                                      await rowAdventuresRecord.reference
                                          .update(adventuresUpdateData);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 44),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ADVENTURE_POP_UP_LOOKS_GOOD!_BTN_ON_TAP');
                    logFirebaseEvent('Button_Navigate-Back');
                    context.pop();
                  },
                  text: FFLocalizations.of(context).getText(
                    'vk6cso0o' /* Looks Good! */,
                  ),
                  options: FFButtonOptions(
                    width: 350,
                    height: 60,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 2,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
