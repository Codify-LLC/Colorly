import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/delivery_sheet_widget.dart';
import '../components/empty_reviews_widget.dart';
import '../components/no_bookmarks_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BookmarkedWidget extends StatefulWidget {
  const BookmarkedWidget({
    Key? key,
    this.restaurants,
    this.user,
  }) : super(key: key);

  final RestaurantsRecord? restaurants;
  final UsersRecord? user;

  @override
  _BookmarkedWidgetState createState() => _BookmarkedWidgetState();
}

class _BookmarkedWidgetState extends State<BookmarkedWidget> {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'bookmarked'});
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
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.user!.reference),
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
        final bookmarkedUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryDark,
            automaticallyImplyLeading: true,
            leading: InkWell(
              onTap: () async {
                logFirebaseEvent('BOOKMARKED_PAGE_Icon_8tucxp3p_ON_TAP');
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
                '33x89230' /* Bookmarked */,
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
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryDark,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                            child: StreamBuilder<List<StoriesRecord>>(
                              stream: queryStoriesRecord(
                                queryBuilder: (storiesRecord) => storiesRecord
                                    .orderBy('created_time', descending: true),
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
                                List<StoriesRecord> listViewStoriesRecordList =
                                    snapshot.data!;
                                if (listViewStoriesRecordList.isEmpty) {
                                  return Center(
                                    child: Image.asset(
                                      'assets/images/no_stories.png',
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listViewStoriesRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewStoriesRecord =
                                        listViewStoriesRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 8, 0),
                                      child: StreamBuilder<RestaurantsRecord>(
                                        stream: RestaurantsRecord.getDocument(
                                            listViewStoriesRecord.restRef!),
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
                                          return InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'BOOKMARKED_PAGE_Column_1j7y2qb1_ON_TAP');
                                              logFirebaseEvent(
                                                  'Column_Navigate-To');

                                              context.pushNamed(
                                                'storyDetails',
                                                queryParams: {
                                                  'initialStoryIndex':
                                                      serializeParam(
                                                          listViewIndex,
                                                          ParamType.int),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .bottomToTop,
                                                    duration: Duration(
                                                        milliseconds: 200),
                                                  ),
                                                },
                                              );

                                              logFirebaseEvent(
                                                  'Column_Backend-Call');

                                              final restaurantsUpdateData = {
                                                'storyClicks':
                                                    FieldValue.increment(1),
                                              };
                                              await columnRestaurantsRecord
                                                  .reference
                                                  .update(
                                                      restaurantsUpdateData);
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Container(
                                                        width: 70,
                                                        height: 70,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryColor
                                                            ],
                                                            stops: [0, 1],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    0, -1),
                                                            end:
                                                                AlignmentDirectional(
                                                                    0, 1),
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 60,
                                                      height: 60,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            valueOrDefault<
                                                                String>(
                                                          columnRestaurantsRecord
                                                              .logo,
                                                          'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                AutoSizeText(
                                                  columnRestaurantsRecord
                                                      .restaurantName!
                                                      .maybeHandleOverflow(
                                                    maxChars: 12,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        fontSize: 12,
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
                      ),
                      Expanded(
                        child: StreamBuilder<List<RestaurantsRecord>>(
                          stream: queryRestaurantsRecord(
                            queryBuilder: (restaurantsRecord) =>
                                restaurantsRecord.where('whoBookmarked',
                                    arrayContains: currentUserReference),
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
                            List<RestaurantsRecord>
                                columnRestaurantsRecordList = snapshot.data!;
                            if (columnRestaurantsRecordList.isEmpty) {
                              return Center(
                                child: NoBookmarksWidget(),
                              );
                            }
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    columnRestaurantsRecordList.length,
                                    (columnIndex) {
                                  final columnRestaurantsRecord =
                                      columnRestaurantsRecordList[columnIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: StreamBuilder<RestaurantsRecord>(
                                      stream: RestaurantsRecord.getDocument(
                                          columnRestaurantsRecord.reference),
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
                                        final storeListViewRestaurantsRecord =
                                            snapshot.data!;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 10, 10),
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
                                                      0.9,
                                                  height: 280,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'BOOKMARKED_Container_008rlw5q_ON_TAP');
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

                                                          logFirebaseEvent(
                                                              'Container_Backend-Call');

                                                          final restaurantsUpdateData =
                                                              {
                                                            'cardClicks':
                                                                FieldValue
                                                                    .increment(
                                                                        1),
                                                          };
                                                          await storeListViewRestaurantsRecord
                                                              .reference
                                                              .update(
                                                                  restaurantsUpdateData);
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 1,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                          ),
                                                          child: Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 110,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          5,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20,
                                                                                8,
                                                                                8,
                                                                                8),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              child: CachedNetworkImage(
                                                                                imageUrl: valueOrDefault<String>(
                                                                                  storeListViewRestaurantsRecord.featuredImage,
                                                                                  'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                                                                ),
                                                                                width: 74,
                                                                                height: 74,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              4,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(99),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                35,
                                                                            height:
                                                                                35,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFEEEEEE),
                                                                              borderRadius: BorderRadius.circular(99),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 120,
                                                                              height: 120,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: CachedNetworkImage(
                                                                                imageUrl: valueOrDefault<String>(
                                                                                  storeListViewRestaurantsRecord.logo,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test3-r71why/assets/ikoxy9icoqvd/icon%20google%20play.png',
                                                                                ),
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5,
                                                                            55,
                                                                            0,
                                                                            0),
                                                                        child: StreamBuilder<
                                                                            List<PostsRecord>>(
                                                                          stream:
                                                                              queryPostsRecord(
                                                                            queryBuilder: (postsRecord) =>
                                                                                postsRecord.where('rest_ref', isEqualTo: storeListViewRestaurantsRecord.reference),
                                                                          ),
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
                                                                            List<PostsRecord>
                                                                                containerPostsRecordList =
                                                                                snapshot.data!;
                                                                            return Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 4,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(99),
                                                                              ),
                                                                              child: Container(
                                                                                width: 35,
                                                                                height: 35,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFEEEEEE),
                                                                                  borderRadius: BorderRadius.circular(99),
                                                                                ),
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    functions.getAverageRating(containerPostsRecordList.toList()),
                                                                                    '-',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
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
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              1,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                storeListViewRestaurantsRecord.restaurantName!.maybeHandleOverflow(
                                                                                  maxChars: 20,
                                                                                  replacement: '…',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Color(0xFF15212B),
                                                                                      fontSize: 18,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                storeListViewRestaurantsRecord.restAddress!.maybeHandleOverflow(
                                                                                  maxChars: 24,
                                                                                  replacement: '…',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Color(0xFF8B97A2),
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                storeListViewRestaurantsRecord.categories!.maybeHandleOverflow(
                                                                                  maxChars: 24,
                                                                                  replacement: '…',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Color(0xFF960000),
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  storeListViewRestaurantsRecord.priceRange,
                                                                                  '\$\$',
                                                                                ).maybeHandleOverflow(
                                                                                  maxChars: 30,
                                                                                  replacement: '…',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Color(0xFF70D423),
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                child: Text(
                                                                                  '${valueOrDefault<String>(
                                                                                    storeListViewRestaurantsRecord.reviews?.toString(),
                                                                                    '0',
                                                                                  )} reviews',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  '${functions.getDistance(currentUserLocationValue, storeListViewRestaurantsRecord.restLatLong)} miles away',
                                                                                  '-',
                                                                                ).maybeHandleOverflow(
                                                                                  maxChars: 24,
                                                                                  replacement: '…',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).primaryDark,
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.w500,
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
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('BOOKMARKED_PAGE_Icon_ifync9k2_ON_TAP');
                                                                              logFirebaseEvent('Icon_Backend-Call');

                                                                              final restaurantsUpdateData = {
                                                                                'whoBookmarked': FieldValue.arrayRemove([
                                                                                  currentUserReference
                                                                                ]),
                                                                              };
                                                                              await storeListViewRestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                            },
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.minusCircle,
                                                                              color: Color(0xFF95A1AC),
                                                                              size: 24,
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
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 1,
                                                                buttonSize: 60,
                                                                icon: Icon(
                                                                  Icons.phone,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 30,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'BOOKMARKED_PAGE_phone_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_Launch-U-R-L');
                                                                  await launchURL(
                                                                      'tel:${storeListViewRestaurantsRecord.phoneNumber}');
                                                                  logFirebaseEvent(
                                                                      'IconButton_Backend-Call');

                                                                  final restaurantsUpdateData =
                                                                      {
                                                                    'phoneClicks':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  };
                                                                  await storeListViewRestaurantsRecord
                                                                      .reference
                                                                      .update(
                                                                          restaurantsUpdateData);
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 1,
                                                                buttonSize: 60,
                                                                icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .mapMarkedAlt,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 30,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'BOOKMARKED_PAGE_mapMarkedAlt_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_Launch-U-R-L');
                                                                  await launchURL(
                                                                      functions.getMapUrl(
                                                                          storeListViewRestaurantsRecord
                                                                              .restLatLong));
                                                                  logFirebaseEvent(
                                                                      'IconButton_Backend-Call');

                                                                  final restaurantsUpdateData =
                                                                      {
                                                                    'mapClicks':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  };
                                                                  await storeListViewRestaurantsRecord
                                                                      .reference
                                                                      .update(
                                                                          restaurantsUpdateData);
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 1,
                                                                buttonSize: 60,
                                                                icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .globe,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 30,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'BOOKMARKED_PAGE_globe_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_Launch-U-R-L');
                                                                  await launchURL(
                                                                      'https://${storeListViewRestaurantsRecord.website}');
                                                                  logFirebaseEvent(
                                                                      'IconButton_Backend-Call');

                                                                  final restaurantsUpdateData =
                                                                      {
                                                                    'websiteClicks':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  };
                                                                  await storeListViewRestaurantsRecord
                                                                      .reference
                                                                      .update(
                                                                          restaurantsUpdateData);
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          if (storeListViewRestaurantsRecord
                                                                  .isSubscribed ??
                                                              true)
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30,
                                                                  borderWidth:
                                                                      1,
                                                                  buttonSize:
                                                                      60,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .fastfood_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    size: 34,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'BOOKMARKED_fastfood_rounded_ICN_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'IconButton_Backend-Call');

                                                                    final restaurantsUpdateData =
                                                                        {
                                                                      'orderNowClicks':
                                                                          FieldValue.increment(
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
                                                                          padding:
                                                                              MediaQuery.of(context).viewInsets,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                400,
                                                                            child:
                                                                                DeliverySheetWidget(
                                                                              restaurant: storeListViewRestaurantsRecord,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 10),
                                                        child: StreamBuilder<
                                                            List<PostsRecord>>(
                                                          stream:
                                                              queryPostsRecord(
                                                            queryBuilder: (postsRecord) =>
                                                                postsRecord.where(
                                                                    'rest_ref',
                                                                    isEqualTo:
                                                                        columnRestaurantsRecord
                                                                            .reference),
                                                            limit: 5,
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
                                                            List<PostsRecord>
                                                                rowPostsRecordList =
                                                                snapshot.data!;
                                                            if (rowPostsRecordList
                                                                .isEmpty) {
                                                              return EmptyReviewsWidget(
                                                                restaurant:
                                                                    columnRestaurantsRecord,
                                                              );
                                                            }
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  rowPostsRecordList
                                                                      .length,
                                                                  (rowIndex) {
                                                                final rowPostsRecord =
                                                                    rowPostsRecordList[
                                                                        rowIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          9,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        56.25,
                                                                    height: 100,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFEEEEEE),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'BOOKMARKED_PAGE_Image_dwzbikfn_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Image_Navigate-To');

                                                                        context
                                                                            .pushNamed(
                                                                          'restaurantReviewsList',
                                                                          queryParams:
                                                                              {
                                                                            'initialStoryIndex':
                                                                                serializeParam(rowIndex, ParamType.int),
                                                                            'restaurant':
                                                                                serializeParam(storeListViewRestaurantsRecord, ParamType.Document),
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
                                                                            BorderRadius.circular(8),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          imageUrl:
                                                                              valueOrDefault<String>(
                                                                            rowPostsRecord.videoThumbnail,
                                                                            'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                                                          ),
                                                                          width:
                                                                              100,
                                                                          height:
                                                                              100,
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
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                }),
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
          ),
        );
      },
    );
  }
}
