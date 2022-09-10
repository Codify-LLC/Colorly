import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderTransactionsWidget extends StatefulWidget {
  const OrderTransactionsWidget({Key? key}) : super(key: key);

  @override
  _OrderTransactionsWidgetState createState() =>
      _OrderTransactionsWidgetState();
}

class _OrderTransactionsWidgetState extends State<OrderTransactionsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'orderTransactions'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF090F13),
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('ORDER_TRANSACTIONS_arrow_back_rounded_IC');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            's3vxa02g' /* Order History */,
          ),
          style: FlutterFlowTheme.of(context).subtitle1.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF090F13),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: InkWell(
              onTap: () async {
                logFirebaseEvent('ORDER_TRANSACTIONS_Icon_ssqbei0v_ON_TAP');
                logFirebaseEvent('Icon_Navigate-To');

                context.pushNamed('userProfile');
              },
              child: Icon(
                Icons.person_rounded,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'xuzvarxo' /* Active */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF57636C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: StreamBuilder<List<OrderRecord>>(
                    stream: queryOrderRecord(
                      queryBuilder: (orderRecord) => orderRecord
                          .where('user', isEqualTo: currentUserReference)
                          .orderBy('timestamp', descending: true),
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
                      List<OrderRecord> listViewOrderRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewOrderRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewOrderRecord =
                              listViewOrderRecordList[listViewIndex];
                          return Visibility(
                            visible: !listViewOrderRecord.ready!,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ORDER_TRANSACTIONS_Container_h5nod6s1_ON');
                                  logFirebaseEvent('Container_Navigate-To');

                                  context.pushNamed(
                                    'orderStatus',
                                    queryParams: {
                                      'order': serializeParam(
                                          listViewOrderRecord,
                                          ParamType.Document),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'order': listViewOrderRecord,
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x520E151B),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        StreamBuilder<RestaurantsRecord>(
                                          stream: RestaurantsRecord.getDocument(
                                              listViewOrderRecord.restaurant!),
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
                                            final imageRestaurantsRecord =
                                                snapshot.data!;
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              child: CachedNetworkImage(
                                                imageUrl: imageRestaurantsRecord
                                                    .logo!,
                                                width: 80,
                                                height: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listViewOrderRecord
                                                      .orderNumber!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF090F13),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        'M/d h:mm a',
                                                        listViewOrderRecord
                                                            .timestamp!),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          formatNumber(
                                            listViewOrderRecord.orderTotal!,
                                            formatType: FormatType.decimal,
                                            decimalType: DecimalType.automatic,
                                            currency: '\$',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF57636C),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'cizoefnt' /* Completed */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF57636C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: StreamBuilder<List<OrderRecord>>(
                    stream: queryOrderRecord(
                      queryBuilder: (orderRecord) => orderRecord
                          .where('user', isEqualTo: currentUserReference)
                          .orderBy('timestamp', descending: true),
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
                      List<OrderRecord> listViewOrderRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewOrderRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewOrderRecord =
                              listViewOrderRecordList[listViewIndex];
                          return Visibility(
                            visible: listViewOrderRecord.ready ?? true,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ORDER_TRANSACTIONS_Container_es50999u_ON');
                                  logFirebaseEvent('Container_Navigate-To');

                                  context.pushNamed(
                                    'orderStatus',
                                    queryParams: {
                                      'order': serializeParam(
                                          listViewOrderRecord,
                                          ParamType.Document),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'order': listViewOrderRecord,
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5,
                                        color: Color(0x520E151B),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: StreamBuilder<OrderRecord>(
                                      stream: OrderRecord.getDocument(
                                          listViewOrderRecord.reference),
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
                                        final rowOrderRecord = snapshot.data!;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            StreamBuilder<RestaurantsRecord>(
                                              stream:
                                                  RestaurantsRecord.getDocument(
                                                      listViewOrderRecord
                                                          .restaurant!),
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
                                                final imageRestaurantsRecord =
                                                    snapshot.data!;
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  child: Image.network(
                                                    imageRestaurantsRecord
                                                        .logo!,
                                                    width: 80,
                                                    height: 80,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listViewOrderRecord
                                                          .orderNumber!,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .subtitle1
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFF090F13),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'M/d h:mm a',
                                                            listViewOrderRecord
                                                                .timestamp!),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Text(
                                              formatNumber(
                                                rowOrderRecord.orderTotal!,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                                currency: '\$',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
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
          ),
        ),
      ),
    );
  }
}
