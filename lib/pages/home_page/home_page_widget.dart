import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/add_menu_cart/add_menu_cart_widget.dart';
import '/components/comments/comments_widget.dart';
import '/components/comments_copy/comments_copy_widget.dart';
import '/components/description_sheet/description_sheet_widget.dart';
import '/components/flag_video/flag_video_widget.dart';
import '/components/reply_video/reply_video_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
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
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
    this.numLikes,
    this.user,
    this.posts,
    this.users,
  }) : super(key: key);

  final int? numLikes;
  final UsersRecord? user;
  final PostsRecord? posts;
  final DocumentReference? users;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
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
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'homePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_homePage_ON_PAGE_LOAD');
      logFirebaseEvent('homePage_custom_action');
      await actions.lockOrientation();
      if (!((FFAppState().outOfRangeInteger >=
              functions.distanceFromIndianapolisCenter(
                  currentUserLocationValue, FFAppState().indianapolisCenter)) ||
          (FFAppState().outOfRangeInteger <=
              functions.distanceFromIndianapolisCenter(
                  currentUserDocument!.locationDelivery,
                  FFAppState().indianapolisCenter)))) {
        logFirebaseEvent('homePage_wait__delay');
        await Future.delayed(const Duration(milliseconds: 2000));
        logFirebaseEvent('homePage_navigate_to');

        context.pushNamed(
          'indyOnly',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.rightToLeft,
            ),
          },
        );
      } else {
        return;
      }
    });

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

    _unfocusNode.dispose();
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
        title: 'homePage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryDark,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord
                              .orderBy('created_at', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: SpinKitThreeBounce(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 30.0,
                                ),
                              ),
                            );
                          }
                          List<PostsRecord> pageViewPostsRecordList =
                              snapshot.data!;
                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage: min(0,
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
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryDark,
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
                                          allowFullScreen: false,
                                          allowPlaybackSpeedMenu: false,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 270.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x45EEEEEE),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                                    'HOME_PAGE_PAGE_userInfo_ON_TAP');
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

                                                                context
                                                                    .pushNamed(
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
                                                                    child: Hero(
                                                                      tag: valueOrDefault<
                                                                          String>(
                                                                        userInfoRestaurantsRecord
                                                                            .logo,
                                                                        'https://assets.bonappetit.com/photos/610aa6ddc50e2f9f7c42f7f8/master/pass/Savage-2019-top-50-busy-restaurant.jpg' +
                                                                            '$pageViewIndex',
                                                                      ),
                                                                      transitionOnUserGestures:
                                                                          true,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
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
                                                                            userInfoRestaurantsRecord.logo,
                                                                            'https://assets.bonappetit.com/photos/610aa6ddc50e2f9f7c42f7f8/master/pass/Savage-2019-top-50-busy-restaurant.jpg',
                                                                          ),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
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
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (pageViewPostsRecord
                                                                            .hasReply ??
                                                                        true)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('HOME_VideoPlayer_1jvknptx_ON_TAP');
                                                                            logFirebaseEvent('VideoPlayer_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return Padding(
                                                                                  padding: MediaQuery.of(context).viewInsets,
                                                                                  child: Container(
                                                                                    height: MediaQuery.of(context).size.height * 1.0,
                                                                                    child: ReplyVideoWidget(),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));
                                                                          },
                                                                          child:
                                                                              FlutterFlowVideoPlayer(
                                                                            path:
                                                                                pageViewPostsRecord.videoReplyURL!,
                                                                            videoType:
                                                                                VideoType.network,
                                                                            width:
                                                                                54.0,
                                                                            height:
                                                                                96.0,
                                                                            autoPlay:
                                                                                false,
                                                                            looping:
                                                                                false,
                                                                            showControls:
                                                                                false,
                                                                            allowFullScreen:
                                                                                false,
                                                                            allowPlaybackSpeedMenu:
                                                                                false,
                                                                            lazyLoad:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                                if (pageViewPostsRecord
                                                                        .hasReply ??
                                                                    true)
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (userInfoRestaurantsRecord
                                                                              .userConnection ==
                                                                          currentUserReference)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.97,
                                                                              -0.57),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('HOME_PAGE_PAGE_REPLY_BTN_ON_TAP');
                                                                                logFirebaseEvent('Button_upload_media_to_firebase');
                                                                                final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                  context: context,
                                                                                  allowPhoto: false,
                                                                                  allowVideo: true,
                                                                                );
                                                                                if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                  setState(() => _model.isMediaUploading = true);
                                                                                  var selectedUploadedFiles = <FFUploadedFile>[];
                                                                                  var downloadUrls = <String>[];
                                                                                  try {
                                                                                    showUploadMessage(
                                                                                      context,
                                                                                      'Uploading file...',
                                                                                      showLoading: true,
                                                                                    );
                                                                                    selectedUploadedFiles = selectedMedia
                                                                                        .map((m) => FFUploadedFile(
                                                                                              name: m.storagePath.split('/').last,
                                                                                              bytes: m.bytes,
                                                                                              height: m.dimensions?.height,
                                                                                              width: m.dimensions?.width,
                                                                                            ))
                                                                                        .toList();

                                                                                    downloadUrls = (await Future.wait(
                                                                                      selectedMedia.map(
                                                                                        (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                      ),
                                                                                    ))
                                                                                        .where((u) => u != null)
                                                                                        .map((u) => u!)
                                                                                        .toList();
                                                                                  } finally {
                                                                                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                    _model.isMediaUploading = false;
                                                                                  }
                                                                                  if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                    setState(() {
                                                                                      _model.uploadedLocalFile = selectedUploadedFiles.first;
                                                                                      _model.uploadedFileUrl = downloadUrls.first;
                                                                                    });
                                                                                    showUploadMessage(context, 'Success!');
                                                                                  } else {
                                                                                    setState(() {});
                                                                                    showUploadMessage(context, 'Failed to upload media');
                                                                                    return;
                                                                                  }
                                                                                }

                                                                                logFirebaseEvent('Button_backend_call');

                                                                                final replyVideosCreateData = createReplyVideosRecordData(
                                                                                  user: currentUserReference,
                                                                                  post: pageViewPostsRecord.reference,
                                                                                  video: _model.uploadedFileUrl,
                                                                                );
                                                                                var replyVideosRecordReference = ReplyVideosRecord.collection.doc();
                                                                                await replyVideosRecordReference.set(replyVideosCreateData);
                                                                                _model.replyVideo = ReplyVideosRecord.getDocumentFromData(replyVideosCreateData, replyVideosRecordReference);
                                                                                logFirebaseEvent('Button_backend_call');

                                                                                final postsUpdateData = createPostsRecordData(
                                                                                  replyVideo: _model.replyVideo!.reference,
                                                                                  hasReply: true,
                                                                                  videoReplyURL: _model.uploadedFileUrl,
                                                                                );
                                                                                await pageViewPostsRecord.reference.update(postsUpdateData);

                                                                                setState(() {});
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'mr1fdlx2' /* Reply */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                width: 130.0,
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                if (pageViewPostsRecord
                                                                        .hasReply ??
                                                                    true)
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.36,
                                                                            14.18),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'HOME_PAGE_PAGE_Container_3avafoc0_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Container_bottom_sheet');
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
                                                                                  height: MediaQuery.of(context).size.height * 1.0,
                                                                                  child: ReplyVideoWidget(
                                                                                    video2: pageViewPostsRecord.replyVideo,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              54.0,
                                                                          height:
                                                                              96.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryDark,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_PAGE_PAGE_flag_rounded_ICN_ON_TAP');
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
                                                                              post: pageViewPostsRecord,
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
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            60.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
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
                                                                            'HOME_LottieAnimation_zqcmtmno_ON_TAP');
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
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .mapMarkerAlt,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_PAGE_PAGE_mapMarkerAlt_ICN_ON_TAP');
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
                                                                      width:
                                                                          33.0,
                                                                      height:
                                                                          33.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
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
                                                                            .contains(pageViewPostsRecord.reference),
                                                                        onIcon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidBookmark,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryColor,
                                                                          size:
                                                                              16.0,
                                                                        ),
                                                                        offIcon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .bookmark,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
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
                                              height: 230.0,
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
                                                  Row(
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
                                                                if (pageViewPostsRecord
                                                                        .userRating ==
                                                                    5.0) {
                                                                  return Color(
                                                                      0xFF3FDF86);
                                                                } else if (widget
                                                                        .posts!
                                                                        .userRating ==
                                                                    4.0) {
                                                                  return Color(
                                                                      0xFFC3DF3F);
                                                                } else if (widget
                                                                        .posts!
                                                                        .userRating ==
                                                                    3.0) {
                                                                  return Color(
                                                                      0xFFDFCB3F);
                                                                } else if (widget
                                                                        .posts!
                                                                        .userRating ==
                                                                    2.0) {
                                                                  return Color(
                                                                      0xFFDF993F);
                                                                } else if (widget
                                                                        .posts!
                                                                        .userRating ==
                                                                    1.0) {
                                                                  return Color(
                                                                      0xFFDF5A3F);
                                                                } else {
                                                                  return Color(
                                                                      0x00000000);
                                                                }
                                                              }(),
                                                              Color(0x8E95A1AC),
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            formatNumber(
                                                              pageViewPostsRecord
                                                                  .userRating!,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '0',
                                                              locale: '',
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
                                                  ),
                                                  StreamBuilder<UsersRecord>(
                                                    stream:
                                                        UsersRecord.getDocument(
                                                            pageViewPostsRecord
                                                                .user!),
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
                                                    width:
                                                        MediaQuery.of(context)
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
                                                                    'HOME_PAGE_PAGE_Text_u6bdy7u0_ON_TAP');
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                16.0,
                                                                16.0),
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
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
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
                                                                      final containerUsersRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Container(
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
                                                                            InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('HOME_CircleImage_j8c40445_ON_TAP');
                                                                            logFirebaseEvent('CircleImage_navigate_to');

                                                                            context.pushNamed(
                                                                              'viewProfileOther',
                                                                              queryParams: {
                                                                                'otherUser': serializeParam(
                                                                                  containerUsersRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
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
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                containerUsersRecord.photoUrl,
                                                                                'https://wpcdn.us-east-1.vip.tn-cloud.net/www.hawaiimagazine.com/content/uploads/2020/12/pineapple-opener.jpg',
                                                                              ),
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .add_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        size:
                                                                            10.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
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
                                                                              logFirebaseEvent('HOME_PAGE_PAGE_commentSection_ON_TAP');
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
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_PAGE_Icon_o0crli4b_ON_TAP');
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
                                                                                            height: 470.0,
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
                                                                              pageViewPostsRecord.menuItems!.toList().length.toString(),
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
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_PAGE_Icon_b8af9q03_ON_TAP');
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
                                                                            child:
                                                                                Icon(
                                                                              Icons.mode_comment_outlined,
                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                              size: 30.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        pageViewPostsRecord
                                                                            .numComments!
                                                                            .toString(),
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
                                                                            if (!pageViewPostsRecord.likes!.toList().contains(currentUserReference))
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.25),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_PAGE_Icon_1uur14aw_ON_TAP');
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
                                                                                      'fizzzCoin': FieldValue.increment(2),
                                                                                      'fizzzMonthly': FieldValue.increment(2),
                                                                                    };
                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.fire,
                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    size: 26.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (pageViewPostsRecord.likes!.toList().contains(currentUserReference))
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.25),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_PAGE_PAGE_Icon_awazbeqs_ON_TAP');
                                                                                    logFirebaseEvent('Icon_backend_call');

                                                                                    final postsUpdateData = {
                                                                                      'likes': FieldValue.arrayRemove([
                                                                                        currentUserReference
                                                                                      ]),
                                                                                    };
                                                                                    await pageViewPostsRecord.reference.update(postsUpdateData);
                                                                                    logFirebaseEvent('Icon_backend_call');

                                                                                    final usersUpdateData = {
                                                                                      'fizzzCoin': FieldValue.increment(-2),
                                                                                      'fizzzMonthly': FieldValue.increment(-2),
                                                                                    };
                                                                                    await currentUserReference!.update(usersUpdateData);
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
                                                                              functions.likes(pageViewPostsRecord).toString(),
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
                                      ),
                                    ],
                                  ),
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
          ),
        ));
  }
}
