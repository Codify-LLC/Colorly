import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliverySheetWidget extends StatefulWidget {
  const DeliverySheetWidget({
    Key? key,
    this.restaurant,
  }) : super(key: key);

  final RestaurantsRecord? restaurant;

  @override
  _DeliverySheetWidgetState createState() => _DeliverySheetWidgetState();
}

class _DeliverySheetWidgetState extends State<DeliverySheetWidget> {
  ShoppingBagRecord? shoppingBagOutput;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 600,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryDark,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Color(0xFF6B6B6B),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Container(
                              width: double.infinity,
                              color: Color(0xFF6B6B6B),
                              child: ExpandableNotifier(
                                initialExpanded: false,
                                child: ExpandablePanel(
                                  header: Text(
                                    FFLocalizations.of(context).getText(
                                      'ff9csb5g' /* Delivery */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                  ),
                                  collapsed: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF6B6B6B),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '878wn54v' /* Choose a delivery service */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0x8A000000),
                                            ),
                                      ),
                                    ),
                                  ),
                                  expanded: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Stack(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'DELIVERY_SHEET_CircleImage_2hrbwia7_ON_T');
                                                  logFirebaseEvent(
                                                      'CircleImage_Launch-U-R-L');
                                                  await launchURL(widget
                                                      .restaurant!.doordash!);
                                                },
                                                child: Container(
                                                  width: 60,
                                                  height: 60,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    'https://bsmknighterrant.org/wp-content/uploads/2021/05/door-900x500.jpeg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              if (!widget
                                                  .restaurant!.hasDoordash!)
                                                Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xBA333333),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Stack(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'DELIVERY_SHEET_CircleImage_0slt3lwk_ON_T');
                                                  logFirebaseEvent(
                                                      'CircleImage_Launch-U-R-L');
                                                  await launchURL(widget
                                                      .restaurant!.postmates!);
                                                },
                                                child: Container(
                                                  width: 60,
                                                  height: 60,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    'https://archive.esportsobserver.com/wp-content/uploads/2018/07/postmates-e1532108976213.jpg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              if (!widget
                                                  .restaurant!.hasPostmates!)
                                                Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xBA333333),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Stack(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'DELIVERY_SHEET_CircleImage_8zf1fus1_ON_T');
                                                  logFirebaseEvent(
                                                      'CircleImage_Launch-U-R-L');
                                                  await launchURL(widget
                                                      .restaurant!.grubhub!);
                                                },
                                                child: Container(
                                                  width: 60,
                                                  height: 60,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    'https://pbs.twimg.com/profile_images/1430006633548091404/AI2-ZKur_400x400.jpg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              if (!widget
                                                  .restaurant!.hasGrubhub!)
                                                Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xBA333333),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Stack(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'DELIVERY_SHEET_CircleImage_19x9fgqx_ON_T');
                                                    logFirebaseEvent(
                                                        'CircleImage_Launch-U-R-L');
                                                    await launchURL(widget
                                                        .restaurant!
                                                        .clustertruck!);
                                                  },
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      'https://www.clustertruck.com/assets/ClusterTruck.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                if (!widget.restaurant!
                                                    .hasClustertruck!)
                                                  Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xBA333333),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Stack(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'DELIVERY_SHEET_CircleImage_jfrn67j1_ON_T');
                                                    logFirebaseEvent(
                                                        'CircleImage_Launch-U-R-L');
                                                    await launchURL(widget
                                                        .restaurant!.chownow!);
                                                  },
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      'https://donutfriend.com/wp-content/uploads/2017/11/chownow-logo.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                if (!widget
                                                    .restaurant!.hasChownow!)
                                                  Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xBA333333),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Stack(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'DELIVERY_SHEET_CircleImage_7a6czjz6_ON_T');
                                                    logFirebaseEvent(
                                                        'CircleImage_Launch-U-R-L');
                                                    await launchURL(widget
                                                        .restaurant!.ubereats!);
                                                  },
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      'https://toppng.com/uploads/preview/uber-eats-icon-logo-11609380423inqgltu4pe.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                if (!widget
                                                    .restaurant!.hasUbereats!)
                                                  Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xBA333333),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 30),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Color(0xFF6B6B6B),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Container(
                              width: double.infinity,
                              color: Color(0xFF6B6B6B),
                              child: ExpandableNotifier(
                                initialExpanded: false,
                                child: ExpandablePanel(
                                  header: Text(
                                    FFLocalizations.of(context).getText(
                                      '1ir7z9ru' /* Preferred */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                  ),
                                  collapsed: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF6B6B6B),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '20fxi0vh' /* This restaurant prefers this o... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0x8A000000),
                                            ),
                                      ),
                                    ),
                                  ),
                                  expanded: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'DELIVERY_SHEET_COMP_ORDER_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_Backend-Call');

                                                final shoppingBagCreateData =
                                                    createShoppingBagRecordData(
                                                  created: getCurrentTimestamp,
                                                  user: currentUserReference,
                                                  paid: false,
                                                  delivery: false,
                                                );
                                                var shoppingBagRecordReference =
                                                    ShoppingBagRecord.collection
                                                        .doc();
                                                await shoppingBagRecordReference
                                                    .set(shoppingBagCreateData);
                                                shoppingBagOutput = ShoppingBagRecord
                                                    .getDocumentFromData(
                                                        shoppingBagCreateData,
                                                        shoppingBagRecordReference);
                                                logFirebaseEvent(
                                                    'Button_Backend-Call');

                                                final usersUpdateData =
                                                    createUsersRecordData(
                                                  orderingRestaurant: widget
                                                      .restaurant!.reference,
                                                  hasOrderingRestaurant: true,
                                                  shoppingBag:
                                                      shoppingBagOutput!
                                                          .reference,
                                                  distanceToRestaurant:
                                                      functions.distanceInteger(
                                                          currentUserDocument!
                                                              .locationDelivery,
                                                          widget.restaurant!
                                                              .restLatLong),
                                                );
                                                await currentUserReference!
                                                    .update(usersUpdateData);
                                                logFirebaseEvent(
                                                    'Button_Navigate-To');

                                                context.pushNamed(
                                                  'inAppStartOrder',
                                                  queryParams: {
                                                    'restaurant':
                                                        serializeParam(
                                                            widget.restaurant,
                                                            ParamType.Document),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'restaurant':
                                                        widget.restaurant,
                                                  },
                                                );

                                                logFirebaseEvent(
                                                    'Button_Backend-Call');

                                                final restaurantsUpdateData = {
                                                  'orderNowClicks':
                                                      FieldValue.increment(1),
                                                };
                                                await widget
                                                    .restaurant!.reference
                                                    .update(
                                                        restaurantsUpdateData);

                                                setState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '4ohujadc' /* Order */,
                                              ),
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 40,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 4,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (valueOrDefault<bool>(currentUserDocument?.isPremium, false) ==
              false)
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: AuthUserStreamWidget(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2,
                      sigmaY: 2,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '0po288le' /* Premium Feature */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context).title1,
                                  ),
                                  FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'ka8joec2' /* Join */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
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
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
