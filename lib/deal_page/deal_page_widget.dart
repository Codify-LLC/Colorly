import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/deal_popup_copy_widget.dart';
import '../components/deal_popup_widget.dart';
import '../components/no_deals_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DealPageWidget extends StatefulWidget {
  const DealPageWidget({Key? key}) : super(key: key);

  @override
  _DealPageWidgetState createState() => _DealPageWidgetState();
}

class _DealPageWidgetState extends State<DealPageWidget> {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'dealPage'});
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
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
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryDark,
        automaticallyImplyLeading: true,
        title: Text(
          FFLocalizations.of(context).getText(
            'l572ekc9' /* Deals & Discounts */,
          ),
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).tertiaryColor,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryDark,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'adz1tztn' /* Featured */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: StreamBuilder<List<DealsRecord>>(
                            stream: queryDealsRecord(
                              queryBuilder: (dealsRecord) => dealsRecord
                                  .where('promoted', isEqualTo: true)
                                  .where('active', isEqualTo: true)
                                  .where('expiry',
                                      isGreaterThanOrEqualTo:
                                          getCurrentTimestamp)
                                  .orderBy('expiry'),
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
                              List<DealsRecord> listViewDealsRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: listViewDealsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewDealsRecord =
                                      listViewDealsRecordList[listViewIndex];
                                  return Visibility(
                                    visible: !(currentUserDocument?.usedDeals
                                                ?.toList() ??
                                            [])
                                        .contains(
                                            listViewDealsRecord.reference),
                                    child: AuthUserStreamWidget(
                                      child: Container(
                                        width: 375,
                                        child: Stack(
                                          alignment: AlignmentDirectional(0, 0),
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 12, 16, 0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.86,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 3,
                                                      color: Color(0x25000000),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'DEAL_PAGE_PAGE_Row_p5mhrfh0_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Row_Bottom-Sheet');
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child: Container(
                                                            height: 800,
                                                            child:
                                                                DealPopupWidget(
                                                              deal:
                                                                  listViewDealsRecord,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 4, 4, 4),
                                                        child: Container(
                                                          width: 4,
                                                          height: 90,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 200,
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12,
                                                                      12,
                                                                      16,
                                                                      12),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                listViewDealsRecord
                                                                    .title!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .title2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Color(
                                                                          0xFF090F13),
                                                                      fontSize:
                                                                          22,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  listViewDealsRecord
                                                                      .details!
                                                                      .maybeHandleOverflow(
                                                                    maxChars:
                                                                        21,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: Color(
                                                                            0xFF090F13),
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Until ${dateTimeFormat('MMMEd', listViewDealsRecord.expiry)}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: Color(
                                                                            0xFF874E00),
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 5,
                                                            height: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 5,
                                                            height: 5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 5,
                                                            height: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 5,
                                                            height: 5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 5,
                                                            height: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 5,
                                                            height: 5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 5,
                                                            height: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 5,
                                                            height: 5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 5,
                                                            height: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 5,
                                                            height: 5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 5,
                                                            height: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 5,
                                                            height: 5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 5,
                                                            height: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryDark,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 1,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryDark,
                                                      )
                                                    ],
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0.6, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: StreamBuilder<
                                                    RestaurantsRecord>(
                                                  stream: RestaurantsRecord
                                                      .getDocument(
                                                          listViewDealsRecord
                                                              .restRef!),
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
                                                    final circleImageRestaurantsRecord =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 60,
                                                      height: 60,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            circleImageRestaurantsRecord
                                                                .logo!,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            if (listViewDealsRecord.userSaved!
                                                .toList()
                                                .contains(currentUserReference))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.75, -0.65),
                                                child: Icon(
                                                  Icons.favorite_rounded,
                                                  color: Color(0xFFB20000),
                                                  size: 24,
                                                ),
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
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '67f2zhs9' /* Within 10 miles */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Lexend Deca',
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                child: FutureBuilder<List<DealsRecord>>(
                                  future: DealsRecord.search(
                                    location: getCurrentUserLocation(
                                        defaultLocation:
                                            LatLng(37.4298229, -122.1735655)),
                                    searchRadiusMeters: 10093,
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
                                    List<DealsRecord> listViewDealsRecordList =
                                        snapshot.data!;
                                    if (listViewDealsRecordList.isEmpty) {
                                      return NoDealsWidget();
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewDealsRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewDealsRecord =
                                            listViewDealsRecordList[
                                                listViewIndex];
                                        return InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'DEAL_PAGE_PAGE_Column_x0ignfcr_ON_TAP');
                                            logFirebaseEvent(
                                                'Column_Bottom-Sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: Container(
                                                    height: 800,
                                                    child: DealPopupCopyWidget(
                                                      deal: listViewDealsRecord,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (listViewDealsRecord.active ??
                                                  true)
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (!(currentUserDocument
                                                                ?.usedDeals
                                                                ?.toList() ??
                                                            [])
                                                        .contains(
                                                            listViewDealsRecord
                                                                .reference))
                                                      AuthUserStreamWidget(
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          12,
                                                                          16,
                                                                          0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'DEAL_PAGE_PAGE_Container_5xey2f5y_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Container_Bottom-Sheet');
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return Padding(
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              800,
                                                                          child:
                                                                              DealPopupCopyWidget(
                                                                            deal:
                                                                                listViewDealsRecord,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.86,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            3,
                                                                        color: Color(
                                                                            0x25000000),
                                                                        offset: Offset(
                                                                            0,
                                                                            2),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4,
                                                                                4,
                                                                                4,
                                                                                4),
                                                                            child:
                                                                                Container(
                                                                              width: 4,
                                                                              height: 90,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                borderRadius: BorderRadius.circular(4),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                200,
                                                                            height:
                                                                                100,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12, 12, 16, 12),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    listViewDealsRecord.title!,
                                                                                    style: FlutterFlowTheme.of(context).title2.override(
                                                                                          fontFamily: 'Lexend Deca',
                                                                                          color: Color(0xFF090F13),
                                                                                          fontSize: 22,
                                                                                          fontWeight: FontWeight.w800,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                    child: Text(
                                                                                      listViewDealsRecord.details!.maybeHandleOverflow(
                                                                                        maxChars: 21,
                                                                                        replacement: '…',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                            fontFamily: 'Lexend Deca',
                                                                                            color: Color(0xFF090F13),
                                                                                            fontSize: 14,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                    child: Text(
                                                                                      'Until ${dateTimeFormat('MMMEd', listViewDealsRecord.expiry)}',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Lexend Deca',
                                                                                            color: Color(0xFF874E00),
                                                                                            fontSize: 14,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: 5,
                                                                                height: 10,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFEEEEEE),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 5,
                                                                                height: 5,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 5,
                                                                                height: 10,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFEEEEEE),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 5,
                                                                                height: 5,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 5,
                                                                                height: 10,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFEEEEEE),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 5,
                                                                                height: 5,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 5,
                                                                                height: 10,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFEEEEEE),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 5,
                                                                                height: 5,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 5,
                                                                                height: 10,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFEEEEEE),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 5,
                                                                                height: 5,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 5,
                                                                                height: 10,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFEEEEEE),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 5,
                                                                                height: 5,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 5,
                                                                                height: 10,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFEEEEEE),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1, 0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            330,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 50,
                                                                  height: 50,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryDark,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            1,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryDark,
                                                                      )
                                                                    ],
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          190,
                                                                          10,
                                                                          0,
                                                                          0),
                                                              child: StreamBuilder<
                                                                  RestaurantsRecord>(
                                                                stream: RestaurantsRecord
                                                                    .getDocument(
                                                                        listViewDealsRecord
                                                                            .restRef!),
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
                                                                  final circleImageRestaurantsRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Container(
                                                                    width: 60,
                                                                    height: 60,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl:
                                                                          circleImageRestaurantsRecord
                                                                              .logo!,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                            ],
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
