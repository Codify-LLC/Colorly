import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/no_menu_items_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderStatusWidget extends StatefulWidget {
  const OrderStatusWidget({
    Key? key,
    this.order,
  }) : super(key: key);

  final OrderRecord? order;

  @override
  _OrderStatusWidgetState createState() => _OrderStatusWidgetState();
}

class _OrderStatusWidgetState extends State<OrderStatusWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'orderStatus'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<InCartItemRecord>>(
      stream: queryInCartItemRecord(
        queryBuilder: (inCartItemRecord) => inCartItemRecord
            .where('shoppingBag', isEqualTo: widget.order!.shoppingBag),
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
        List<InCartItemRecord> orderStatusInCartItemRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryDark,
            automaticallyImplyLeading: true,
            leading: InkWell(
              onTap: () async {
                logFirebaseEvent('ORDER_STATUS_PAGE_Icon_utf9swq3_ON_TAP');
                logFirebaseEvent('Icon_Navigate-To');

                context.pushNamed('homePage');
              },
              child: Icon(
                Icons.home_rounded,
                color: FlutterFlowTheme.of(context).tertiaryColor,
                size: 24,
              ),
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                '4u6tyrip' /* Order Status */,
              ),
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                  ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 2,
                borderWidth: 1,
                buttonSize: 50,
                icon: Icon(
                  Icons.person_rounded,
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                  size: 24,
                ),
                onPressed: () async {
                  logFirebaseEvent('ORDER_STATUS_person_rounded_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_Navigate-To');

                  context.pushNamed('userProfile');
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 50,
                icon: Icon(
                  Icons.receipt_long,
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                  size: 24,
                ),
                onPressed: () async {
                  logFirebaseEvent('ORDER_STATUS_receipt_long_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_Navigate-To');

                  context.pushNamed('orderTransactions');
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
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                            color: FlutterFlowTheme.of(context)
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
                                          child:
                                              StreamBuilder<RestaurantsRecord>(
                                            stream:
                                                RestaurantsRecord.getDocument(
                                                    widget.order!.restaurant!),
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
                                              return InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'ORDER_STATUS_PAGE_Column_ofipsi0g_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Column_Navigate-To');

                                                  context.pushNamed(
                                                    'inAppStartOrder',
                                                    queryParams: {
                                                      'restaurant': serializeParam(
                                                          columnRestaurantsRecord,
                                                          ParamType.Document),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
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
                                                        'v6q5t9c9' /* This is an order for restauran... */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          if (widget.order!.submitted ?? true)
                                            Image.asset(
                                              'assets/images/order_status_graphic_1.png',
                                              fit: BoxFit.fill,
                                            ),
                                          if (widget.order!.confirmed ?? true)
                                            Image.asset(
                                              'assets/images/order_status_graphic_2.png',
                                              fit: BoxFit.fill,
                                            ),
                                          if (widget.order!.preparing ?? true)
                                            Image.asset(
                                              'assets/images/order_status_graphic_3.png',
                                              fit: BoxFit.fill,
                                            ),
                                          if (widget.order!.ready ?? true)
                                            Image.asset(
                                              'assets/images/order_status_graphic_4.png',
                                              fit: BoxFit.fill,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6, 0, 6, 0),
                                        child: StreamBuilder<
                                            List<InCartItemRecord>>(
                                          stream: queryInCartItemRecord(
                                            queryBuilder: (inCartItemRecord) =>
                                                inCartItemRecord.where(
                                                    'shoppingBag',
                                                    isEqualTo: widget
                                                        .order!.shoppingBag),
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
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewInCartItemRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewInCartItemRecord =
                                                    listViewInCartItemRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: StreamBuilder<
                                                      InCartItemRecord>(
                                                    stream: InCartItemRecord
                                                        .getDocument(
                                                            listViewInCartItemRecord
                                                                .reference),
                                                    builder:
                                                        (context, snapshot) {
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
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4,
                                                              color: Color(
                                                                  0x3A000000),
                                                              offset:
                                                                  Offset(0, 2),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                            color: Colors.white,
                                                            width: 0,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
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
                                                                      width: double
                                                                          .infinity,
                                                                      color: Colors
                                                                          .white,
                                                                      child:
                                                                          ExpandableNotifier(
                                                                        initialExpanded:
                                                                            false,
                                                                        child:
                                                                            ExpandablePanel(
                                                                          header:
                                                                              StreamBuilder<MenuItemRecord>(
                                                                            stream:
                                                                                MenuItemRecord.getDocument(productContainerInCartItemRecord.menuItem!),
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
                                                                                textMenuItemRecord.itemName!,
                                                                                style: FlutterFlowTheme.of(context).title1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Colors.black,
                                                                                      fontSize: 18,
                                                                                    ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          collapsed:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFEEEEEE),
                                                                              borderRadius: BorderRadius.circular(16),
                                                                            ),
                                                                            child:
                                                                                Padding(
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
                                                                          expanded:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                          theme:
                                                                              ExpandableThemeData(
                                                                            tapHeaderToExpand:
                                                                                true,
                                                                            tapBodyToExpand:
                                                                                false,
                                                                            tapBodyToCollapse:
                                                                                false,
                                                                            headerAlignment:
                                                                                ExpandablePanelHeaderAlignment.center,
                                                                            hasIcon:
                                                                                true,
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
                                    0, 12, 0, 20),
                                child: StreamBuilder<List<InCartItemRecord>>(
                                  stream: queryInCartItemRecord(
                                    queryBuilder: (inCartItemRecord) =>
                                        inCartItemRecord.where('shoppingBag',
                                            isEqualTo:
                                                widget.order!.shoppingBag),
                                  ),
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
                                    List<InCartItemRecord>
                                        orderSummaryInCartItemRecordList =
                                        snapshot.data!;
                                    return Container(
                                      width: MediaQuery.of(context).size.width *
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
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: StreamBuilder<RestaurantsRecord>(
                                        stream: RestaurantsRecord.getDocument(
                                            widget.order!.restaurant!),
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
                                          final columnRestaurantsRecord =
                                              snapshot.data!;
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 16, 16, 12),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'z86oqq9e' /* Order Summary */,
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
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 16, 8),
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
                                                        'qwq4uvks' /* Subtotal */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'wvil5rr5' /* $ */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                            Text(
                                                              functions
                                                                  .totalCartPrice(orderSummaryInCartItemRecordList
                                                                      .map((e) =>
                                                                          e.price!)
                                                                      .toList())
                                                                  .toString(),
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 16, 8),
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
                                                        'mt67laej' /* Tax */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'mhkixjuf' /* $ */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                            Text(
                                                              functions
                                                                  .subtotalTax(
                                                                      orderSummaryInCartItemRecordList
                                                                          .map((e) =>
                                                                              e.price!)
                                                                          .toList(),
                                                                      10.0)
                                                                  .toString(),
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 16, 12),
                                                child: StreamBuilder<
                                                    RestaurantsRecord>(
                                                  stream: RestaurantsRecord
                                                      .getDocument(
                                                          columnRestaurantsRecord
                                                              .reference),
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
                                                    final shippingRestaurantsRecord =
                                                        snapshot.data!;
                                                    return Row(
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
                                                            'frr0w8sp' /* Delivery */,
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
                                                              currency: '\$',
                                                            ),
                                                            '0',
                                                          ),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF111417),
                                                                fontSize: 16,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 12, 16, 16),
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
                                                        'c57ji2bh' /* Total */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'snsyluhr' /* $ */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF151B1E),
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions
                                                                    .orderTotalCopy(
                                                                        functions.totalCartPrice(orderSummaryInCartItemRecordList
                                                                            .map((e) => e
                                                                                .price!)
                                                                            .toList()),
                                                                        functions.subtotalTax(
                                                                            orderSummaryInCartItemRecordList
                                                                                .map((e) => e
                                                                                    .price!)
                                                                                .toList(),
                                                                            10.0),
                                                                        columnRestaurantsRecord
                                                                            .deliveryFee
                                                                            ?.toDouble())
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF151B1E),
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
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
                            ],
                          ),
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
    );
  }
}
