import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_menu_cart_widget.dart';
import '/components/comments_copy_widget.dart';
import '/components/comments_widget.dart';
import '/components/description_sheet_widget.dart';
import '/components/flag_video_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'nearby_video_page_model.dart';
export 'nearby_video_page_model.dart';

class NearbyVideoPageWidget extends StatefulWidget {
  const NearbyVideoPageWidget({
    Key? key,
    this.initialStoryIndex,
    this.restaurant,
    this.user,
    this.post,
  }) : super(key: key);

  final int? initialStoryIndex;
  final RestaurantsRecord? restaurant;
  final UsersRecord? user;
  final PostsRecord? post;

  @override
  _NearbyVideoPageWidgetState createState() => _NearbyVideoPageWidgetState();
}

class _NearbyVideoPageWidgetState extends State<NearbyVideoPageWidget>
    with TickerProviderStateMixin {
  late NearbyVideoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  var hasIconTriggered = false;
  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1.2,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NearbyVideoPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'nearbyVideoPage'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return Title(
        title: 'nearbyVideoPage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryDark,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder<List<PostsRecord>>(
                  future: PostsRecord.search(
                    location: getCurrentUserLocation(
                        defaultLocation: LatLng(37.4298229, -122.1735655)),
                    searchRadiusMeters: 8046.72,
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
                    List<PostsRecord> pageViewPostsRecordList = snapshot.data!;
                    // Customize what your widget looks like with no search results.
                    if (snapshot.data!.isEmpty) {
                      return Container(
                        height: 100,
                        child: Center(
                          child: Text('No results.'),
                        ),
                      );
                    }
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 50.0),
                            child: PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage: min(
                                          widget.initialStoryIndex!,
                                          pageViewPostsRecordList.length - 1)),
                              scrollDirection: Axis.vertical,
                              itemCount: pageViewPostsRecordList.length,
                              itemBuilder: (context, pageViewIndex) {
                                final pageViewPostsRecord =
                                    pageViewPostsRecordList[pageViewIndex];
                                return Container(
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00960000),
                                              ),
                                              child: FlutterFlowVideoPlayer(
                                                path: valueOrDefault<String>(
                                                  pageViewPostsRecord.videoUrl,
                                                  'http://colorly.app/wp-content/uploads/2022/05/Orange-Minimalist-Tea-Mobile-Video.mp4',
                                                ),
                                                videoType: VideoType.network,
                                                autoPlay: true,
                                                looping: true,
                                                showControls: true,
                                                allowFullScreen: true,
                                                allowPlaybackSpeedMenu: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 300.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  FlutterFlowTheme.of(context)
                                                      .primaryDark,
                                                  Color(0x001A1F24)
                                                ],
                                                stops: [0.0, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 0.0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            1.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x45EEEEEE),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          RestaurantsRecord>(
                                                        stream: RestaurantsRecord
                                                            .getDocument(
                                                                pageViewPostsRecord
                                                                    .restRef!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 30.0,
                                                                height: 30.0,
                                                                child:
                                                                    SpinKitThreeBounce(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final userInfoRestaurantsRecord =
                                                              snapshot.data!;
                                                          return InkWell(
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'NEARBY_VIDEO_PAGE_PAGE_userInfo_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'userInfo_backend_call');

                                                              final restaurantsUpdateData =
                                                                  {
                                                                'cardClicks':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              };
                                                              await userInfoRestaurantsRecord
                                                                  .reference
                                                                  .update(
                                                                      restaurantsUpdateData);
                                                              logFirebaseEvent(
                                                                  'userInfo_navigate_to');

                                                              context.pushNamed(
                                                                'restaurantDetails',
                                                                queryParams: {
                                                                  'restaurant':
                                                                      serializeParam(
                                                                    userInfoRestaurantsRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
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
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
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
                                                                        userInfoRestaurantsRecord
                                                                            .logo,
                                                                        'https://assets.bonappetit.com/photos/610aa6ddc50e2f9f7c42f7f8/master/pass/Savage-2019-top-50-busy-restaurant.jpg',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                userInfoRestaurantsRecord.restaurantName!.maybeHandleOverflow(maxChars: 25),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '${functions.getDistance(currentUserLocationValue, userInfoRestaurantsRecord.restLatLong)} mi.',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            userInfoRestaurantsRecord.restAddress!.maybeHandleOverflow(maxChars: 40),
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                  fontSize: 12.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  userInfoRestaurantsRecord.priceRange,
                                                                                  '\$\$',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Color(0xFF32FF48),
                                                                                      fontSize: 12.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                userInfoRestaurantsRecord.categories!.maybeHandleOverflow(maxChars: 35),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                      fontSize: 12.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '${valueOrDefault<String>(
                                                                                  userInfoRestaurantsRecord.reviews?.toString(),
                                                                                  '0',
                                                                                )} reviews',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                      fontSize: 12.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
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
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 5.0, 0.0),
                                                  child: StreamBuilder<
                                                      RestaurantsRecord>(
                                                    stream: RestaurantsRecord
                                                        .getDocument(
                                                            pageViewPostsRecord
                                                                .restRef!),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      final userInfoRestaurantsRecord =
                                                          snapshot.data!;
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60.0),
                                                                ),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30.0,
                                                                  buttonSize:
                                                                      34.0,
                                                                  fillColor: Color(
                                                                      0xFF2D2D2D),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .close_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'NEARBY_VIDEO_close_rounded_ICN_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'IconButton_navigate_back');
                                                                    context
                                                                        .pop();
                                                                  },
                                                                ),
                                                              ),
                                                              Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryDark,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60.0),
                                                                ),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30.0,
                                                                  buttonSize:
                                                                      34.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .flag_rounded,
                                                                    color: Color(
                                                                        0xFFA4A4A4),
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'NEARBY_VIDEO_flag_rounded_ICN_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'IconButton_bottom_sheet');
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Padding(
                                                                          padding:
                                                                              MediaQuery.of(context).viewInsets,
                                                                          child:
                                                                              FlagVideoWidget(
                                                                            post:
                                                                                pageViewPostsRecord,
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                ),
                                                              ),
                                                              Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          2.0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'NEARBY_VIDEO_LottieAnimation_h4qgyna0_ON');
                                                                      logFirebaseEvent(
                                                                          'LottieAnimation_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'restDealPage',
                                                                        queryParams:
                                                                            {
                                                                          'restaurant':
                                                                              serializeParam(
                                                                            userInfoRestaurantsRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <
                                                                            String,
                                                                            dynamic>{
                                                                          'restaurant':
                                                                              userInfoRestaurantsRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Lottie
                                                                        .asset(
                                                                      'assets/lottie_animations/deal_tag.json',
                                                                      width:
                                                                          31.0,
                                                                      height:
                                                                          31.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      reverse:
                                                                          true,
                                                                      animate:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60.0),
                                                                ),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30.0,
                                                                  buttonSize:
                                                                      34.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .mapMarkerAlt,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'NEARBY_VIDEO_mapMarkerAlt_ICN_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'IconButton_navigate_to');

                                                                    context.pushNamed(
                                                                        'videoFind');
                                                                  },
                                                                ),
                                                              ),
                                                              StreamBuilder<
                                                                  UsersRecord>(
                                                                stream: UsersRecord
                                                                    .getDocument(
                                                                        currentUserReference!),
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final containerUsersRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Container(
                                                                    width: 33.0,
                                                                    height:
                                                                        33.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        ToggleIcon(
                                                                      onPressed:
                                                                          () async {
                                                                        final savedPostsElement =
                                                                            pageViewPostsRecord.reference;
                                                                        final savedPostsUpdate = containerUsersRecord.savedPosts!.toList().contains(savedPostsElement)
                                                                            ? FieldValue.arrayRemove([
                                                                                savedPostsElement
                                                                              ])
                                                                            : FieldValue.arrayUnion([
                                                                                savedPostsElement
                                                                              ]);
                                                                        final usersUpdateData =
                                                                            {
                                                                          'savedPosts':
                                                                              savedPostsUpdate,
                                                                        };
                                                                        await containerUsersRecord
                                                                            .reference
                                                                            .update(usersUpdateData);
                                                                      },
                                                                      value: containerUsersRecord
                                                                          .savedPosts!
                                                                          .toList()
                                                                          .contains(
                                                                              pageViewPostsRecord.reference),
                                                                      onIcon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .solidBookmark,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryColor,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                      offIcon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .bookmark,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0x001A1F24),
                                                  FlutterFlowTheme.of(context)
                                                      .primaryDark
                                                ],
                                                stops: [0.0, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                StreamBuilder<PostsRecord>(
                                                  stream:
                                                      PostsRecord.getDocument(
                                                          pageViewPostsRecord
                                                              .reference),
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
                                                    final rowPostsRecord =
                                                        snapshot.data!;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Container(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                () {
                                                                  if (rowPostsRecord
                                                                          .userRating ==
                                                                      5.0) {
                                                                    return Color(
                                                                        0xFF3FDF86);
                                                                  } else if (rowPostsRecord
                                                                          .userRating ==
                                                                      4.0) {
                                                                    return Color(
                                                                        0xFFC3DF3F);
                                                                  } else if (rowPostsRecord
                                                                          .userRating ==
                                                                      3.0) {
                                                                    return Color(
                                                                        0xFFDFCB3F);
                                                                  } else if (rowPostsRecord
                                                                          .userRating ==
                                                                      2.0) {
                                                                    return Color(
                                                                        0xFFDF993F);
                                                                  } else if (rowPostsRecord
                                                                          .userRating ==
                                                                      1.0) {
                                                                    return Color(
                                                                        0xFFDF5A3F);
                                                                  } else {
                                                                    return Color(
                                                                        0x00000000);
                                                                  }
                                                                }(),
                                                                Color(
                                                                    0x8E95A1AC),
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                formatNumber(
                                                                  rowPostsRecord
                                                                      .userRating,
                                                                  formatType:
                                                                      FormatType
                                                                          .custom,
                                                                  format: '0',
                                                                  locale: '',
                                                                ),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    fontSize:
                                                                        24.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                                StreamBuilder<UsersRecord>(
                                                  stream:
                                                      UsersRecord.getDocument(
                                                          pageViewPostsRecord
                                                              .user!),
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
                                                    final rowUsersRecord =
                                                        snapshot.data!;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Text(
                                                            rowUsersRecord
                                                                .username!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00EEEEEE),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'NEARBY_VIDEO_Text_e0lepebu_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Text_bottom_sheet');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
                                                                    child:
                                                                        DescriptionSheetWidget(
                                                                      postsDescription:
                                                                          pageViewPostsRecord,
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            },
                                                            child: Text(
                                                              pageViewPostsRecord
                                                                  .description!
                                                                  .maybeHandleOverflow(
                                                                maxChars: 170,
                                                                replacement:
                                                                    '…',
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
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            StreamBuilder<
                                                                UsersRecord>(
                                                              stream: UsersRecord
                                                                  .getDocument(
                                                                      pageViewPostsRecord
                                                                          .user!),
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
                                                                final stackUsersRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'NEARBY_VIDEO_Stack_eszoa87f_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Stack_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'viewProfileOther',
                                                                      queryParams:
                                                                          {
                                                                        'otherUser':
                                                                            serializeParam(
                                                                          stackUsersRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Stack(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              120.0,
                                                                          height:
                                                                              120.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            imageUrl:
                                                                                valueOrDefault<String>(
                                                                              stackUsersRecord.photoUrl,
                                                                              'https://wpcdn.us-east-1.vip.tn-cloud.net/www.hawaiimagazine.com/content/uploads/2020/12/pineapple-opener.jpg',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            40.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              15.0,
                                                                          height:
                                                                              15.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Icon(
                                                                            Icons.add_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            size:
                                                                                10.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          StreamBuilder<
                                                              PostsRecord>(
                                                            stream: PostsRecord
                                                                .getDocument(
                                                                    pageViewPostsRecord
                                                                        .reference),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final rowPostsRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child: StreamBuilder<
                                                                        RestaurantsRecord>(
                                                                      stream: RestaurantsRecord.getDocument(
                                                                          pageViewPostsRecord
                                                                              .restRef!),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 30.0,
                                                                              height: 30.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 30.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final columnRestaurantsRecord =
                                                                            snapshot.data!;
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('NEARBY_VIDEO_commentSection_ON_TAP');
                                                                                logFirebaseEvent('commentSection_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: Container(
                                                                                        height: 600.0,
                                                                                        child: CommentsWidget(
                                                                                          post: pageViewPostsRecord,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  InkWell(
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('NEARBY_VIDEO_Icon_z5ggcrqc_ON_TAP');
                                                                                      logFirebaseEvent('Icon_play_sound');
                                                                                      _model.soundPlayer1 ??= AudioPlayer();
                                                                                      if (_model.soundPlayer1!.playing) {
                                                                                        await _model.soundPlayer1!.stop();
                                                                                      }

                                                                                      _model.soundPlayer1!.setAsset('assets/audios/Female_Saying_Yummy_2_1.mp3').then((_) => _model.soundPlayer1!.play());

                                                                                      logFirebaseEvent('Icon_bottom_sheet');
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: FlutterFlowTheme.of(context).primaryDark,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return Padding(
                                                                                            padding: MediaQuery.of(context).viewInsets,
                                                                                            child: Container(
                                                                                              height: 366.0,
                                                                                              child: AddMenuCartWidget(
                                                                                                post: pageViewPostsRecord,
                                                                                                restaurant: columnRestaurantsRecord,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => setState(() {}));
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.fastfood_rounded,
                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                      size: 30.0,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                rowPostsRecord.menuItems!.toList().length.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Lexend Deca',
                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('NEARBY_VIDEO_commentSection_ON_TAP');
                                                                            logFirebaseEvent('commentSection_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return Padding(
                                                                                  padding: MediaQuery.of(context).viewInsets,
                                                                                  child: Container(
                                                                                    height: 600.0,
                                                                                    child: CommentsWidget(
                                                                                      post: pageViewPostsRecord,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('NEARBY_VIDEO_Icon_yrabov5g_ON_TAP');
                                                                                  logFirebaseEvent('Icon_bottom_sheet');
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return Padding(
                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                        child: CommentsCopyWidget(
                                                                                          post: pageViewPostsRecord,
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.mode_comment_outlined,
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                  size: 30.0,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            rowPostsRecord.numComments?.toString(),
                                                                            '0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  StreamBuilder<
                                                                      UsersRecord>(
                                                                    stream: UsersRecord.getDocument(
                                                                        pageViewPostsRecord
                                                                            .user!),
                                                                    builder:
                                                                        (context,
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
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 30.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final columnUsersRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Stack(
                                                                            children: [
                                                                              if (rowPostsRecord.likes!.toList().contains(currentUserReference))
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.25),
                                                                                  child: InkWell(
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('NEARBY_VIDEO_Icon_dixusb2b_ON_TAP');
                                                                                      logFirebaseEvent('Icon_backend_call');

                                                                                      final postsUpdateData = {
                                                                                        'likes': FieldValue.arrayUnion([
                                                                                          currentUserReference
                                                                                        ]),
                                                                                      };
                                                                                      await pageViewPostsRecord.reference.update(postsUpdateData);
                                                                                      logFirebaseEvent('Icon_play_sound');
                                                                                      _model.soundPlayer2 ??= AudioPlayer();
                                                                                      if (_model.soundPlayer2!.playing) {
                                                                                        await _model.soundPlayer2!.stop();
                                                                                      }

                                                                                      _model.soundPlayer2!.setAsset('assets/audios/Transform_Sizzle_Swoosh_04.wav').then((_) => _model.soundPlayer2!.play());

                                                                                      logFirebaseEvent('Icon_widget_animation');
                                                                                      if (animationsMap['iconOnActionTriggerAnimation'] != null) {
                                                                                        setState(() => hasIconTriggered = true);
                                                                                        SchedulerBinding.instance.addPostFrameCallback((_) async => await animationsMap['iconOnActionTriggerAnimation']!.controller.forward(from: 0.0));
                                                                                      }
                                                                                      logFirebaseEvent('Icon_backend_call');

                                                                                      final usersUpdateData = {
                                                                                        'flavorTotal': FieldValue.increment(1),
                                                                                        'fizzzCoin': FieldValue.increment(1),
                                                                                        'fizzzMonthly': FieldValue.increment(1),
                                                                                      };
                                                                                      await columnUsersRecord.reference.update(usersUpdateData);
                                                                                    },
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.fire,
                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                      size: 26.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (rowPostsRecord.likes!.toList().contains(currentUserReference))
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.25),
                                                                                  child: InkWell(
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('NEARBY_VIDEO_Icon_v6jvnocy_ON_TAP');
                                                                                      logFirebaseEvent('Icon_backend_call');

                                                                                      final postsUpdateData = {
                                                                                        'likes': FieldValue.arrayRemove([
                                                                                          currentUserReference
                                                                                        ]),
                                                                                      };
                                                                                      await pageViewPostsRecord.reference.update(postsUpdateData);
                                                                                      logFirebaseEvent('Icon_backend_call');

                                                                                      final usersUpdateData = {
                                                                                        'flavorTotal': FieldValue.increment(-1),
                                                                                        'fizzzCoin': FieldValue.increment(-1),
                                                                                        'fizzzMonthly': FieldValue.increment(-1),
                                                                                      };
                                                                                      await columnUsersRecord.reference.update(usersUpdateData);
                                                                                    },
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.fire,
                                                                                      color: Color(0xFFB94600),
                                                                                      size: 26.0,
                                                                                    ),
                                                                                  ).animateOnActionTrigger(animationsMap['iconOnActionTriggerAnimation']!, hasBeenTriggered: hasIconTriggered),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                functions.likes(rowPostsRecord).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
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
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.95, 0.7),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage: min(
                                            widget.initialStoryIndex!,
                                            pageViewPostsRecordList.length -
                                                1)),
                                count: pageViewPostsRecordList.length,
                                axisDirection: Axis.vertical,
                                onDotClicked: (i) {
                                  _model.pageViewController!.animateToPage(
                                    i,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                effect:
                                    smooth_page_indicator.ExpandingDotsEffect(
                                  expansionFactor: 2.0,
                                  spacing: 8.0,
                                  radius: 16.0,
                                  dotWidth: 8.0,
                                  dotHeight: 4.0,
                                  dotColor: Color(0x4E6E6E6E),
                                  activeDotColor: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  paintStyle: PaintingStyle.fill,
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
            ),
          ),
        ));
  }
}
