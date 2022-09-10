import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_reviews_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class VideoFindWidget extends StatefulWidget {
  const VideoFindWidget({
    Key? key,
    this.posts,
    this.index,
  }) : super(key: key);

  final PostsRecord? posts;
  final int? index;

  @override
  _VideoFindWidgetState createState() => _VideoFindWidgetState();
}

class _VideoFindWidgetState extends State<VideoFindWidget>
    with TickerProviderStateMixin {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'videoFind'});
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
    return StreamBuilder<List<PostsRecord>>(
      stream: queryPostsRecord(),
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
        List<PostsRecord> videoFindPostsRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryDark,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.asset(
                          'assets/images/2b9dd548d942db180979cf95e3d11ea1.jpg',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.transparent,
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1E2429), Color(0xB60F0F0F)],
                          stops: [0, 1],
                          begin: AlignmentDirectional(0, -1),
                          end: AlignmentDirectional(0, 1),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 36, 16, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
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
                                    logFirebaseEvent(
                                        'VIDEO_FIND_arrow_back_rounded_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_Navigate-Back');
                                    context.pop();
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'htz1nhxs' /* Hey */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: AuthUserStreamWidget(
                                    child: Text(
                                      currentUserDisplayName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFFEE8B60),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '069rs55u' /* Discover Foodies */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.96,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0x9AFFFFFF),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'VIDEO_FIND_PAGE_Row_bd7hvhze_ON_TAP');
                                    logFirebaseEvent('Row_Navigate-To');

                                    context.pushNamed('videoFindSearch');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'VIDEO_FIND_PAGE_Text_owzk6cgm_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_Navigate-To');

                                            context
                                                .pushNamed('videoFindSearch');
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'qyvlwwg2' /* Search for reviews... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2,
                                          ),
                                        ),
                                      ),
                                      Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Color(0xFF1E2429),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          buttonSize: 46,
                                          icon: Icon(
                                            Icons.search_outlined,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'kur3sdi9' /* Nearby */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'VIDEO_FIND_PAGE_Text_kwzhfbua_ON_TAP');
                            logFirebaseEvent('Text_Navigate-To');

                            context.pushNamed(
                              'nearbyVideoPage',
                              queryParams: {
                                'initialStoryIndex':
                                    serializeParam(0, ParamType.int),
                              }.withoutNulls,
                            );
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'qk7gjci7' /* see all... */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                    child: FutureBuilder<List<PostsRecord>>(
                      future: PostsRecord.search(
                        location: getCurrentUserLocation(
                            defaultLocation: LatLng(37.4298229, -122.1735655)),
                        maxResults: 30,
                        searchRadiusMeters: 8046.72,
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
                        List<PostsRecord> eventsListPostsRecordList =
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
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:
                                List.generate(eventsListPostsRecordList.length,
                                    (eventsListIndex) {
                              final eventsListPostsRecord =
                                  eventsListPostsRecordList[eventsListIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                                child: StreamBuilder<PostsRecord>(
                                  stream: PostsRecord.getDocument(
                                      eventsListPostsRecord.reference),
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
                                    final eventCardPostsRecord = snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'VIDEO_FIND_PAGE_eventCard_ON_TAP');
                                        logFirebaseEvent(
                                            'eventCard_Navigate-To');

                                        context.pushNamed(
                                          'nearbyVideoPage',
                                          queryParams: {
                                            'post': serializeParam(
                                                eventsListPostsRecord,
                                                ParamType.Document),
                                            'initialStoryIndex': serializeParam(
                                                eventsListIndex, ParamType.int),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'post': eventsListPostsRecord,
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 95.63,
                                        height: 170,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryDark,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color: Color(0x64000000),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Stack(
                                          children: [
                                            FlutterFlowMediaDisplay(
                                              path: valueOrDefault<String>(
                                                eventsListPostsRecord
                                                    .videoThumbnail,
                                                'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                              ),
                                              imageBuilder: (path) => ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: CachedNetworkImage(
                                                  imageUrl: path,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              videoPlayerBuilder: (path) =>
                                                  FlutterFlowVideoPlayer(
                                                path: path,
                                                width: 300,
                                                autoPlay: false,
                                                looping: true,
                                                showControls: false,
                                                allowFullScreen: false,
                                                allowPlaybackSpeedMenu: false,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 130, 0, 0),
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEEEEE),
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      eventCardPostsRecord
                                                          .userRating,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '0',
                                                      locale: 'en_US',
                                                    ),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        fontSize: 22,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'eapu68jq' /* Recommended */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryDark,
                    ),
                    child: AuthUserStreamWidget(
                      child: StreamBuilder<AddNumberRecord>(
                        stream: AddNumberRecord.getDocument(
                            currentUserDocument!.addNumberRef!),
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
                          final rowAddNumberRecord = snapshot.data!;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<RestaurantsRecord>>(
                                stream: queryRestaurantsRecord(
                                  queryBuilder: (restaurantsRecord) =>
                                      restaurantsRecord
                                          .where('hasAdNumber', isEqualTo: true)
                                          .where('adNumber',
                                              isEqualTo:
                                                  rowAddNumberRecord.count),
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
                                      rowRestaurantsRecordList = snapshot.data!;
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: List.generate(
                                          rowRestaurantsRecordList.length,
                                          (rowIndex) {
                                        final rowRestaurantsRecord =
                                            rowRestaurantsRecordList[rowIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 10),
                                          child: StreamBuilder<AddNumberRecord>(
                                            stream: AddNumberRecord.getDocument(
                                                rowAddNumberRecord.reference),
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
                                              final containerAddNumberRecord =
                                                  snapshot.data!;
                                              return Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                height: 320,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryDark,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 2, 10, 0),
                                                  child: StreamBuilder<
                                                      RestaurantsRecord>(
                                                    stream: RestaurantsRecord
                                                        .getDocument(
                                                            rowRestaurantsRecord
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
                                                      final storeListView3RestaurantsRecord =
                                                          snapshot.data!;
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        10,
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
                                                                            16),
                                                              ),
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.9,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryDark,
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'VIDEO_FIND_Container_yfdggb4o_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Container_Backend-Call');

                                                                        final restaurantsUpdateData =
                                                                            {
                                                                          'cardClicks':
                                                                              FieldValue.increment(1),
                                                                        };
                                                                        await storeListView3RestaurantsRecord
                                                                            .reference
                                                                            .update(restaurantsUpdateData);
                                                                        logFirebaseEvent(
                                                                            'Container_Navigate-To');

                                                                        context
                                                                            .pushNamed(
                                                                          'restaurantDetails',
                                                                          queryParams:
                                                                              {
                                                                            'restaurant':
                                                                                serializeParam(storeListView3RestaurantsRecord.reference, ParamType.DocumentReference),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            1,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(16),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          height:
                                                                              120,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                5,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Stack(
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(20, 8, 8, 8),
                                                                                          child: InkWell(
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('VIDEO_FIND_PAGE_Image_lucestin_ON_TAP');
                                                                                              logFirebaseEvent('Image_Expand-Image');
                                                                                              await Navigator.push(
                                                                                                context,
                                                                                                PageTransition(
                                                                                                  type: PageTransitionType.fade,
                                                                                                  child: FlutterFlowExpandedImageView(
                                                                                                    image: CachedNetworkImage(
                                                                                                      imageUrl: valueOrDefault<String>(
                                                                                                        storeListView3RestaurantsRecord.featuredImage,
                                                                                                        'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                                                                                      ),
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                    allowRotation: false,
                                                                                                    tag: valueOrDefault<String>(
                                                                                                      storeListView3RestaurantsRecord.featuredImage,
                                                                                                      'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg' + '$rowIndex',
                                                                                                    ),
                                                                                                    useHeroAnimation: true,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                            child: Hero(
                                                                                              tag: valueOrDefault<String>(
                                                                                                storeListView3RestaurantsRecord.featuredImage,
                                                                                                'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg' + '$rowIndex',
                                                                                              ),
                                                                                              transitionOnUserGestures: true,
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                                child: CachedNetworkImage(
                                                                                                  imageUrl: valueOrDefault<String>(
                                                                                                    storeListView3RestaurantsRecord.featuredImage,
                                                                                                    'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                                                                                  ),
                                                                                                  width: 74,
                                                                                                  height: 74,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                      child: StreamBuilder<RestaurantsRecord>(
                                                                                        stream: RestaurantsRecord.getDocument(storeListView3RestaurantsRecord.reference),
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
                                                                                          final containerRestaurantsRecord = snapshot.data!;
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
                                                                                              child: Container(
                                                                                                width: 120,
                                                                                                height: 120,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: CachedNetworkImage(
                                                                                                  imageUrl: valueOrDefault<String>(
                                                                                                    storeListView3RestaurantsRecord.logo,
                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test3-r71why/assets/ikoxy9icoqvd/icon%20google%20play.png',
                                                                                                  ),
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 55, 0, 0),
                                                                                      child: StreamBuilder<List<PostsRecord>>(
                                                                                        stream: queryPostsRecord(
                                                                                          queryBuilder: (postsRecord) => postsRecord.where('rest_ref', isEqualTo: storeListView3RestaurantsRecord.reference),
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
                                                                                          List<PostsRecord> containerPostsRecordList = snapshot.data!;
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
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 1, 0, 0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              storeListView3RestaurantsRecord.restaurantName!.maybeHandleOverflow(
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
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              storeListView3RestaurantsRecord.restAddress!.maybeHandleOverflow(
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
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                storeListView3RestaurantsRecord.categories,
                                                                                                '-',
                                                                                              ).maybeHandleOverflow(
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
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                storeListView3RestaurantsRecord.priceRange,
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
                                                                                                valueOrDefault<String>(
                                                                                                  '${formatNumber(
                                                                                                    storeListView3RestaurantsRecord.reviews,
                                                                                                    formatType: FormatType.compact,
                                                                                                  )} reviews',
                                                                                                  '0 reviews',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                '${functions.getDistance(currentUserLocationValue, storeListView3RestaurantsRecord.restLatLong)} miles away',
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
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                        child: Icon(
                                                                                          Icons.chevron_right_outlined,
                                                                                          color: Color(0xFF95A1AC),
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
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 30,
                                                                              borderWidth: 1,
                                                                              buttonSize: 60,
                                                                              icon: Icon(
                                                                                Icons.phone,
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 30,
                                                                              ),
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('VIDEO_FIND_PAGE_phone_ICN_ON_TAP');
                                                                                logFirebaseEvent('IconButton_Backend-Call');

                                                                                final restaurantsUpdateData = {
                                                                                  'phoneClicks': FieldValue.increment(1),
                                                                                };
                                                                                await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                logFirebaseEvent('IconButton_Launch-U-R-L');
                                                                                await launchURL('tel:${storeListView3RestaurantsRecord.phoneNumber}');
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 30,
                                                                              borderWidth: 1,
                                                                              buttonSize: 60,
                                                                              icon: FaIcon(
                                                                                FontAwesomeIcons.mapMarkedAlt,
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 30,
                                                                              ),
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('VIDEO_FIND_PAGE_mapMarkedAlt_ICN_ON_TAP');
                                                                                logFirebaseEvent('IconButton_Backend-Call');

                                                                                final restaurantsUpdateData = {
                                                                                  'mapClicks': FieldValue.increment(1),
                                                                                };
                                                                                await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                logFirebaseEvent('IconButton_Launch-U-R-L');
                                                                                await launchURL(functions.getMapUrl(storeListView3RestaurantsRecord.restLatLong));
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 30,
                                                                              borderWidth: 1,
                                                                              buttonSize: 60,
                                                                              icon: FaIcon(
                                                                                FontAwesomeIcons.globe,
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 30,
                                                                              ),
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('VIDEO_FIND_PAGE_globe_ICN_ON_TAP');
                                                                                logFirebaseEvent('IconButton_Backend-Call');

                                                                                final restaurantsUpdateData = {
                                                                                  'websiteClicks': FieldValue.increment(1),
                                                                                };
                                                                                await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                logFirebaseEvent('IconButton_Launch-U-R-L');
                                                                                await launchURL(storeListView3RestaurantsRecord.website!);
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        if (storeListView3RestaurantsRecord.isSubscribed ??
                                                                            true)
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              FlutterFlowIconButton(
                                                                                borderColor: Colors.transparent,
                                                                                borderRadius: 30,
                                                                                borderWidth: 1,
                                                                                buttonSize: 60,
                                                                                icon: Icon(
                                                                                  Icons.fastfood_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  size: 34,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  logFirebaseEvent('VIDEO_FIND_fastfood_rounded_ICN_ON_TAP');
                                                                                  logFirebaseEvent('IconButton_Backend-Call');

                                                                                  final restaurantsUpdateData = {
                                                                                    'orderNowClicks': FieldValue.increment(1),
                                                                                  };
                                                                                  await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                  logFirebaseEvent('IconButton_Navigate-To');

                                                                                  context.pushNamed(
                                                                                    'order',
                                                                                    queryParams: {
                                                                                      'restaurant': serializeParam(storeListView3RestaurantsRecord, ParamType.Document),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'restaurant': storeListView3RestaurantsRecord,
                                                                                    },
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              10),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              PostsRecord>>(
                                                                        stream:
                                                                            queryPostsRecord(
                                                                          queryBuilder: (postsRecord) => postsRecord.where(
                                                                              'rest_ref',
                                                                              isEqualTo: storeListView3RestaurantsRecord.reference),
                                                                          limit:
                                                                              5,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                              rowPostsRecordList =
                                                                              snapshot.data!;
                                                                          if (rowPostsRecordList
                                                                              .isEmpty) {
                                                                            return EmptyReviewsWidget(
                                                                              restaurant: storeListView3RestaurantsRecord,
                                                                            );
                                                                          }
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(rowPostsRecordList.length, (rowIndex) {
                                                                              final rowPostsRecord = rowPostsRecordList[rowIndex];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(9, 0, 0, 0),
                                                                                child: Container(
                                                                                  width: 56.25,
                                                                                  height: 100,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFEEEEEE),
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                  child: InkWell(
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('VIDEO_FIND_PAGE_Image_v9wp6a5s_ON_TAP');
                                                                                      logFirebaseEvent('Image_Navigate-To');

                                                                                      context.pushNamed(
                                                                                        'restaurantReviewsList',
                                                                                        queryParams: {
                                                                                          'initialStoryIndex': serializeParam(rowIndex, ParamType.int),
                                                                                          'restaurant': serializeParam(storeListView3RestaurantsRecord, ParamType.Document),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'restaurant': storeListView3RestaurantsRecord,
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                      child: CachedNetworkImage(
                                                                                        imageUrl: valueOrDefault<String>(
                                                                                          rowPostsRecord.videoThumbnail,
                                                                                          'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                                                                        ),
                                                                                        width: 100,
                                                                                        height: 100,
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
                                                ),
                                              ).animated([
                                                animationsMap[
                                                    'containerOnPageLoadAnimation']!
                                              ]);
                                            },
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'gtadonou' /* #breakfast */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                    child: FutureBuilder<List<PostsRecord>>(
                      future: PostsRecord.search(
                        term: 'breakfast',
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
                        List<PostsRecord> eventsListPostsRecordList =
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
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                List.generate(eventsListPostsRecordList.length,
                                    (eventsListIndex) {
                              final eventsListPostsRecord =
                                  eventsListPostsRecordList[eventsListIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                                child: StreamBuilder<PostsRecord>(
                                  stream: PostsRecord.getDocument(
                                      eventsListPostsRecord.reference),
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
                                    final eventCardPostsRecord = snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'VIDEO_FIND_PAGE_eventCard_ON_TAP');
                                        logFirebaseEvent(
                                            'eventCard_Navigate-To');

                                        context.pushNamed(
                                          'singleVideoPage',
                                          queryParams: {
                                            'post': serializeParam(
                                                eventCardPostsRecord,
                                                ParamType.Document),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'post': eventCardPostsRecord,
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 95.63,
                                        height: 170,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryDark,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color: Color(0x64000000),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Stack(
                                          children: [
                                            FlutterFlowMediaDisplay(
                                              path: valueOrDefault<String>(
                                                eventsListPostsRecord
                                                    .videoThumbnail,
                                                'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                              ),
                                              imageBuilder: (path) => ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: CachedNetworkImage(
                                                  imageUrl: path,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              videoPlayerBuilder: (path) =>
                                                  FlutterFlowVideoPlayer(
                                                path: path,
                                                width: 300,
                                                autoPlay: false,
                                                looping: true,
                                                showControls: false,
                                                allowFullScreen: false,
                                                allowPlaybackSpeedMenu: false,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 130, 0, 0),
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEEEEE),
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      eventCardPostsRecord
                                                          .userRating,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '0',
                                                      locale: 'en-Us',
                                                    ),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        fontSize: 22,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'gzn3dj26' /* #lunch */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                    child: FutureBuilder<List<PostsRecord>>(
                      future: PostsRecord.search(
                        term: 'lunch',
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
                        List<PostsRecord> eventsListPostsRecordList =
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
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                List.generate(eventsListPostsRecordList.length,
                                    (eventsListIndex) {
                              final eventsListPostsRecord =
                                  eventsListPostsRecordList[eventsListIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                                child: StreamBuilder<PostsRecord>(
                                  stream: PostsRecord.getDocument(
                                      eventsListPostsRecord.reference),
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
                                    final eventCardPostsRecord = snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'VIDEO_FIND_PAGE_eventCard_ON_TAP');
                                        logFirebaseEvent(
                                            'eventCard_Navigate-To');

                                        context.pushNamed(
                                          'singleVideoPage',
                                          queryParams: {
                                            'post': serializeParam(
                                                eventCardPostsRecord,
                                                ParamType.Document),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'post': eventCardPostsRecord,
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 95.63,
                                        height: 170,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryDark,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color: Color(0x64000000),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Stack(
                                          children: [
                                            FlutterFlowMediaDisplay(
                                              path: valueOrDefault<String>(
                                                eventsListPostsRecord
                                                    .videoThumbnail,
                                                'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                              ),
                                              imageBuilder: (path) => ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: CachedNetworkImage(
                                                  imageUrl: path,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              videoPlayerBuilder: (path) =>
                                                  FlutterFlowVideoPlayer(
                                                path: path,
                                                width: 300,
                                                autoPlay: false,
                                                looping: true,
                                                showControls: false,
                                                allowFullScreen: false,
                                                allowPlaybackSpeedMenu: false,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 130, 0, 0),
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEEEEE),
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      eventCardPostsRecord
                                                          .userRating,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '0',
                                                      locale: 'en-Us',
                                                    ),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        fontSize: 22,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'uc19hf1r' /* #dinner */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                    child: FutureBuilder<List<PostsRecord>>(
                      future: PostsRecord.search(
                        term: 'dinner',
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
                        List<PostsRecord> eventsListPostsRecordList =
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
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                List.generate(eventsListPostsRecordList.length,
                                    (eventsListIndex) {
                              final eventsListPostsRecord =
                                  eventsListPostsRecordList[eventsListIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                                child: StreamBuilder<PostsRecord>(
                                  stream: PostsRecord.getDocument(
                                      eventsListPostsRecord.reference),
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
                                    final eventCardPostsRecord = snapshot.data!;
                                    return InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'VIDEO_FIND_PAGE_eventCard_ON_TAP');
                                        logFirebaseEvent(
                                            'eventCard_Navigate-To');

                                        context.pushNamed(
                                          'singleVideoPage',
                                          queryParams: {
                                            'post': serializeParam(
                                                eventCardPostsRecord,
                                                ParamType.Document),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'post': eventCardPostsRecord,
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 95.63,
                                        height: 170,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryDark,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color: Color(0x64000000),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Stack(
                                          children: [
                                            FlutterFlowMediaDisplay(
                                              path: valueOrDefault<String>(
                                                eventsListPostsRecord
                                                    .videoThumbnail,
                                                'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                              ),
                                              imageBuilder: (path) => ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: CachedNetworkImage(
                                                  imageUrl: path,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              videoPlayerBuilder: (path) =>
                                                  FlutterFlowVideoPlayer(
                                                path: path,
                                                width: 300,
                                                autoPlay: false,
                                                looping: true,
                                                showControls: false,
                                                allowFullScreen: false,
                                                allowPlaybackSpeedMenu: false,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 130, 0, 0),
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEEEEE),
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      eventCardPostsRecord
                                                          .userRating,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '0',
                                                      locale: 'en-us',
                                                    ),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        fontSize: 22,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
          ),
        );
      },
    );
  }
}
