import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../backend/stripe/payment_manager.dart';
import '../components/no_menu_items_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingCartWidget extends StatefulWidget {
  const ShoppingCartWidget({Key? key}) : super(key: key);

  @override
  _ShoppingCartWidgetState createState() => _ShoppingCartWidgetState();
}

class _ShoppingCartWidgetState extends State<ShoppingCartWidget> {
  OrderRecord? order;
  String? paymentId;
  String? choiceChipsValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'shoppingCart'});
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: StreamBuilder<List<InCartItemRecord>>(
        stream: queryInCartItemRecord(
          queryBuilder: (inCartItemRecord) => inCartItemRecord.where(
              'shoppingBag',
              isEqualTo: currentUserDocument!.shoppingBag),
        ),
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
          List<InCartItemRecord> shoppingCartInCartItemRecordList =
              snapshot.data!;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryDark,
              automaticallyImplyLeading: true,
              leading: InkWell(
                onTap: () async {
                  logFirebaseEvent('SHOPPING_CART_PAGE_Icon_98q1s7lo_ON_TAP');
                  logFirebaseEvent('Icon_Navigate-Back');
                  context.pop();
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                  size: 24,
                ),
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  '4nkoo7m9' /* My Bag */,
                ),
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                    ),
              ),
              actions: [
                StreamBuilder<List<InCartItemRecord>>(
                  stream: queryInCartItemRecord(
                    queryBuilder: (inCartItemRecord) => inCartItemRecord.where(
                        'shoppingBag',
                        isEqualTo: currentUserDocument!.shoppingBag),
                  ),
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
                    List<InCartItemRecord> containerInCartItemRecordList =
                        snapshot.data!;
                    return Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(),
                      child: Stack(
                        alignment: AlignmentDirectional(0, 0),
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            size: 34,
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.3, -0.3),
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primaryDark,
                                shape: BoxShape.circle,
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Align(
                                alignment: AlignmentDirectional(0.35, -0.25),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0, 0),
                                    child: StreamBuilder<ShoppingBagRecord>(
                                      stream: ShoppingBagRecord.getDocument(
                                          currentUserDocument!.shoppingBag!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: SpinKitThreeBounce(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 30,
                                              ),
                                            ),
                                          );
                                        }
                                        final textShoppingBagRecord =
                                            snapshot.data!;
                                        return Text(
                                          valueOrDefault<String>(
                                            containerInCartItemRecordList.length
                                                .toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
              centerTitle: true,
              elevation: 4,
            ),
            backgroundColor: FlutterFlowTheme.of(context).primaryDark,
            body: SafeArea(
              child: StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(currentUserReference!),
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
                  final columnUsersRecord = snapshot.data!;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
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
                              final mainContainerRestaurantsRecord =
                                  snapshot.data!;
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 10),
                                      child: StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            currentUserReference!),
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
                                          final rowProductUsersRecord =
                                              snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: StreamBuilder<
                                                    RestaurantsRecord>(
                                                  stream: RestaurantsRecord
                                                      .getDocument(columnUsersRecord
                                                          .orderingRestaurant!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 30,
                                                          height: 30,
                                                          child:
                                                              SpinKitThreeBounce(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 30,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final columnRestaurantsRecord =
                                                        snapshot.data!;
                                                    return InkWell(
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'SHOPPING_CART_Column_gsiagtcn_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Column_Navigate-To');

                                                        context.pushNamed(
                                                          'inAppStartOrder',
                                                          queryParams: {
                                                            'restaurant':
                                                                serializeParam(
                                                                    columnRestaurantsRecord,
                                                                    ParamType
                                                                        .Document),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'restaurant':
                                                                columnRestaurantsRecord,
                                                          },
                                                        );
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'ut5qbqkx' /* This is an order for restauran... */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF6E6E6E),
                                                                ),
                                                          ),
                                                          Text(
                                                            columnRestaurantsRecord
                                                                .restaurantName!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                  fontSize: 18,
                                                                ),
                                                          ),
                                                          Text(
                                                            columnRestaurantsRecord
                                                                .restAddress!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                  fontSize: 15,
                                                                ),
                                                          ),
                                                        ],
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 300,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Color(0xBA333333),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      5, 0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            40,
                                                                            0),
                                                                child: StreamBuilder<
                                                                    RestaurantsRecord>(
                                                                  stream: RestaurantsRecord
                                                                      .getDocument(
                                                                          columnUsersRecord
                                                                              .orderingRestaurant!),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              30,
                                                                          height:
                                                                              30,
                                                                          child:
                                                                              SpinKitThreeBounce(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final textRestaurantsRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        formatNumber(
                                                                          textRestaurantsRecord
                                                                              .deliveryFee,
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.automatic,
                                                                          currency:
                                                                              '\$',
                                                                        ),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    '${mainContainerRestaurantsRecord.deliveryFee?.toString()} min.',
                                                                    '35 min.',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'yvcdshqp' /* delivery fee */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'e8rzqfar' /* delivery time */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: Container(
                                                        width: 270,
                                                        height: 2,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF6B6B6B),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(99),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10,
                                                                    10, 0, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'pb6hsx5m' /* **This restaurant ONLY deliver... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                              ),
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 5),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'kkmr75ij' /* Delivery Location: */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 5, 10, 5),
                                                  child: Text(
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.address,
                                                        ''),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1, 0),
                                                    children: [
                                                      Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 4,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(40),
                                                        ),
                                                        child: Container(
                                                          width: 196,
                                                          height: 48,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        4,
                                                                        4,
                                                                        4),
                                                            child:
                                                                FlutterFlowChoiceChips(
                                                              initiallySelected:
                                                                  choiceChipsValue !=
                                                                          null
                                                                      ? [
                                                                          choiceChipsValue!
                                                                        ]
                                                                      : [
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'heceuqwj' /* Pickup */,
                                                                          )
                                                                        ],
                                                              options: [
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'xokzo10e' /* Pickup */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'sn7v7bn1' /* Delivery */,
                                                                ))
                                                              ],
                                                              onChanged: (val) =>
                                                                  setState(() =>
                                                                      choiceChipsValue =
                                                                          val?.first),
                                                              selectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                                iconColor:
                                                                    Colors
                                                                        .white,
                                                                iconSize: 18,
                                                                labelPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            8,
                                                                            12,
                                                                            8),
                                                                elevation: 4,
                                                              ),
                                                              unselectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFFDBE2E7),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Color(
                                                                          0xFF262D34),
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                                iconColor: Color(
                                                                    0xFF6B6B6B),
                                                                iconSize: 0,
                                                                labelPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            8,
                                                                            12,
                                                                            8),
                                                                elevation: 0,
                                                              ),
                                                              chipSpacing: 8,
                                                              multiselect:
                                                                  false,
                                                              initialized:
                                                                  choiceChipsValue !=
                                                                      null,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      if (mainContainerRestaurantsRecord
                                                              .deliveryRange! <=
                                                          valueOrDefault<int>(
                                                            functions.distanceInteger(
                                                                currentUserDocument!
                                                                    .locationDelivery,
                                                                mainContainerRestaurantsRecord
                                                                    .restLatLong),
                                                            99,
                                                          ))
                                                        Container(
                                                          width: 100,
                                                          height: 47,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'u31clh7f' /* *Delivery Not Available */,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(40, 2, 40, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        '${mainContainerRestaurantsRecord.pickupTime?.toString()} min',
                                                        '20 min.',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  60, 0, 0, 0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          '${mainContainerRestaurantsRecord.deliveryTime?.toString()} min.',
                                                          '35 min.',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6, 0, 6, 0),
                                              child: StreamBuilder<
                                                  List<InCartItemRecord>>(
                                                stream: queryInCartItemRecord(
                                                  queryBuilder: (inCartItemRecord) =>
                                                      inCartItemRecord.where(
                                                          'shoppingBag',
                                                          isEqualTo:
                                                              currentUserDocument!
                                                                  .shoppingBag),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 30,
                                                        height: 30,
                                                        child:
                                                            SpinKitThreeBounce(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<InCartItemRecord>
                                                      listViewInCartItemRecordList =
                                                      snapshot.data!;
                                                  if (listViewInCartItemRecordList
                                                      .isEmpty) {
                                                    return NoMenuItemsWidget();
                                                  }
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewInCartItemRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewInCartItemRecord =
                                                          listViewInCartItemRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 10),
                                                        child: StreamBuilder<
                                                            InCartItemRecord>(
                                                          stream: InCartItemRecord
                                                              .getDocument(
                                                                  listViewInCartItemRecord
                                                                      .reference),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 30,
                                                                  height: 30,
                                                                  child:
                                                                      SpinKitThreeBounce(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    size: 30,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final productContainerInCartItemRecord =
                                                                snapshot.data!;
                                                            return Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.9,
                                                              height: 230,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4,
                                                                    color: Color(
                                                                        0x3A000000),
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            2),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 0,
                                                                ),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            30,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            40,
                                                                        icon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidTrashAlt,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'SHOPPING_CART_solidTrashAlt_ICN_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'IconButton_Backend-Call');

                                                                          final usersUpdateData =
                                                                              {
                                                                            'shoppingCart':
                                                                                FieldValue.arrayRemove([
                                                                              productContainerInCartItemRecord.reference
                                                                            ]),
                                                                          };
                                                                          await currentUserReference!
                                                                              .update(usersUpdateData);
                                                                          logFirebaseEvent(
                                                                              'IconButton_Backend-Call');
                                                                          await productContainerInCartItemRecord
                                                                              .reference
                                                                              .delete();
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            color:
                                                                                Colors.white,
                                                                            child:
                                                                                ExpandableNotifier(
                                                                              initialExpanded: false,
                                                                              child: ExpandablePanel(
                                                                                header: StreamBuilder<MenuItemRecord>(
                                                                                  stream: MenuItemRecord.getDocument(productContainerInCartItemRecord.menuItem!),
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
                                                                                    final textMenuItemRecord = snapshot.data!;
                                                                                    return Text(
                                                                                      textMenuItemRecord.itemName!,
                                                                                      style: FlutterFlowTheme.of(context).title1.override(
                                                                                            fontFamily: 'Lexend Deca',
                                                                                            color: Colors.black,
                                                                                          ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                collapsed: Container(
                                                                                  width: MediaQuery.of(context).size.width,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFEEEEEE),
                                                                                    borderRadius: BorderRadius.circular(16),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                                                                                              child: StreamBuilder<MenuItemRecord>(
                                                                                                stream: MenuItemRecord.getDocument(productContainerInCartItemRecord.menuItem!),
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
                                                                                                  final imageColumnMenuItemRecord = snapshot.data!;
                                                                                                  return Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                                          child: CachedNetworkImage(
                                                                                                            imageUrl: valueOrDefault<String>(
                                                                                                              imageColumnMenuItemRecord.itemImage,
                                                                                                              'https://cdn.vox-cdn.com/thumbor/9qN-DmdwZE__GqwuoJIinjUXzmk=/0x0:960x646/1200x900/filters:focal(404x247:556x399)/cdn.vox-cdn.com/uploads/chorus_image/image/63084260/foodlife_2.0.jpg',
                                                                                                            ),
                                                                                                            width: 74,
                                                                                                            height: 74,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          formatNumber(
                                                                                                            productContainerInCartItemRecord.price,
                                                                                                            formatType: FormatType.decimal,
                                                                                                            decimalType: DecimalType.automatic,
                                                                                                            currency: '\$',
                                                                                                          ),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                              fontSize: 18,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 200,
                                                                                              height: 100,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0xFFEEEEEE),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                                                                                                child: StreamBuilder<MenuItemRecord>(
                                                                                                  stream: MenuItemRecord.getDocument(productContainerInCartItemRecord.menuItem!),
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
                                                                                                    final imageColumnMenuItemRecord = snapshot.data!;
                                                                                                    return Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Text(
                                                                                                            imageColumnMenuItemRecord.itemDescription!.maybeHandleOverflow(
                                                                                                              maxChars: 60,
                                                                                                              replacement: '…',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                                  fontSize: 18,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
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
                                                                                ),
                                                                                expanded: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: StreamBuilder<List<Option1Record>>(
                                                                                            stream: queryOption1Record(),
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
                                                                                              List<Option1Record> listViewOption1RecordList = snapshot.data!;
                                                                                              return ListView.builder(
                                                                                                padding: EdgeInsets.zero,
                                                                                                shrinkWrap: true,
                                                                                                scrollDirection: Axis.vertical,
                                                                                                itemCount: listViewOption1RecordList.length,
                                                                                                itemBuilder: (context, listViewIndex) {
                                                                                                  final listViewOption1Record = listViewOption1RecordList[listViewIndex];
                                                                                                  return Visibility(
                                                                                                    visible: productContainerInCartItemRecord.option1!.toList().contains(listViewOption1Record.reference),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                                                                                      child: StreamBuilder<Option1Record>(
                                                                                                        stream: Option1Record.getDocument(listViewOption1Record.reference),
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
                                                                                                          final containerOption1Record = snapshot.data!;
                                                                                                          return Container(
                                                                                                            width: 100,
                                                                                                            height: 25,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: Color(0xFFEEEEEE),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                                              child: Text(
                                                                                                                containerOption1Record.option1Name!,
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                                      color: Color(0xFF090F13),
                                                                                                                      fontSize: 14,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
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
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                                            child: StreamBuilder<InCartItemRecord>(
                                                                                              stream: InCartItemRecord.getDocument(productContainerInCartItemRecord.reference),
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
                                                                                                final productVariableInCartItemRecord = snapshot.data!;
                                                                                                return Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    productContainerInCartItemRecord.specialNote,
                                                                                                    'no special instructions',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Lexend Deca',
                                                                                                        color: Color(0xFF090F13),
                                                                                                        fontSize: 14,
                                                                                                        fontWeight: FontWeight.normal,
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
                                                                                theme: ExpandableThemeData(
                                                                                  tapHeaderToExpand: true,
                                                                                  tapBodyToExpand: false,
                                                                                  tapBodyToCollapse: false,
                                                                                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                  hasIcon: true,
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
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 12, 0, 0),
                                      child:
                                          StreamBuilder<List<InCartItemRecord>>(
                                        stream: queryInCartItemRecord(
                                          queryBuilder: (inCartItemRecord) =>
                                              inCartItemRecord.where(
                                                  'shoppingBag',
                                                  isEqualTo:
                                                      currentUserDocument!
                                                          .shoppingBag),
                                        ),
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
                                          List<InCartItemRecord>
                                              orderSummaryInCartItemRecordList =
                                              snapshot.data!;
                                          return Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.96,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  color: Color(0x3A000000),
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: StreamBuilder<
                                                RestaurantsRecord>(
                                              stream:
                                                  RestaurantsRecord.getDocument(
                                                      columnUsersRecord
                                                          .orderingRestaurant!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 30,
                                                      height: 30,
                                                      child: SpinKitThreeBounce(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final columnRestaurantsRecord =
                                                    snapshot.data!;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 16,
                                                                  16, 12),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'vpax0hxc' /* Order Summary */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 0, 16, 8),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'r914y6lt' /* Subtotal */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF8B97A2),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'q4cm5hsw' /* $ */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Color(0xFF111417),
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    functions
                                                                        .totalCartPrice(orderSummaryInCartItemRecordList
                                                                            .map((e) =>
                                                                                e.price!)
                                                                            .toList())
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Color(0xFF111417),
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 0, 16, 8),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'dohdaqs4' /* Tax */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF8B97A2),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'hxhwmpll' /* $ */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Color(0xFF111417),
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    functions
                                                                        .subtotalTax(
                                                                            orderSummaryInCartItemRecordList.map((e) => e.price!).toList(),
                                                                            10.0)
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Color(0xFF111417),
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 0,
                                                                  16, 12),
                                                      child: StreamBuilder<
                                                          RestaurantsRecord>(
                                                        stream: RestaurantsRecord
                                                            .getDocument(
                                                                columnRestaurantsRecord
                                                                    .reference),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 30,
                                                                height: 30,
                                                                child:
                                                                    SpinKitThreeBounce(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 30,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final shippingRestaurantsRecord =
                                                              snapshot.data!;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '40tat5wu' /* Delivery */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Color(
                                                                          0xFF8B97A2),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    shippingRestaurantsRecord
                                                                        .deliveryFee,
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .automatic,
                                                                    currency:
                                                                        '\$',
                                                                  ),
                                                                  '0',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Color(
                                                                          0xFF111417),
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 12,
                                                                  16, 16),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'ehmjcars' /* Total */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF8B97A2),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'wdmrfnyb' /* $ */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Color(0xFF151B1E),
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions
                                                                          .orderTotalCopy(
                                                                              functions.totalCartPrice(orderSummaryInCartItemRecordList.map((e) => e.price!).toList()),
                                                                              functions.subtotalTax(orderSummaryInCartItemRecordList.map((e) => e.price!).toList(), 10.0),
                                                                              columnRestaurantsRecord.deliveryFee?.toDouble())
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Color(0xFF151B1E),
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Divider(
                                      height: 2,
                                      thickness: 1,
                                      indent: 16,
                                      endIndent: 16,
                                      color: Colors.transparent,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 30),
                                      child: StreamBuilder<RestaurantsRecord>(
                                        stream: RestaurantsRecord.getDocument(
                                            columnUsersRecord
                                                .orderingRestaurant!),
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
                                          final buttonRestaurantsRecord =
                                              snapshot.data!;
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'SHOPPING_CART_PROCEED_TO_CHECKOUT_BTN_ON');
                                              logFirebaseEvent(
                                                  'Button_Stripe-Payment');
                                              final paymentResponse =
                                                  await processStripePayment(
                                                amount: functions
                                                    .orderTotal(
                                                        functions.totalCartPrice(
                                                            shoppingCartInCartItemRecordList
                                                                .map((e) =>
                                                                    e.price!)
                                                                .toList()),
                                                        functions.subtotalTax(
                                                            shoppingCartInCartItemRecordList
                                                                .map((e) =>
                                                                    e.price!)
                                                                .toList(),
                                                            10.0),
                                                        buttonRestaurantsRecord
                                                            .deliveryFee
                                                            ?.toDouble())
                                                    .round(),
                                                currency: 'USD',
                                                customerEmail: currentUserEmail,
                                                customerName:
                                                    valueOrDefault<String>(
                                                  currentUserDisplayName,
                                                  'Colorly App Order',
                                                ),
                                                description:
                                                    'Colorly app order Purchase',
                                                allowGooglePay: true,
                                                allowApplePay: true,
                                                themeStyle: ThemeMode.dark,
                                                buttonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              );
                                              if (paymentResponse.paymentId ==
                                                  null) {
                                                if (paymentResponse
                                                        .errorMessage !=
                                                    null) {
                                                  showSnackbar(
                                                    context,
                                                    'Error: ${paymentResponse.errorMessage}',
                                                  );
                                                }
                                                return;
                                              }
                                              paymentId =
                                                  paymentResponse.paymentId!;

                                              if (paymentId != null &&
                                                  paymentId != '') {
                                                logFirebaseEvent(
                                                    'Button_Backend-Call');

                                                final orderCreateData = {
                                                  ...createOrderRecordData(
                                                    user: currentUserReference,
                                                    orderNumber: random_data
                                                        .randomString(
                                                      10,
                                                      10,
                                                      true,
                                                      false,
                                                      true,
                                                    ),
                                                    paid: true,
                                                    restaurant:
                                                        columnUsersRecord
                                                            .orderingRestaurant,
                                                    type: choiceChipsValue,
                                                    orderTotal: functions.orderTotalCopy(
                                                        functions.totalCartPrice(
                                                            shoppingCartInCartItemRecordList
                                                                .map((e) =>
                                                                    e.price!)
                                                                .toList()),
                                                        functions.subtotalTax(
                                                            shoppingCartInCartItemRecordList
                                                                .map((e) =>
                                                                    e.price!)
                                                                .toList(),
                                                            10.0),
                                                        buttonRestaurantsRecord
                                                            .deliveryFee
                                                            ?.toDouble()),
                                                    submitted: true,
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                    shoppingBag:
                                                        currentUserDocument!
                                                            .shoppingBag,
                                                  ),
                                                  'inCartItems':
                                                      shoppingCartInCartItemRecordList
                                                          .map((e) =>
                                                              e.reference)
                                                          .toList(),
                                                };
                                                var orderRecordReference =
                                                    OrderRecord.collection
                                                        .doc();
                                                await orderRecordReference
                                                    .set(orderCreateData);
                                                order = OrderRecord
                                                    .getDocumentFromData(
                                                        orderCreateData,
                                                        orderRecordReference);
                                                logFirebaseEvent(
                                                    'Button_Navigate-To');

                                                context.goNamed('orderSuccess');

                                                logFirebaseEvent(
                                                    'Button_Trigger-Push-Notification');
                                                triggerPushNotification(
                                                  notificationTitle:
                                                      'New Order 🥳',
                                                  notificationText:
                                                      'You\'ve received an order from ${columnUsersRecord.displayName}',
                                                  notificationSound: 'default',
                                                  userRefs: [
                                                    buttonRestaurantsRecord
                                                        .userConnection!
                                                  ],
                                                  initialPageName:
                                                      'restaurantOrders',
                                                  parameterData: {
                                                    'restaurant':
                                                        buttonRestaurantsRecord,
                                                  },
                                                );
                                                logFirebaseEvent(
                                                    'Button_Backend-Call');

                                                final usersUpdateData = {
                                                  'shoppingBag':
                                                      FieldValue.delete(),
                                                  'orderingRestaurant':
                                                      FieldValue.delete(),
                                                };
                                                await currentUserReference!
                                                    .update(usersUpdateData);
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_Show-Snack-Bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Error: Payment Failed',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiaryColor,
                                                  ),
                                                );
                                              }

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'szjn0gxf' /* Proceed to Checkout */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 320,
                                              height: 60,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              elevation: 3,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
