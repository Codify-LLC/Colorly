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

class CartListWidget extends StatefulWidget {
  const CartListWidget({
    Key? key,
    this.restaurant,
  }) : super(key: key);

  final RestaurantsRecord? restaurant;

  @override
  _CartListWidgetState createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 600,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 4),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'efrwb5ae' /* Delete All Items First */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF57636C),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 4),
            child: AuthUserStreamWidget(
              child: StreamBuilder<RestaurantsRecord>(
                stream: RestaurantsRecord.getDocument(
                    currentUserDocument!.orderingRestaurant!),
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
                  final descriptionTitleRestaurantsRecord = snapshot.data!;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Restaurant: ${descriptionTitleRestaurantsRecord.restaurantName}',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF57636C),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 533,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: StreamBuilder<List<InCartItemRecord>>(
                        stream: queryInCartItemRecord(
                          queryBuilder: (inCartItemRecord) => inCartItemRecord
                              .where('user', isEqualTo: currentUserReference),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: SpinKitThreeBounce(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 30,
                                ),
                              ),
                            );
                          }
                          List<InCartItemRecord> listViewInCartItemRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewInCartItemRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewInCartItemRecord =
                                  listViewInCartItemRecordList[listViewIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        StreamBuilder<MenuItemRecord>(
                                          stream: MenuItemRecord.getDocument(
                                              listViewInCartItemRecord
                                                  .menuItem!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 30,
                                                  height: 30,
                                                  child: SpinKitThreeBounce(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 30,
                                                  ),
                                                ),
                                              );
                                            }
                                            final rowMenuItemRecord =
                                                snapshot.data!;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      child: Image.network(
                                                        rowMenuItemRecord
                                                            .itemImage!,
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: 200,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          rowMenuItemRecord
                                                              .itemName!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30,
                                                      borderWidth: 1,
                                                      buttonSize: 60,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .solidTrashAlt,
                                                        color: Colors.black,
                                                        size: 30,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'CART_LIST_COMP_solidTrashAlt_ICN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'IconButton_Backend-Call');
                                                        await listViewInCartItemRecord
                                                            .reference
                                                            .delete();
                                                        logFirebaseEvent(
                                                            'IconButton_Backend-Call');

                                                        final usersUpdateData =
                                                            createUsersRecordData(
                                                          hasOrderingRestaurant:
                                                              false,
                                                        );
                                                        await currentUserReference!
                                                            .update(
                                                                usersUpdateData);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: AuthUserStreamWidget(
                        child: StreamBuilder<RestaurantsRecord>(
                          stream: RestaurantsRecord.getDocument(
                              currentUserDocument!.orderingRestaurant!),
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
                            final buttonRestaurantsRecord = snapshot.data!;
                            return FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CART_LIST_START_NEW_ORDER_BTN_ON_TAP');
                                logFirebaseEvent('Button_Navigate-To');

                                context.pushNamed(
                                  'inAppStartOrder',
                                  queryParams: {
                                    'restaurant': serializeParam(
                                        widget.restaurant, ParamType.Document),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'restaurant': widget.restaurant,
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'm1r187cv' /* Start New Order */,
                              ),
                              options: FFButtonOptions(
                                width: 150,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
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
                            );
                          },
                        ),
                      ),
                    ),
                    if (valueOrDefault<bool>(
                            currentUserDocument?.hasOrderingRestaurant,
                            false) ==
                        true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: AuthUserStreamWidget(
                          child: StreamBuilder<RestaurantsRecord>(
                            stream: RestaurantsRecord.getDocument(
                                currentUserDocument!.orderingRestaurant!),
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
                              final buttonRestaurantsRecord = snapshot.data!;
                              return FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CART_LIST_COMP_DONE_BTN_ON_TAP');
                                  logFirebaseEvent('Button_Backend-Call');

                                  final usersUpdateData = createUsersRecordData(
                                    hasOrderingRestaurant: true,
                                    orderingRestaurant:
                                        widget.restaurant!.reference,
                                  );
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                },
                                text: FFLocalizations.of(context).getText(
                                  'iypz3hbd' /* Done */,
                                ),
                                options: FFButtonOptions(
                                  width: 150,
                                  height: 50,
                                  color:
                                      FlutterFlowTheme.of(context).primaryDark,
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
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
