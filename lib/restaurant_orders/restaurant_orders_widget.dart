import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantOrdersWidget extends StatefulWidget {
  const RestaurantOrdersWidget({
    Key? key,
    this.restaurant,
  }) : super(key: key);

  final RestaurantsRecord? restaurant;

  @override
  _RestaurantOrdersWidgetState createState() => _RestaurantOrdersWidgetState();
}

class _RestaurantOrdersWidgetState extends State<RestaurantOrdersWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'restaurantOrders'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('RESTAURANT_ORDERS_chevron_left_rounded_I');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            '9244aitk' /* Our Orders */,
          ),
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: Text(
                          widget.restaurant!.restaurantName!,
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xC0FFFFFF),
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 12),
                            child: Container(
                              width: 140,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x1F000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'foawwdqe' /* Received */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                    StreamBuilder<List<OrderRecord>>(
                                      stream: queryOrderRecord(
                                        queryBuilder: (orderRecord) =>
                                            orderRecord.where('restaurant',
                                                isEqualTo: widget
                                                    .restaurant!.reference),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 30,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OrderRecord> textOrderRecordList =
                                            snapshot.data!;
                                        return Text(
                                          textOrderRecordList.length.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .title1,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 12),
                            child: Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x1F000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'e76q15la' /* Preparing */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                    StreamBuilder<List<OrderRecord>>(
                                      stream: queryOrderRecord(
                                        queryBuilder: (orderRecord) =>
                                            orderRecord
                                                .where('restaurant',
                                                    isEqualTo: widget
                                                        .restaurant!.reference)
                                                .where('preparing',
                                                    isEqualTo: true),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 30,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OrderRecord> textOrderRecordList =
                                            snapshot.data!;
                                        return Text(
                                          textOrderRecordList.length.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .title1,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                            child: Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x1F000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'mhusi4ec' /* Completed */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                    StreamBuilder<List<OrderRecord>>(
                                      stream: queryOrderRecord(
                                        queryBuilder: (orderRecord) =>
                                            orderRecord
                                                .where('restaurant',
                                                    isEqualTo: widget
                                                        .restaurant!.reference)
                                                .where('ready',
                                                    isEqualTo: true),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 30,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OrderRecord> textOrderRecordList =
                                            snapshot.data!;
                                        return Text(
                                          textOrderRecordList.length.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .title1,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryColor,
                        labelStyle: FlutterFlowTheme.of(context).bodyText1,
                        indicatorColor:
                            FlutterFlowTheme.of(context).secondaryColor,
                        tabs: [
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              '2r0m5r1i' /* Received */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'ukzw7qwc' /* Preparing */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'dylkj99e' /* Complete */,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'bak82h7x' /* Received */,
                                      ),
                                      style:
                                          FlutterFlowTheme.of(context).title2,
                                    ),
                                    StreamBuilder<List<OrderRecord>>(
                                      stream: queryOrderRecord(
                                        queryBuilder: (orderRecord) =>
                                            orderRecord.where('restaurant',
                                                isEqualTo: widget
                                                    .restaurant!.reference),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 30,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OrderRecord> textOrderRecordList =
                                            snapshot.data!;
                                        return Text(
                                          '${valueOrDefault<String>(
                                            textOrderRecordList.length
                                                .toString(),
                                            '0',
                                          )} orders',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        );
                                      },
                                    ),
                                    Divider(
                                      height: 24,
                                      thickness: 1,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    StreamBuilder<List<OrderRecord>>(
                                      stream: queryOrderRecord(
                                        queryBuilder: (orderRecord) =>
                                            orderRecord
                                                .where('restaurant',
                                                    isEqualTo: widget
                                                        .restaurant!.reference)
                                                .where('submitted',
                                                    isEqualTo: true)
                                                .orderBy('timestamp',
                                                    descending: true),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 30,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OrderRecord>
                                            columnOrderRecordList =
                                            snapshot.data!;
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnOrderRecordList.length,
                                              (columnIndex) {
                                            final columnOrderRecord =
                                                columnOrderRecordList[
                                                    columnIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 4,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.95,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 10, 10),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  columnOrderRecord
                                                                      .user!),
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
                                                            final textUsersRecord =
                                                                snapshot.data!;
                                                            return Text(
                                                              textUsersRecord
                                                                  .displayName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title1,
                                                            );
                                                          },
                                                        ),
                                                        if (columnOrderRecord
                                                                .paid ??
                                                            true)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        3),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'nrp4putz' /* Paid */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF229F22),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        Divider(
                                                          thickness: 2,
                                                          color:
                                                              Color(0x4AC3C3C3),
                                                        ),
                                                        StreamBuilder<
                                                            List<
                                                                InCartItemRecord>>(
                                                          stream:
                                                              queryInCartItemRecord(
                                                            queryBuilder: (inCartItemRecord) =>
                                                                inCartItemRecord.where(
                                                                    'shoppingBag',
                                                                    isEqualTo:
                                                                        columnOrderRecord
                                                                            .shoppingBag),
                                                          ),
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
                                                            List<InCartItemRecord>
                                                                columnInCartItemRecordList =
                                                                snapshot.data!;
                                                            return SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: List.generate(
                                                                    columnInCartItemRecordList
                                                                        .length,
                                                                    (columnIndex) {
                                                                  final columnInCartItemRecord =
                                                                      columnInCartItemRecordList[
                                                                          columnIndex];
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              MenuItemRecord>(
                                                                            stream:
                                                                                MenuItemRecord.getDocument(columnInCartItemRecord.menuItem!),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                                '${columnInCartItemRecord.quantity?.toString()} x ${textMenuItemRecord.itemName}',
                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                              );
                                                                            },
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                              child: Text(
                                                                                '*${columnInCartItemRecord.specialNote}',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Color(0xFF640404),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final options2 = columnInCartItemRecord
                                                                              .option1!
                                                                              .toList();
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(options2.length, (options2Index) {
                                                                              final options2Item = options2[options2Index];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 5),
                                                                                child: StreamBuilder<Option1Record>(
                                                                                  stream: Option1Record.getDocument(options2Item),
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
                                                                                    final textOption1Record = snapshot.data!;
                                                                                    return Text(
                                                                                      textOption1Record.option1Name!,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              );
                                                                            }),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                }),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ListView(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Container(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 4,
                                                                                        color: Color(0x520E151B),
                                                                                        offset: Offset(0, 2),
                                                                                      )
                                                                                    ],
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                    child: Container(
                                                                                      width: 120,
                                                                                      height: 120,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/icons_hand,-mobile,-phone,-check,-check-mark,-tick.png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('RESTAURANT_ORDERS_Container_m80g9oaj_ON_');
                                                                                    logFirebaseEvent('Container_Backend-Call');

                                                                                    final orderUpdateData = createOrderRecordData(
                                                                                      confirmed: true,
                                                                                    );
                                                                                    await columnOrderRecord.reference.update(orderUpdateData);
                                                                                    logFirebaseEvent('Container_Trigger-Push-Notification');
                                                                                    triggerPushNotification(
                                                                                      notificationTitle: widget.restaurant!.restaurantName!,
                                                                                      notificationText: 'Your Order has been confirmed.',
                                                                                      notificationImageUrl: widget.restaurant!.logo,
                                                                                      notificationSound: 'default',
                                                                                      userRefs: [
                                                                                        columnOrderRecord.user!
                                                                                      ],
                                                                                      initialPageName: 'orderStatus',
                                                                                      parameterData: {
                                                                                        'order': columnOrderRecord,
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFEEEEEE),
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4,
                                                                                          color: Color(0x520E151B),
                                                                                          offset: Offset(0, 2),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                      child: Container(
                                                                                        width: 120,
                                                                                        height: 120,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/Icon_ecommerce-market-place-of-destination.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (columnOrderRecord.confirmed ?? true)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4,
                                                                                          color: Color(0x520E151B),
                                                                                          offset: Offset(0, 2),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                      child: Container(
                                                                                        width: 120,
                                                                                        height: 120,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/Icon_ecommerce-market-place-of-destination.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('RESTAURANT_ORDERS_Container_vlr64xob_ON_');
                                                                                    logFirebaseEvent('Container_Backend-Call');

                                                                                    final orderUpdateData = createOrderRecordData(
                                                                                      preparing: true,
                                                                                      confirmed: false,
                                                                                      submitted: false,
                                                                                    );
                                                                                    await columnOrderRecord.reference.update(orderUpdateData);
                                                                                    logFirebaseEvent('Container_Trigger-Push-Notification');
                                                                                    triggerPushNotification(
                                                                                      notificationTitle: widget.restaurant!.restaurantName!,
                                                                                      notificationText: 'Your Order is being prepared ♨️',
                                                                                      notificationImageUrl: widget.restaurant!.logo,
                                                                                      notificationSound: 'default',
                                                                                      userRefs: [
                                                                                        columnOrderRecord.user!
                                                                                      ],
                                                                                      initialPageName: 'orderStatus',
                                                                                      parameterData: {
                                                                                        'order': columnOrderRecord,
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFEEEEEE),
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4,
                                                                                          color: Color(0x520E151B),
                                                                                          offset: Offset(0, 2),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                      child: Container(
                                                                                        width: 120,
                                                                                        height: 120,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/Icon_food,-order,-online-food,-dish,-hand.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (columnOrderRecord.preparing ?? true)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4,
                                                                                          color: Color(0x520E151B),
                                                                                          offset: Offset(0, 2),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                      child: Container(
                                                                                        width: 120,
                                                                                        height: 120,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/Icon_food,-order,-online-food,-dish,-hand.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('RESTAURANT_ORDERS_Container_4bp7ufar_ON_');
                                                                                    logFirebaseEvent('Container_Backend-Call');

                                                                                    final orderUpdateData = createOrderRecordData(
                                                                                      ready: true,
                                                                                      preparing: false,
                                                                                      confirmed: false,
                                                                                      submitted: false,
                                                                                    );
                                                                                    await columnOrderRecord.reference.update(orderUpdateData);
                                                                                    if (columnOrderRecord.type == 'Pickup') {
                                                                                      logFirebaseEvent('Container_Trigger-Push-Notification');
                                                                                      triggerPushNotification(
                                                                                        notificationTitle: widget.restaurant!.restaurantName!,
                                                                                        notificationText: 'Your Order is ready for pickup! 🥤',
                                                                                        notificationImageUrl: widget.restaurant!.logo,
                                                                                        notificationSound: 'default',
                                                                                        userRefs: [
                                                                                          columnOrderRecord.user!
                                                                                        ],
                                                                                        initialPageName: 'orderStatus',
                                                                                        parameterData: {
                                                                                          'order': columnOrderRecord,
                                                                                        },
                                                                                      );
                                                                                    } else {
                                                                                      logFirebaseEvent('Container_Trigger-Push-Notification');
                                                                                      triggerPushNotification(
                                                                                        notificationTitle: widget.restaurant!.restaurantName!,
                                                                                        notificationText: 'Your Order is on the way! 🚘',
                                                                                        notificationImageUrl: widget.restaurant!.logo,
                                                                                        notificationSound: 'default',
                                                                                        userRefs: [
                                                                                          columnOrderRecord.user!
                                                                                        ],
                                                                                        initialPageName: 'orderStatus',
                                                                                        parameterData: {
                                                                                          'order': columnOrderRecord,
                                                                                        },
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFEEEEEE),
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4,
                                                                                          color: Color(0x520E151B),
                                                                                          offset: Offset(0, 2),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                      child: Container(
                                                                                        width: 120,
                                                                                        height: 120,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/Icon_shop,-bag,-food.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (columnOrderRecord.ready ?? true)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4,
                                                                                          color: Color(0x520E151B),
                                                                                          offset: Offset(0, 2),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                      child: Container(
                                                                                        width: 120,
                                                                                        height: 120,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/Icon_shop,-bag,-food.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '98ec8gm9' /* Preparing */,
                                      ),
                                      style:
                                          FlutterFlowTheme.of(context).title2,
                                    ),
                                    StreamBuilder<List<OrderRecord>>(
                                      stream: queryOrderRecord(
                                        queryBuilder: (orderRecord) =>
                                            orderRecord
                                                .where('restaurant',
                                                    isEqualTo: widget
                                                        .restaurant!.reference)
                                                .where('preparing',
                                                    isEqualTo: true),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 30,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OrderRecord> textOrderRecordList =
                                            snapshot.data!;
                                        return Text(
                                          '${valueOrDefault<String>(
                                            textOrderRecordList.length
                                                .toString(),
                                            '0',
                                          )} orders',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        );
                                      },
                                    ),
                                    Divider(
                                      height: 24,
                                      thickness: 1,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    StreamBuilder<List<OrderRecord>>(
                                      stream: queryOrderRecord(
                                        queryBuilder: (orderRecord) =>
                                            orderRecord
                                                .where('restaurant',
                                                    isEqualTo: widget
                                                        .restaurant!.reference)
                                                .where('preparing',
                                                    isEqualTo: true)
                                                .orderBy('timestamp',
                                                    descending: true),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 30,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OrderRecord>
                                            columnOrderRecordList =
                                            snapshot.data!;
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnOrderRecordList.length,
                                              (columnIndex) {
                                            final columnOrderRecord =
                                                columnOrderRecordList[
                                                    columnIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 4,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.95,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 10, 10),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  columnOrderRecord
                                                                      .user!),
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
                                                            final textUsersRecord =
                                                                snapshot.data!;
                                                            return Text(
                                                              textUsersRecord
                                                                  .displayName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title1,
                                                            );
                                                          },
                                                        ),
                                                        if (columnOrderRecord
                                                                .paid ??
                                                            true)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        3),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'ozu6kd1f' /* Paid */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF229F22),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        Divider(
                                                          thickness: 2,
                                                          color:
                                                              Color(0x4AC3C3C3),
                                                        ),
                                                        StreamBuilder<
                                                            List<
                                                                InCartItemRecord>>(
                                                          stream:
                                                              queryInCartItemRecord(
                                                            queryBuilder: (inCartItemRecord) =>
                                                                inCartItemRecord.where(
                                                                    'shoppingBag',
                                                                    isEqualTo:
                                                                        columnOrderRecord
                                                                            .shoppingBag),
                                                          ),
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
                                                            List<InCartItemRecord>
                                                                columnInCartItemRecordList =
                                                                snapshot.data!;
                                                            return SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: List.generate(
                                                                    columnInCartItemRecordList
                                                                        .length,
                                                                    (columnIndex) {
                                                                  final columnInCartItemRecord =
                                                                      columnInCartItemRecordList[
                                                                          columnIndex];
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              MenuItemRecord>(
                                                                            stream:
                                                                                MenuItemRecord.getDocument(columnInCartItemRecord.menuItem!),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                                '${columnInCartItemRecord.quantity?.toString()} x ${textMenuItemRecord.itemName}',
                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                              );
                                                                            },
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                              child: Text(
                                                                                '*${columnInCartItemRecord.specialNote}',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Color(0xFF640404),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final options1 = columnInCartItemRecord
                                                                              .option1!
                                                                              .toList();
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(options1.length, (options1Index) {
                                                                              final options1Item = options1[options1Index];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 5),
                                                                                child: StreamBuilder<Option1Record>(
                                                                                  stream: Option1Record.getDocument(options1Item),
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
                                                                                    final textOption1Record = snapshot.data!;
                                                                                    return Text(
                                                                                      textOption1Record.option1Name!,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              );
                                                                            }),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                }),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ListView(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Container(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 4,
                                                                                        color: Color(0x520E151B),
                                                                                        offset: Offset(0, 2),
                                                                                      )
                                                                                    ],
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                    child: Container(
                                                                                      width: 120,
                                                                                      height: 120,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/icons_hand,-mobile,-phone,-check,-check-mark,-tick.png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Container(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 4,
                                                                                        color: Color(0x520E151B),
                                                                                        offset: Offset(0, 2),
                                                                                      )
                                                                                    ],
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                    child: Container(
                                                                                      width: 120,
                                                                                      height: 120,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/Icon_ecommerce-market-place-of-destination.png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (columnOrderRecord.confirmed ?? true)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4,
                                                                                          color: Color(0x520E151B),
                                                                                          offset: Offset(0, 2),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                      child: Container(
                                                                                        width: 120,
                                                                                        height: 120,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/Icon_ecommerce-market-place-of-destination.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Container(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 4,
                                                                                        color: Color(0x520E151B),
                                                                                        offset: Offset(0, 2),
                                                                                      )
                                                                                    ],
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                    child: Container(
                                                                                      width: 120,
                                                                                      height: 120,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/Icon_food,-order,-online-food,-dish,-hand.png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (columnOrderRecord.preparing ?? true)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4,
                                                                                          color: Color(0x520E151B),
                                                                                          offset: Offset(0, 2),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                      child: Container(
                                                                                        width: 120,
                                                                                        height: 120,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/Icon_food,-order,-online-food,-dish,-hand.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('RESTAURANT_ORDERS_Container_lxecz5ja_ON_');
                                                                                    logFirebaseEvent('Container_Backend-Call');

                                                                                    final orderUpdateData = createOrderRecordData(
                                                                                      ready: true,
                                                                                      preparing: false,
                                                                                      confirmed: false,
                                                                                      submitted: false,
                                                                                    );
                                                                                    await columnOrderRecord.reference.update(orderUpdateData);
                                                                                    if (columnOrderRecord.type == 'Pickup') {
                                                                                      logFirebaseEvent('Container_Trigger-Push-Notification');
                                                                                      triggerPushNotification(
                                                                                        notificationTitle: widget.restaurant!.restaurantName!,
                                                                                        notificationText: 'Your Order is ready for pickup! 🥤',
                                                                                        notificationImageUrl: widget.restaurant!.logo,
                                                                                        notificationSound: 'default',
                                                                                        userRefs: [
                                                                                          columnOrderRecord.user!
                                                                                        ],
                                                                                        initialPageName: 'orderStatus',
                                                                                        parameterData: {
                                                                                          'order': columnOrderRecord,
                                                                                        },
                                                                                      );
                                                                                    } else {
                                                                                      logFirebaseEvent('Container_Trigger-Push-Notification');
                                                                                      triggerPushNotification(
                                                                                        notificationTitle: widget.restaurant!.restaurantName!,
                                                                                        notificationText: 'Your Order is on the way! 🚘',
                                                                                        notificationImageUrl: widget.restaurant!.logo,
                                                                                        notificationSound: 'default',
                                                                                        userRefs: [
                                                                                          columnOrderRecord.user!
                                                                                        ],
                                                                                        initialPageName: 'orderStatus',
                                                                                        parameterData: {
                                                                                          'order': columnOrderRecord,
                                                                                        },
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFEEEEEE),
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4,
                                                                                          color: Color(0x520E151B),
                                                                                          offset: Offset(0, 2),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                      child: Container(
                                                                                        width: 120,
                                                                                        height: 120,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/Icon_shop,-bag,-food.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (columnOrderRecord.ready ?? true)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4,
                                                                                          color: Color(0x520E151B),
                                                                                          offset: Offset(0, 2),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                      child: Container(
                                                                                        width: 120,
                                                                                        height: 120,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/Icon_shop,-bag,-food.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'dfuwoi4k' /* Ready/Complete */,
                                      ),
                                      style:
                                          FlutterFlowTheme.of(context).title2,
                                    ),
                                    StreamBuilder<List<OrderRecord>>(
                                      stream: queryOrderRecord(
                                        queryBuilder: (orderRecord) =>
                                            orderRecord
                                                .where('restaurant',
                                                    isEqualTo: widget
                                                        .restaurant!.reference)
                                                .where('ready',
                                                    isEqualTo: true),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 30,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OrderRecord> textOrderRecordList =
                                            snapshot.data!;
                                        return Text(
                                          '${valueOrDefault<String>(
                                            textOrderRecordList.length
                                                .toString(),
                                            '0',
                                          )} orders',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        );
                                      },
                                    ),
                                    Divider(
                                      height: 24,
                                      thickness: 1,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    StreamBuilder<List<OrderRecord>>(
                                      stream: queryOrderRecord(
                                        queryBuilder: (orderRecord) =>
                                            orderRecord
                                                .where('restaurant',
                                                    isEqualTo: widget
                                                        .restaurant!.reference)
                                                .where('ready', isEqualTo: true)
                                                .orderBy('timestamp',
                                                    descending: true),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 30,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OrderRecord>
                                            columnOrderRecordList =
                                            snapshot.data!;
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnOrderRecordList.length,
                                              (columnIndex) {
                                            final columnOrderRecord =
                                                columnOrderRecordList[
                                                    columnIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 4,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.95,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 10, 10),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  columnOrderRecord
                                                                      .user!),
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
                                                            final textUsersRecord =
                                                                snapshot.data!;
                                                            return Text(
                                                              textUsersRecord
                                                                  .displayName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title1,
                                                            );
                                                          },
                                                        ),
                                                        if (columnOrderRecord
                                                                .paid ??
                                                            true)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        3),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'pa2l46ek' /* Paid */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF229F22),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        Divider(
                                                          thickness: 2,
                                                          color:
                                                              Color(0x4AC3C3C3),
                                                        ),
                                                        StreamBuilder<
                                                            List<
                                                                InCartItemRecord>>(
                                                          stream:
                                                              queryInCartItemRecord(
                                                            queryBuilder: (inCartItemRecord) =>
                                                                inCartItemRecord.where(
                                                                    'shoppingBag',
                                                                    isEqualTo:
                                                                        columnOrderRecord
                                                                            .shoppingBag),
                                                          ),
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
                                                            List<InCartItemRecord>
                                                                columnInCartItemRecordList =
                                                                snapshot.data!;
                                                            return SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: List.generate(
                                                                    columnInCartItemRecordList
                                                                        .length,
                                                                    (columnIndex) {
                                                                  final columnInCartItemRecord =
                                                                      columnInCartItemRecordList[
                                                                          columnIndex];
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              MenuItemRecord>(
                                                                            stream:
                                                                                MenuItemRecord.getDocument(columnInCartItemRecord.menuItem!),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                                '${columnInCartItemRecord.quantity?.toString()} x ${textMenuItemRecord.itemName}',
                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                              );
                                                                            },
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                              child: Text(
                                                                                '*${columnInCartItemRecord.specialNote}',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Color(0xFF640404),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final options = columnInCartItemRecord
                                                                              .option1!
                                                                              .toList();
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(options.length, (optionsIndex) {
                                                                              final optionsItem = options[optionsIndex];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 5),
                                                                                child: StreamBuilder<Option1Record>(
                                                                                  stream: Option1Record.getDocument(optionsItem),
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
                                                                                    final textOption1Record = snapshot.data!;
                                                                                    return Text(
                                                                                      textOption1Record.option1Name!,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              );
                                                                            }),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                }),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ListView(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Container(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 4,
                                                                                        color: Color(0x520E151B),
                                                                                        offset: Offset(0, 2),
                                                                                      )
                                                                                    ],
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                    child: Container(
                                                                                      width: 120,
                                                                                      height: 120,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/icons_hand,-mobile,-phone,-check,-check-mark,-tick.png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Container(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 4,
                                                                                        color: Color(0x520E151B),
                                                                                        offset: Offset(0, 2),
                                                                                      )
                                                                                    ],
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                    child: Container(
                                                                                      width: 120,
                                                                                      height: 120,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/Icon_ecommerce-market-place-of-destination.png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (columnOrderRecord.confirmed ?? true)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4,
                                                                                          color: Color(0x520E151B),
                                                                                          offset: Offset(0, 2),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                      child: Container(
                                                                                        width: 120,
                                                                                        height: 120,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/Icon_ecommerce-market-place-of-destination.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Container(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 4,
                                                                                        color: Color(0x520E151B),
                                                                                        offset: Offset(0, 2),
                                                                                      )
                                                                                    ],
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                    child: Container(
                                                                                      width: 120,
                                                                                      height: 120,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/Icon_food,-order,-online-food,-dish,-hand.png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (columnOrderRecord.preparing ?? true)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4,
                                                                                          color: Color(0x520E151B),
                                                                                          offset: Offset(0, 2),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                      child: Container(
                                                                                        width: 120,
                                                                                        height: 120,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/Icon_food,-order,-online-food,-dish,-hand.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                child: Container(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFF229F22),
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 4,
                                                                                        color: Color(0x520E151B),
                                                                                        offset: Offset(0, 2),
                                                                                      )
                                                                                    ],
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                    child: Container(
                                                                                      width: 120,
                                                                                      height: 120,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.asset(
                                                                                        'assets/images/Icon_shop,-bag,-food.png',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (columnOrderRecord.ready ?? true)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4,
                                                                                          color: Color(0x520E151B),
                                                                                          offset: Offset(0, 2),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                      child: Container(
                                                                                        width: 120,
                                                                                        height: 120,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/Icon_shop,-bag,-food.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
