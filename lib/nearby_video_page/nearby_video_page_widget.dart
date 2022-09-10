import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_menu_cart_widget.dart';
import '../components/comments_copy_widget.dart';
import '../components/comments_widget.dart';
import '../components/description_sheet_widget.dart';
import '../components/flag_video_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
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
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  PageController? pageViewController;
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        scale: 1.2,
        opacity: 0,
      ),
      finalState: AnimationState(
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'nearbyVideoPage'});
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
      backgroundColor: FlutterFlowTheme.of(context).primaryDark,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: FutureBuilder<List<PostsRecord>>(
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
                        width: 30,
                        height: 30,
                        child: SpinKitThreeBounce(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 30,
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
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                          child: PageView.builder(
                            controller: pageViewController ??= PageController(
                                initialPage: min(widget.initialStoryIndex!,
                                    pageViewPostsRecordList.length - 1)),
                            scrollDirection: Axis.vertical,
                            itemCount: pageViewPostsRecordList.length,
                            itemBuilder: (context, pageViewIndex) {
                              final pageViewPostsRecord =
                                  pageViewPostsRecordList[pageViewIndex];
                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                1,
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
                                          height: 300,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .primaryDark,
                                                Color(0x001A1F24)
                                              ],
                                              stops: [0, 1],
                                              begin:
                                                  AlignmentDirectional(0, -1),
                                              end: AlignmentDirectional(0, 1),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 20, 10, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x45EEEEEE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 16, 0),
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
                                                        final userInfoRestaurantsRecord =
                                                            snapshot.data!;
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
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
                                                                          10,
                                                                          0,
                                                                          0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'NEARBY_VIDEO_CircleImage_212xm8kn_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'CircleImage_Navigate-To');

                                                                  context
                                                                      .pushNamed(
                                                                    'restaurantDetails',
                                                                    queryParams:
                                                                        {
                                                                      'restaurant': serializeParam(
                                                                          userInfoRestaurantsRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference),
                                                                    }.withoutNulls,
                                                                  );

                                                                  logFirebaseEvent(
                                                                      'CircleImage_Backend-Call');

                                                                  final restaurantsUpdateData =
                                                                      {
                                                                    'cardClicks':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  };
                                                                  await userInfoRestaurantsRecord
                                                                      .reference
                                                                      .update(
                                                                          restaurantsUpdateData);
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 50,
                                                                  height: 50,
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
                                                            ),
                                                            Expanded(
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'NEARBY_VIDEO_Column_slpvv86z_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Column_Navigate-To');

                                                                  context
                                                                      .pushNamed(
                                                                    'restaurantDetails',
                                                                    queryParams:
                                                                        {
                                                                      'restaurant': serializeParam(
                                                                          userInfoRestaurantsRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference),
                                                                    }.withoutNulls,
                                                                  );

                                                                  logFirebaseEvent(
                                                                      'Column_Backend-Call');

                                                                  final restaurantsUpdateData =
                                                                      {
                                                                    'cardClicks':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  };
                                                                  await userInfoRestaurantsRecord
                                                                      .reference
                                                                      .update(
                                                                          restaurantsUpdateData);
                                                                },
                                                                child: Column(
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
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            userInfoRestaurantsRecord.restaurantName!.maybeHandleOverflow(maxChars: 25),
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        userInfoRestaurantsRecord
                                                                            .restAddress!
                                                                            .maybeHandleOverflow(maxChars: 40),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                              fontSize: 12,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              userInfoRestaurantsRecord.priceRange,
                                                                              '\$\$',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: Color(0xFF32FF48),
                                                                                  fontSize: 12,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            userInfoRestaurantsRecord.categories!.maybeHandleOverflow(maxChars: 35),
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                  fontSize: 12,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            '${valueOrDefault<String>(
                                                                              userInfoRestaurantsRecord.reviews?.toString(),
                                                                              '0',
                                                                            )} reviews',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                  fontSize: 12,
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
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 5, 0),
                                                child: StreamBuilder<
                                                    RestaurantsRecord>(
                                                  stream: RestaurantsRecord
                                                      .getDocument(
                                                          pageViewPostsRecord
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
                                                    final userInfoRestaurantsRecord =
                                                        snapshot.data!;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                buttonSize: 34,
                                                                fillColor: Color(
                                                                    0xFF2D2D2D),
                                                                icon: Icon(
                                                                  Icons
                                                                      .close_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  size: 20,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'NEARBY_VIDEO_close_rounded_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_Navigate-Back');
                                                                  context.pop();
                                                                },
                                                              ),
                                                            ),
                                                            Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryDark,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                buttonSize: 34,
                                                                fillColor: Color(
                                                                    0xFF2D2D2D),
                                                                icon: Icon(
                                                                  Icons
                                                                      .flag_rounded,
                                                                  color: Color(
                                                                      0xFFA4A4A4),
                                                                  size: 20,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'NEARBY_VIDEO_flag_rounded_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_Bottom-Sheet');
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
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryDark,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30,
                                                                    buttonSize:
                                                                        34,
                                                                    fillColor:
                                                                        Color(
                                                                            0xFF2D2D2D),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .theaters,
                                                                      color: Color(
                                                                          0xFFA4A4A4),
                                                                      size: 20,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'NEARBY_VIDEO_theaters_ICN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'IconButton_Backend-Call');

                                                                      final usersUpdateData =
                                                                          {
                                                                        'savedPosts':
                                                                            FieldValue.arrayUnion([
                                                                          pageViewPostsRecord
                                                                              .reference
                                                                        ]),
                                                                      };
                                                                      await currentUserReference!
                                                                          .update(
                                                                              usersUpdateData);
                                                                    },
                                                                  ),
                                                                  if ((currentUserDocument
                                                                              ?.savedPosts
                                                                              ?.toList() ??
                                                                          [])
                                                                      .contains(
                                                                          pageViewPostsRecord
                                                                              .reference))
                                                                    AuthUserStreamWidget(
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            30,
                                                                        buttonSize:
                                                                            34,
                                                                        fillColor:
                                                                            Color(0xFF2D2D2D),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .theaters,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryColor,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'NEARBY_VIDEO_theaters_ICN_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'IconButton_Backend-Call');

                                                                          final usersUpdateData =
                                                                              {
                                                                            'savedPosts':
                                                                                FieldValue.arrayUnion([
                                                                              pageViewPostsRecord.reference
                                                                            ]),
                                                                          };
                                                                          await currentUserReference!
                                                                              .update(usersUpdateData);
                                                                        },
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            2,
                                                                            2,
                                                                            2),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'NEARBY_VIDEO_LottieAnimation_h4qgyna0_ON');
                                                                    logFirebaseEvent(
                                                                        'LottieAnimation_Navigate-To');

                                                                    context
                                                                        .pushNamed(
                                                                      'restDealPage',
                                                                      queryParams:
                                                                          {
                                                                        'restaurant': serializeParam(
                                                                            userInfoRestaurantsRecord,
                                                                            ParamType.Document),
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
                                                                    width: 31,
                                                                    height: 31,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                              ),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                buttonSize: 34,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .mapMarkerAlt,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  size: 20,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'NEARBY_VIDEO_mapMarkerAlt_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_Navigate-To');

                                                                  context.pushNamed(
                                                                      'videoFind');
                                                                },
                                                              ),
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
                                              stops: [0, 1],
                                              begin:
                                                  AlignmentDirectional(0, -1),
                                              end: AlignmentDirectional(0, 1),
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
                                                stream: PostsRecord.getDocument(
                                                    pageViewPostsRecord
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
                                                  final rowPostsRecord =
                                                      snapshot.data!;
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 10),
                                                        child: Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiaryColor,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
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
                                                                  fontSize: 24,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                              StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    pageViewPostsRecord.user!),
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
                                                  final rowUsersRecord =
                                                      snapshot.data!;
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 10),
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
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00EEEEEE),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'NEARBY_VIDEO_Text_e0lepebu_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Text_Bottom-Sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              context: context,
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
                                                            );
                                                          },
                                                          child: Text(
                                                            pageViewPostsRecord
                                                                .description!
                                                                .maybeHandleOverflow(
                                                              maxChars: 170,
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
                                                                      .tertiaryColor,
                                                                  fontSize: 12,
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
                                                    .fromSTEB(16, 12, 16, 16),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 20, 0),
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
                                                              final stackUsersRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'NEARBY_VIDEO_Stack_eszoa87f_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Stack_Navigate-To');

                                                                  context
                                                                      .pushNamed(
                                                                    'viewProfileOther',
                                                                    queryParams:
                                                                        {
                                                                      'otherUser': serializeParam(
                                                                          stackUsersRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Stack(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  children: [
                                                                    Container(
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            120,
                                                                        height:
                                                                            120,
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
                                                                            'https://p1.pxfuel.com/preview/828/149/229/indistinct-blurred-pineapple-rough.jpg',
                                                                          ),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              30,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            15,
                                                                        height:
                                                                            15,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .add_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiaryColor,
                                                                          size:
                                                                              10,
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
                                                            final rowPostsRecord =
                                                                snapshot.data!;
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
                                                                          0,
                                                                          0,
                                                                          20,
                                                                          0),
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
                                                                            width:
                                                                                30,
                                                                            height:
                                                                                30,
                                                                            child:
                                                                                SpinKitThreeBounce(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 30,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final columnRestaurantsRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('NEARBY_VIDEO_commentSection_ON_TAP');
                                                                              logFirebaseEvent('commentSection_Bottom-Sheet');
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: Container(
                                                                                      height: 600,
                                                                                      child: CommentsWidget(
                                                                                        post: pageViewPostsRecord,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('NEARBY_VIDEO_Icon_z5ggcrqc_ON_TAP');
                                                                                    logFirebaseEvent('Icon_Play-Sound');
                                                                                    soundPlayer1 ??= AudioPlayer();
                                                                                    if (soundPlayer1!.playing) {
                                                                                      await soundPlayer1!.stop();
                                                                                    }

                                                                                    soundPlayer1!.setAsset('assets/audios/Female_Saying_Yummy_2_1.mp3').then((_) => soundPlayer1!.play());

                                                                                    logFirebaseEvent('Icon_Bottom-Sheet');
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: FlutterFlowTheme.of(context).primaryDark,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return Padding(
                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                          child: Container(
                                                                                            height: 366,
                                                                                            child: AddMenuCartWidget(
                                                                                              post: pageViewPostsRecord,
                                                                                              restaurant: columnRestaurantsRecord,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.fastfood_rounded,
                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    size: 30,
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
                                                                          0,
                                                                          0,
                                                                          20,
                                                                          0),
                                                                  child: Column(
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
                                                                          logFirebaseEvent(
                                                                              'NEARBY_VIDEO_commentSection_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'commentSection_Bottom-Sheet');
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return Padding(
                                                                                padding: MediaQuery.of(context).viewInsets,
                                                                                child: Container(
                                                                                  height: 600,
                                                                                  child: CommentsWidget(
                                                                                    post: pageViewPostsRecord,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('NEARBY_VIDEO_Icon_yrabov5g_ON_TAP');
                                                                                logFirebaseEvent('Icon_Bottom-Sheet');
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
                                                                                );
                                                                              },
                                                                              child: Icon(
                                                                                Icons.mode_comment_outlined,
                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                size: 30,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          rowPostsRecord
                                                                              .numComments
                                                                              ?.toString(),
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
                                                                    final columnUsersRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Stack(
                                                                          children: [
                                                                            if (rowPostsRecord.likes!.toList().contains(currentUserReference))
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0, 0.25),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('NEARBY_VIDEO_Icon_dixusb2b_ON_TAP');
                                                                                    logFirebaseEvent('Icon_Backend-Call');

                                                                                    final postsUpdateData = {
                                                                                      'likes': FieldValue.arrayUnion([
                                                                                        currentUserReference
                                                                                      ]),
                                                                                    };
                                                                                    await pageViewPostsRecord.reference.update(postsUpdateData);
                                                                                    logFirebaseEvent('Icon_Play-Sound');
                                                                                    soundPlayer2 ??= AudioPlayer();
                                                                                    if (soundPlayer2!.playing) {
                                                                                      await soundPlayer2!.stop();
                                                                                    }

                                                                                    soundPlayer2!.setAsset('assets/audios/Transform_Sizzle_Swoosh_04.wav').then((_) => soundPlayer2!.play());

                                                                                    logFirebaseEvent('Icon_Widget-Animation');
                                                                                    if (animationsMap['iconOnActionTriggerAnimation'] == null) {
                                                                                      return;
                                                                                    }
                                                                                    await (animationsMap['iconOnActionTriggerAnimation']!.curvedAnimation.parent as AnimationController).forward(from: 0.0);

                                                                                    logFirebaseEvent('Icon_Backend-Call');

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
                                                                                    size: 26,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (rowPostsRecord.likes!.toList().contains(currentUserReference))
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0, 0.25),
                                                                                child:
                                                                                    InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('NEARBY_VIDEO_Icon_v6jvnocy_ON_TAP');
                                                                                    logFirebaseEvent('Icon_Backend-Call');

                                                                                    final postsUpdateData = {
                                                                                      'likes': FieldValue.arrayRemove([
                                                                                        currentUserReference
                                                                                      ]),
                                                                                    };
                                                                                    await pageViewPostsRecord.reference.update(postsUpdateData);
                                                                                    logFirebaseEvent('Icon_Backend-Call');

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
                                                                                    size: 26,
                                                                                  ),
                                                                                ).animated([
                                                                                  animationsMap['iconOnActionTriggerAnimation']!
                                                                                ]),
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: SmoothPageIndicator(
                              controller: pageViewController ??= PageController(
                                  initialPage: min(widget.initialStoryIndex!,
                                      pageViewPostsRecordList.length - 1)),
                              count: pageViewPostsRecordList.length,
                              axisDirection: Axis.vertical,
                              onDotClicked: (i) {
                                pageViewController!.animateToPage(
                                  i,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              effect: ExpandingDotsEffect(
                                expansionFactor: 2,
                                spacing: 8,
                                radius: 16,
                                dotWidth: 8,
                                dotHeight: 4,
                                dotColor: Color(0x4E6E6E6E),
                                activeDotColor:
                                    FlutterFlowTheme.of(context).tertiaryColor,
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
            ),
          ],
        ),
      ),
    );
  }
}
