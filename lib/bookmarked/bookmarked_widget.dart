import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delivery_sheet_widget.dart';
import '/components/empty_reviews_widget.dart';
import '/components/no_bookmarks_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bookmarked_model.dart';
export 'bookmarked_model.dart';

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
  late BookmarkedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookmarkedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'bookmarked'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 30.0,
            height: 30.0,
            child: SpinKitThreeBounce(
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 30.0,
            ),
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
              width: 30.0,
              height: 30.0,
              child: SpinKitThreeBounce(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 30.0,
              ),
            ),
          );
        }
        final bookmarkedUsersRecord = snapshot.data!;
        return Title(
            title: 'bookmarked',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                iconTheme: IconThemeData(
                    color: FlutterFlowTheme.of(context).primaryText),
                automaticallyImplyLeading: true,
                leading: InkWell(
                  onTap: () async {
                    logFirebaseEvent('BOOKMARKED_PAGE_Icon_8tucxp3p_ON_TAP');
                    logFirebaseEvent('Icon_navigate_back');
                    context.pop();
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    '33x89230' /* Bookmarked */,
                  ),
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 4.0,
              ),
              body: SafeArea(
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: Container(
                              height: 90.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 3.0, 0.0, 0.0),
                                child: StreamBuilder<List<StoriesRecord>>(
                                  stream: queryStoriesRecord(
                                    queryBuilder: (storiesRecord) =>
                                        storiesRecord.orderBy('created_time',
                                            descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 30.0,
                                          height: 30.0,
                                          child: SpinKitThreeBounce(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 30.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<StoriesRecord>
                                        listViewStoriesRecordList =
                                        snapshot.data!;
                                    if (listViewStoriesRecordList.isEmpty) {
                                      return Center(
                                        child: Image.asset(
                                          'assets/images/no_stories.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                        ),
                                      );
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          listViewStoriesRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewStoriesRecord =
                                            listViewStoriesRecordList[
                                                listViewIndex];
                                        return Visibility(
                                          visible: (currentUserDocument
                                                          ?.bookmarked
                                                          ?.toList() ??
                                                      [])
                                                  .contains(
                                                      listViewStoriesRecord
                                                          .restRef) ==
                                              false,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  StreamBuilder<
                                                      RestaurantsRecord>(
                                                stream: RestaurantsRecord
                                                    .getDocument(
                                                        listViewStoriesRecord
                                                            .restRef!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        child:
                                                            SpinKitThreeBounce(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 30.0,
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
                                                          'Column_navigate_to');

                                                      context.pushNamed(
                                                        'storyDetails',
                                                        queryParams: {
                                                          'initialStoryIndex':
                                                              serializeParam(
                                                            listViewIndex,
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .bottomToTop,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    200),
                                                          ),
                                                        },
                                                      );

                                                      logFirebaseEvent(
                                                          'Column_backend_call');

                                                      final restaurantsUpdateData =
                                                          {
                                                        'storyClicks':
                                                            FieldValue
                                                                .increment(1),
                                                      };
                                                      await columnRestaurantsRecord
                                                          .reference
                                                          .update(
                                                              restaurantsUpdateData);
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: 70.0,
                                                                height: 70.0,
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
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
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
                                                                  columnRestaurantsRecord
                                                                      .logo,
                                                                  'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
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
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
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
                                      width: 30.0,
                                      height: 30.0,
                                      child: SpinKitThreeBounce(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 30.0,
                                      ),
                                    ),
                                  );
                                }
                                List<RestaurantsRecord>
                                    columnRestaurantsRecordList =
                                    snapshot.data!;
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
                                          columnRestaurantsRecordList[
                                              columnIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: StreamBuilder<RestaurantsRecord>(
                                          stream: RestaurantsRecord.getDocument(
                                              columnRestaurantsRecord
                                                  .reference),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  child: SpinKitThreeBounce(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 30.0,
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
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 4.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      height: 280.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
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
                                                                  'Container_navigate_to');

                                                              context.pushNamed(
                                                                'restaurantDetails',
                                                                queryParams: {
                                                                  'restaurant':
                                                                      serializeParam(
                                                                    storeListViewRestaurantsRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );

                                                              logFirebaseEvent(
                                                                  'Container_backend_call');

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
                                                              elevation: 1.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    1.0,
                                                                height: 110.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 8.0, 8.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: CachedNetworkImage(
                                                                                    imageUrl: valueOrDefault<String>(
                                                                                      storeListViewRestaurantsRecord.featuredImage,
                                                                                      'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                                                                    ),
                                                                                    width: 74.0,
                                                                                    height: 74.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 4.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(99.0),
                                                                              ),
                                                                              child: Container(
                                                                                width: 35.0,
                                                                                height: 35.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFEEEEEE),
                                                                                  borderRadius: BorderRadius.circular(99.0),
                                                                                ),
                                                                                child: Container(
                                                                                  width: 120.0,
                                                                                  height: 120.0,
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
                                                                                5.0,
                                                                                55.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                StreamBuilder<List<PostsRecord>>(
                                                                              stream: queryPostsRecord(
                                                                                queryBuilder: (postsRecord) => postsRecord.where('rest_ref', isEqualTo: storeListViewRestaurantsRecord.reference),
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 30.0,
                                                                                      height: 30.0,
                                                                                      child: SpinKitThreeBounce(
                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                        size: 30.0,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<PostsRecord> containerPostsRecordList = snapshot.data!;
                                                                                return Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 4.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(99.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 35.0,
                                                                                    height: 35.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: valueOrDefault<Color>(
                                                                                        () {
                                                                                          if (FFAppState().excellent.contains(functions.getAverageRatingCopy(containerPostsRecordList
                                                                                              .map((e) => valueOrDefault<double>(
                                                                                                    e.userRating,
                                                                                                    1.0,
                                                                                                  ))
                                                                                              .toList()))) {
                                                                                            return Color(0xFF3FDF86);
                                                                                          } else if (FFAppState().good.contains(functions.getAverageRatingCopy(containerPostsRecordList
                                                                                              .map((e) => valueOrDefault<double>(
                                                                                                    e.userRating,
                                                                                                    1.0,
                                                                                                  ))
                                                                                              .toList()))) {
                                                                                            return Color(0xFFC3DF3F);
                                                                                          } else if (FFAppState().average.contains(functions.getAverageRatingCopy(containerPostsRecordList
                                                                                              .map((e) => valueOrDefault<double>(
                                                                                                    e.userRating,
                                                                                                    1.0,
                                                                                                  ))
                                                                                              .toList()))) {
                                                                                            return Color(0xFFDFCB3F);
                                                                                          } else if (FFAppState().bad.contains(functions.getAverageRatingCopy(containerPostsRecordList
                                                                                              .map((e) => valueOrDefault<double>(
                                                                                                    e.userRating,
                                                                                                    1.0,
                                                                                                  ))
                                                                                              .toList()))) {
                                                                                            return Color(0xFFDF993F);
                                                                                          } else if (FFAppState().horrible.contains(functions.getAverageRatingCopy(containerPostsRecordList
                                                                                              .map((e) => valueOrDefault<double>(
                                                                                                    e.userRating,
                                                                                                    1.0,
                                                                                                  ))
                                                                                              .toList()))) {
                                                                                            return Color(0xFFDF5A3F);
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).secondaryBackground;
                                                                                          }
                                                                                        }(),
                                                                                        Color(0x8E95A1AC),
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(99.0),
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions.getAverageRating(containerPostsRecordList.toList()),
                                                                                        '-',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Lexend Deca',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              1.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    storeListViewRestaurantsRecord.restaurantName!.maybeHandleOverflow(
                                                                                      maxChars: 20,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                          fontFamily: 'Lexend Deca',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 18.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    storeListViewRestaurantsRecord.restAddress!.maybeHandleOverflow(
                                                                                      maxChars: 24,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                          fontFamily: 'Lexend Deca',
                                                                                          color: Color(0xFF8B97A2),
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    storeListViewRestaurantsRecord.categories!.maybeHandleOverflow(
                                                                                      maxChars: 24,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Lexend Deca',
                                                                                          color: Color(0xFF960000),
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
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
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      '${valueOrDefault<String>(
                                                                                        storeListViewRestaurantsRecord.reviews?.toString(),
                                                                                        '0',
                                                                                      )} reviews',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Lexend Deca',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
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
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 14.0,
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
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: InkWell(
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('BOOKMARKED_PAGE_Icon_ifync9k2_ON_TAP');
                                                                                  logFirebaseEvent('Icon_backend_call');

                                                                                  final restaurantsUpdateData = {
                                                                                    'whoBookmarked': FieldValue.arrayRemove([
                                                                                      currentUserReference
                                                                                    ]),
                                                                                  };
                                                                                  await storeListViewRestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                },
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.minusCircle,
                                                                                  color: Color(0xFF95A1AC),
                                                                                  size: 24.0,
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
                                                                MainAxisSize
                                                                    .max,
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
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        60.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .phone,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'BOOKMARKED_PAGE_phone_ICN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'IconButton_launch_u_r_l');
                                                                      await launchURL(
                                                                          'tel:${storeListViewRestaurantsRecord.phoneNumber}');
                                                                      logFirebaseEvent(
                                                                          'IconButton_backend_call');

                                                                      final restaurantsUpdateData =
                                                                          {
                                                                        'phoneClicks':
                                                                            FieldValue.increment(1),
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
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        60.0,
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .mapMarkedAlt,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'BOOKMARKED_PAGE_mapMarkedAlt_ICN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'IconButton_launch_u_r_l');
                                                                      await launchURL(
                                                                          functions
                                                                              .getMapUrl(storeListViewRestaurantsRecord.restLatLong));
                                                                      logFirebaseEvent(
                                                                          'IconButton_backend_call');

                                                                      final restaurantsUpdateData =
                                                                          {
                                                                        'mapClicks':
                                                                            FieldValue.increment(1),
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
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        60.0,
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .globe,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'BOOKMARKED_PAGE_globe_ICN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'IconButton_launch_u_r_l');
                                                                      await launchURL(
                                                                          'https://${storeListViewRestaurantsRecord.website}');
                                                                      logFirebaseEvent(
                                                                          'IconButton_backend_call');

                                                                      final restaurantsUpdateData =
                                                                          {
                                                                        'websiteClicks':
                                                                            FieldValue.increment(1),
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
                                                                          30.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          60.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .fastfood_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            34.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'BOOKMARKED_fastfood_rounded_ICN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'IconButton_backend_call');

                                                                        final restaurantsUpdateData =
                                                                            {
                                                                          'orderNowClicks':
                                                                              FieldValue.increment(1),
                                                                        };
                                                                        await storeListViewRestaurantsRecord
                                                                            .reference
                                                                            .update(restaurantsUpdateData);
                                                                        logFirebaseEvent(
                                                                            'IconButton_bottom_sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return Padding(
                                                                              padding: MediaQuery.of(context).viewInsets,
                                                                              child: Container(
                                                                                height: 400.0,
                                                                                child: DeliverySheetWidget(
                                                                                  restaurant: storeListViewRestaurantsRecord,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    PostsRecord>>(
                                                              stream:
                                                                  queryPostsRecord(
                                                                queryBuilder: (postsRecord) =>
                                                                    postsRecord.where(
                                                                        'rest_ref',
                                                                        isEqualTo:
                                                                            columnRestaurantsRecord.reference),
                                                                limit: 5,
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
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                      child:
                                                                          SpinKitThreeBounce(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<PostsRecord>
                                                                    rowPostsRecordList =
                                                                    snapshot
                                                                        .data!;
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          9.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            56.25,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('BOOKMARKED_PAGE_Image_dwzbikfn_ON_TAP');
                                                                            logFirebaseEvent('Image_navigate_to');

                                                                            context.pushNamed(
                                                                              'restaurantReviewsList',
                                                                              queryParams: {
                                                                                'initialStoryIndex': serializeParam(
                                                                                  rowIndex,
                                                                                  ParamType.int,
                                                                                ),
                                                                                'restaurant': serializeParam(
                                                                                  storeListViewRestaurantsRecord,
                                                                                  ParamType.Document,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'restaurant': storeListViewRestaurantsRecord,
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              imageUrl: valueOrDefault<String>(
                                                                                rowPostsRecord.videoThumbnail,
                                                                                'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                                                              ),
                                                                              width: 100.0,
                                                                              height: 100.0,
                                                                              fit: BoxFit.cover,
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
            ));
      },
    );
  }
}
