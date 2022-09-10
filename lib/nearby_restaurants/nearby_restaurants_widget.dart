import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/delivery_sheet_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class NearbyRestaurantsWidget extends StatefulWidget {
  const NearbyRestaurantsWidget({Key? key}) : super(key: key);

  @override
  _NearbyRestaurantsWidgetState createState() =>
      _NearbyRestaurantsWidgetState();
}

class _NearbyRestaurantsWidgetState extends State<NearbyRestaurantsWidget> {
  Completer<List<RestaurantsRecord>>? _algoliaRequestCompleter;
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'nearbyRestaurants'});
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
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('NEARBY_RESTAURANTS_arrow_back_rounded_IC');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'sqxyatdc' /* Nearby Restaurants */,
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
      backgroundColor: FlutterFlowTheme.of(context).primaryDark,
      body: SafeArea(
        child: FutureBuilder<List<RestaurantsRecord>>(
          future:
              (_algoliaRequestCompleter ??= Completer<List<RestaurantsRecord>>()
                    ..complete(RestaurantsRecord.search(
                      location: getCurrentUserLocation(
                          defaultLocation: LatLng(37.4298229, -122.1735655)),
                      maxResults: 20,
                      searchRadiusMeters: 8000,
                    )))
                  .future,
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
            List<RestaurantsRecord> listViewRestaurantsRecordList =
                snapshot.data!;
            // Customize what your widget looks like with no search results.
            if (snapshot.data!.isEmpty) {
              return Container(
                height: 100,
                child: Center(
                  child: Text('No results.'),
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                logFirebaseEvent('NEARBY_RESTAURANTS_ListView_qg8fo2vc_ON_');
                logFirebaseEvent('ListView_Refresh-Database-Request');
                setState(() => _algoliaRequestCompleter = null);
                await waitForAlgoliaRequestCompleter();
              },
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: listViewRestaurantsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewRestaurantsRecord =
                      listViewRestaurantsRecordList[listViewIndex];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                              child: StreamBuilder<RestaurantsRecord>(
                                stream: RestaurantsRecord.getDocument(
                                    listViewRestaurantsRecord.reference),
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
                                  final storeListViewRestaurantsRecord =
                                      snapshot.data!;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'NEARBY_RESTAURANTS_Container_6s9bo1xy_ON');
                                                logFirebaseEvent(
                                                    'Container_Backend-Call');

                                                final restaurantsUpdateData = {
                                                  'cardClicks':
                                                      FieldValue.increment(1),
                                                };
                                                await storeListViewRestaurantsRecord
                                                    .reference
                                                    .update(
                                                        restaurantsUpdateData);
                                                logFirebaseEvent(
                                                    'Container_Navigate-To');

                                                context.pushNamed(
                                                  'restaurantDetails',
                                                  queryParams: {
                                                    'restaurant': serializeParam(
                                                        storeListViewRestaurantsRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 1,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  height: 120,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryDark,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          8,
                                                                          8,
                                                                          8),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'NEARBY_RESTAURANTS_Image_gywv80u5_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Image_Expand-Image');
                                                                      await Navigator
                                                                          .push(
                                                                        context,
                                                                        PageTransition(
                                                                          type:
                                                                              PageTransitionType.fade,
                                                                          child:
                                                                              FlutterFlowExpandedImageView(
                                                                            image:
                                                                                CachedNetworkImage(
                                                                              imageUrl: valueOrDefault<String>(
                                                                                storeListViewRestaurantsRecord.featuredImage,
                                                                                'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                                                              ),
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                            allowRotation:
                                                                                false,
                                                                            tag:
                                                                                valueOrDefault<String>(
                                                                              storeListViewRestaurantsRecord.featuredImage,
                                                                              'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg' + '$listViewIndex',
                                                                            ),
                                                                            useHeroAnimation:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child: Hero(
                                                                      tag: valueOrDefault<
                                                                          String>(
                                                                        storeListViewRestaurantsRecord
                                                                            .featuredImage,
                                                                        'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg' +
                                                                            '$listViewIndex',
                                                                      ),
                                                                      transitionOnUserGestures:
                                                                          true,
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          imageUrl:
                                                                              valueOrDefault<String>(
                                                                            storeListViewRestaurantsRecord.featuredImage,
                                                                            'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                                                          ),
                                                                          width:
                                                                              74,
                                                                          height:
                                                                              74,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 4,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              99),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: 35,
                                                                  height: 35,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFEEEEEE),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            99),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 120,
                                                                    height: 120,
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
                                                                          valueOrDefault<
                                                                              String>(
                                                                        storeListViewRestaurantsRecord
                                                                            .logo,
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test3-r71why/assets/ikoxy9icoqvd/icon%20google%20play.png',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          55,
                                                                          0,
                                                                          0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      PostsRecord>>(
                                                                stream:
                                                                    queryPostsRecord(
                                                                  queryBuilder: (postsRecord) => postsRecord.where(
                                                                      'rest_ref',
                                                                      isEqualTo:
                                                                          storeListViewRestaurantsRecord
                                                                              .reference),
                                                                ),
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
                                                                  List<PostsRecord>
                                                                      containerPostsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        4,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: 35,
                                                                      height:
                                                                          35,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(99),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .getAverageRating(containerPostsRecordList.toList()),
                                                                          '-',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        1,
                                                                        0,
                                                                        0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      storeListViewRestaurantsRecord
                                                                          .restaurantName!
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            20,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                Color(0xFF15212B),
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      storeListViewRestaurantsRecord
                                                                          .restAddress!
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            24,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                Color(0xFF8B97A2),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      storeListViewRestaurantsRecord
                                                                          .categories!
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            24,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                Color(0xFF960000),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        storeListViewRestaurantsRecord
                                                                            .priceRange,
                                                                        '\$\$',
                                                                      ).maybeHandleOverflow(
                                                                        maxChars:
                                                                            30,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                Color(0xFF70D423),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          '${valueOrDefault<String>(
                                                                            storeListViewRestaurantsRecord.reviews?.toString(),
                                                                            '0',
                                                                          )}  reviews',
                                                                          '0 reviews',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        '${functions.getDistance(currentUserLocationValue, storeListViewRestaurantsRecord.restLatLong)} miles away',
                                                                        '-',
                                                                      ).maybeHandleOverflow(
                                                                        maxChars:
                                                                            24,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryDark,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                child: Icon(
                                                                  Icons
                                                                      .chevron_right_outlined,
                                                                  color: Color(
                                                                      0xFF95A1AC),
                                                                  size: 24,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 10, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    10, 0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30,
                                                          borderWidth: 1,
                                                          buttonSize: 60,
                                                          icon: Icon(
                                                            Icons.phone,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 30,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'NEARBY_RESTAURANTS_PAGE_phone_ICN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'IconButton_Launch-U-R-L');
                                                            await launchURL(
                                                                'tel:${listViewRestaurantsRecord.phoneNumber}');
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 10, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30,
                                                          borderWidth: 1,
                                                          buttonSize: 60,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .mapMarkedAlt,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 30,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'NEARBY_RESTAURANTS_mapMarkedAlt_ICN_ON_T');
                                                            logFirebaseEvent(
                                                                'IconButton_Launch-U-R-L');
                                                            await launchURL(
                                                                functions.getMapUrl(
                                                                    listViewRestaurantsRecord
                                                                        .restLatLong));
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 10, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30,
                                                          borderWidth: 1,
                                                          buttonSize: 60,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .globe,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 30,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'NEARBY_RESTAURANTS_PAGE_globe_ICN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'IconButton_Launch-U-R-L');
                                                            await launchURL(
                                                                '${listViewRestaurantsRecord.website}');
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (storeListViewRestaurantsRecord
                                                        .isSubscribed ??
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 10, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30,
                                                            borderWidth: 1,
                                                            buttonSize: 60,
                                                            icon: Icon(
                                                              Icons
                                                                  .fastfood_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 34,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'NEARBY_RESTAURANTS_fastfood_rounded_ICN_');
                                                              logFirebaseEvent(
                                                                  'IconButton_Backend-Call');

                                                              final restaurantsUpdateData =
                                                                  {
                                                                'orderNowClicks':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              };
                                                              await storeListViewRestaurantsRecord
                                                                  .reference
                                                                  .update(
                                                                      restaurantsUpdateData);
                                                              logFirebaseEvent(
                                                                  'IconButton_Bottom-Sheet');
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
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          400,
                                                                      child:
                                                                          DeliverySheetWidget(
                                                                        restaurant:
                                                                            storeListViewRestaurantsRecord,
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
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 10, 10),
                                                  child: StreamBuilder<
                                                      List<PostsRecord>>(
                                                    stream: queryPostsRecord(
                                                      queryBuilder: (postsRecord) =>
                                                          postsRecord.where(
                                                              'rest_ref',
                                                              isEqualTo:
                                                                  storeListViewRestaurantsRecord
                                                                      .reference),
                                                      limit: 5,
                                                    ),
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
                                                      List<PostsRecord>
                                                          rowPostsRecordList =
                                                          snapshot.data!;
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: List.generate(
                                                            rowPostsRecordList
                                                                .length,
                                                            (rowIndex) {
                                                          final rowPostsRecord =
                                                              rowPostsRecordList[
                                                                  rowIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        9,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Container(
                                                              width: 56.25,
                                                              height: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFEEEEEE),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'NEARBY_RESTAURANTS_Image_mdd183iv_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Image_Navigate-To');

                                                                  context
                                                                      .pushNamed(
                                                                    'restaurantReviewsList',
                                                                    queryParams:
                                                                        {
                                                                      'initialStoryIndex': serializeParam(
                                                                          rowIndex,
                                                                          ParamType
                                                                              .int),
                                                                      'restaurant': serializeParam(
                                                                          storeListViewRestaurantsRecord,
                                                                          ParamType
                                                                              .Document),
                                                                    }.withoutNulls,
                                                                    extra: <
                                                                        String,
                                                                        dynamic>{
                                                                      'restaurant':
                                                                          storeListViewRestaurantsRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    imageUrl:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      rowPostsRecord
                                                                          .videoThumbnail,
                                                                      'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                                                    ),
                                                                    width: 100,
                                                                    height: 100,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
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
                            ),
                          ),
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
    );
  }

  Future waitForAlgoliaRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _algoliaRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
