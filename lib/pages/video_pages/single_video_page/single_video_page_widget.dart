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
import 'single_video_page_model.dart';
export 'single_video_page_model.dart';

class SingleVideoPageWidget extends StatefulWidget {
  const SingleVideoPageWidget({
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
  _SingleVideoPageWidgetState createState() => _SingleVideoPageWidgetState();
}

class _SingleVideoPageWidgetState extends State<SingleVideoPageWidget>
    with TickerProviderStateMixin {
  late SingleVideoPageModel _model;

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
    _model = createModel(context, () => SingleVideoPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'singleVideoPage'});
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

    return StreamBuilder<PostsRecord>(
      stream: PostsRecord.getDocument(widget.post!.reference),
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
        final singleVideoPagePostsRecord = snapshot.data!;
        return Title(
            title: 'singleVideoPage',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryDark,
              body: SafeArea(
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 1.0,
                            decoration: BoxDecoration(
                              color: Color(0x00960000),
                            ),
                            child: FlutterFlowVideoPlayer(
                              path: valueOrDefault<String>(
                                widget.post!.videoUrl,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 300.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).primaryDark,
                                Color(0x001A1F24)
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x45EEEEEE),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 16.0, 0.0),
                                    child: StreamBuilder<RestaurantsRecord>(
                                      stream: RestaurantsRecord.getDocument(
                                          singleVideoPagePostsRecord.restRef!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30.0,
                                              height: 30.0,
                                              child: SpinKitThreeBounce(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                'SINGLE_VIDEO_PAGE_PAGE_userInfo_ON_TAP');
                                            logFirebaseEvent(
                                                'userInfo_backend_call');

                                            final restaurantsUpdateData = {
                                              'cardClicks':
                                                  FieldValue.increment(1),
                                            };
                                            await userInfoRestaurantsRecord
                                                .reference
                                                .update(restaurantsUpdateData);
                                            logFirebaseEvent(
                                                'userInfo_navigate_to');

                                            context.pushNamed(
                                              'restaurantDetails',
                                              queryParams: {
                                                'restaurant': serializeParam(
                                                  userInfoRestaurantsRecord
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      userInfoRestaurantsRecord
                                                          .logo,
                                                      'https://assets.bonappetit.com/photos/610aa6ddc50e2f9f7c42f7f8/master/pass/Savage-2019-top-50-busy-restaurant.jpg',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              userInfoRestaurantsRecord
                                                                  .restaurantName!
                                                                  .maybeHandleOverflow(
                                                                      maxChars:
                                                                          25),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${functions.getDistance(currentUserLocationValue, userInfoRestaurantsRecord.restLatLong)} mi.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          userInfoRestaurantsRecord
                                                              .restAddress!
                                                              .maybeHandleOverflow(
                                                                  maxChars: 40),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                userInfoRestaurantsRecord
                                                                    .priceRange,
                                                                '\$\$',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF32FF48),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              userInfoRestaurantsRecord
                                                                  .categories!
                                                                  .maybeHandleOverflow(
                                                                      maxChars:
                                                                          35),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor,
                                                                    fontSize:
                                                                        12.0,
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
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${valueOrDefault<String>(
                                                                userInfoRestaurantsRecord
                                                                    .reviews
                                                                    ?.toString(),
                                                                '0',
                                                              )} reviews',
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: StreamBuilder<RestaurantsRecord>(
                                  stream: RestaurantsRecord.getDocument(
                                      singleVideoPagePostsRecord.restRef!),
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
                                    final userInfoRestaurantsRecord =
                                        snapshot.data!;
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        StreamBuilder<PostsRecord>(
                                          stream: PostsRecord.getDocument(
                                              singleVideoPagePostsRecord
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
                                            final stackPostsRecord =
                                                snapshot.data!;
                                            return Stack(
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (singleVideoPagePostsRecord
                                                            .hasReply ??
                                                        true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'SINGLE_VIDEO_VideoPlayer_irs8qcw7_ON_TAP');
                                                            logFirebaseEvent(
                                                                'VideoPlayer_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1.0,
                                                                    child:
                                                                        ReplyVideoWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child:
                                                              FlutterFlowVideoPlayer(
                                                            path: singleVideoPagePostsRecord
                                                                .videoReplyURL!,
                                                            videoType: VideoType
                                                                .network,
                                                            width: 54.0,
                                                            height: 96.0,
                                                            autoPlay: false,
                                                            looping: false,
                                                            showControls: false,
                                                            allowFullScreen:
                                                                false,
                                                            allowPlaybackSpeedMenu:
                                                                false,
                                                            lazyLoad: false,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                if (singleVideoPagePostsRecord
                                                        .hasReply ??
                                                    true)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (userInfoRestaurantsRecord
                                                              .userConnection ==
                                                          currentUserReference)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.97, -0.57),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'SINGLE_VIDEO_PAGE_PAGE_REPLY_BTN_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Button_upload_media_to_firebase');
                                                                final selectedMedia =
                                                                    await selectMediaWithSourceBottomSheet(
                                                                  context:
                                                                      context,
                                                                  allowPhoto:
                                                                      false,
                                                                  allowVideo:
                                                                      true,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  setState(() =>
                                                                      _model.isMediaUploading =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];
                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Uploading file...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isMediaUploading =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    setState(
                                                                        () {
                                                                      _model.uploadedLocalFile =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Success!');
                                                                  } else {
                                                                    setState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Failed to upload media');
                                                                    return;
                                                                  }
                                                                }

                                                                logFirebaseEvent(
                                                                    'Button_backend_call');

                                                                final replyVideosCreateData =
                                                                    createReplyVideosRecordData(
                                                                  user:
                                                                      currentUserReference,
                                                                  post: singleVideoPagePostsRecord
                                                                      .reference,
                                                                  video: _model
                                                                      .uploadedFileUrl,
                                                                );
                                                                var replyVideosRecordReference =
                                                                    ReplyVideosRecord
                                                                        .collection
                                                                        .doc();
                                                                await replyVideosRecordReference
                                                                    .set(
                                                                        replyVideosCreateData);
                                                                _model.replyVideo =
                                                                    ReplyVideosRecord.getDocumentFromData(
                                                                        replyVideosCreateData,
                                                                        replyVideosRecordReference);
                                                                logFirebaseEvent(
                                                                    'Button_backend_call');

                                                                final postsUpdateData =
                                                                    createPostsRecordData(
                                                                  replyVideo: _model
                                                                      .replyVideo!
                                                                      .reference,
                                                                  hasReply:
                                                                      true,
                                                                  videoReplyURL:
                                                                      _model
                                                                          .uploadedFileUrl,
                                                                );
                                                                await singleVideoPagePostsRecord
                                                                    .reference
                                                                    .update(
                                                                        postsUpdateData);

                                                                setState(() {});
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '7a31neeg' /* Reply */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 130.0,
                                                                height: 40.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                if (stackPostsRecord.hasReply ??
                                                    true)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.36, 14.18),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'SINGLE_VIDEO_Container_zrh1nu1r_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Container_bottom_sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      1.0,
                                                                  child:
                                                                      ReplyVideoWidget(
                                                                    video2: singleVideoPagePostsRecord
                                                                        .replyVideo,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: Container(
                                                          width: 54.0,
                                                          height: 96.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(60.0),
                                              ),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                buttonSize: 34.0,
                                                fillColor: Color(0xFF2D2D2D),
                                                icon: Icon(
                                                  Icons.close_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'SINGLE_VIDEO_close_rounded_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_navigate_back');
                                                  context.pop();
                                                },
                                              ),
                                            ),
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryDark,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(60.0),
                                              ),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                buttonSize: 34.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                icon: Icon(
                                                  Icons.flag_rounded,
                                                  color: Color(0xFFA4A4A4),
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'SINGLE_VIDEO_flag_rounded_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: FlagVideoWidget(
                                                          post:
                                                              singleVideoPagePostsRecord,
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                              ),
                                            ),
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(60.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 2.0, 2.0, 2.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'SINGLE_VIDEO_LottieAnimation_pnu5tcsi_ON');
                                                    logFirebaseEvent(
                                                        'LottieAnimation_navigate_to');

                                                    context.pushNamed(
                                                      'restDealPage',
                                                      queryParams: {
                                                        'restaurant':
                                                            serializeParam(
                                                          userInfoRestaurantsRecord,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'restaurant':
                                                            userInfoRestaurantsRecord,
                                                      },
                                                    );
                                                  },
                                                  child: Lottie.asset(
                                                    'assets/lottie_animations/deal_tag.json',
                                                    width: 31.0,
                                                    height: 31.0,
                                                    fit: BoxFit.cover,
                                                    reverse: true,
                                                    animate: true,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(60.0),
                                              ),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                buttonSize: 34.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                icon: FaIcon(
                                                  FontAwesomeIcons.mapMarkerAlt,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'SINGLE_VIDEO_mapMarkerAlt_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_navigate_to');

                                                  context
                                                      .pushNamed('videoFind');
                                                },
                                              ),
                                            ),
                                            StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  currentUserReference!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 30.0,
                                                      height: 30.0,
                                                      child: SpinKitThreeBounce(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final containerUsersRecord =
                                                    snapshot.data!;
                                                return Container(
                                                  width: 33.0,
                                                  height: 33.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: ToggleIcon(
                                                    onPressed: () async {
                                                      final savedPostsElement =
                                                          singleVideoPagePostsRecord
                                                              .reference;
                                                      final savedPostsUpdate =
                                                          containerUsersRecord
                                                                  .savedPosts!
                                                                  .toList()
                                                                  .contains(
                                                                      savedPostsElement)
                                                              ? FieldValue
                                                                  .arrayRemove([
                                                                  savedPostsElement
                                                                ])
                                                              : FieldValue
                                                                  .arrayUnion([
                                                                  savedPostsElement
                                                                ]);
                                                      final usersUpdateData = {
                                                        'savedPosts':
                                                            savedPostsUpdate,
                                                      };
                                                      await containerUsersRecord
                                                          .reference
                                                          .update(
                                                              usersUpdateData);
                                                    },
                                                    value: containerUsersRecord
                                                        .savedPosts!
                                                        .toList()
                                                        .contains(
                                                            singleVideoPagePostsRecord
                                                                .reference),
                                                    onIcon: FaIcon(
                                                      FontAwesomeIcons
                                                          .solidBookmark,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      size: 16.0,
                                                    ),
                                                    offIcon: FaIcon(
                                                      FontAwesomeIcons.bookmark,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      size: 16.0,
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
                                FlutterFlowTheme.of(context).primaryDark
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StreamBuilder<PostsRecord>(
                                stream: PostsRecord.getDocument(
                                    singleVideoPagePostsRecord.reference),
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
                                  final rowPostsRecord = snapshot.data!;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 10.0),
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              () {
                                                if (rowPostsRecord.userRating ==
                                                    5.0) {
                                                  return Color(0xFF3FDF86);
                                                } else if (rowPostsRecord
                                                        .userRating ==
                                                    4.0) {
                                                  return Color(0xFFC3DF3F);
                                                } else if (rowPostsRecord
                                                        .userRating ==
                                                    3.0) {
                                                  return Color(0xFFDFCB3F);
                                                } else if (rowPostsRecord
                                                        .userRating ==
                                                    2.0) {
                                                  return Color(0xFFDF993F);
                                                } else if (rowPostsRecord
                                                        .userRating ==
                                                    1.0) {
                                                  return Color(0xFFDF5A3F);
                                                } else {
                                                  return Color(0x00000000);
                                                }
                                              }(),
                                              Color(0x8E95A1AC),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                singleVideoPagePostsRecord
                                                    .userRating,
                                                formatType: FormatType.custom,
                                                format: '0',
                                                locale: '',
                                              ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.bold,
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
                                    UsersRecord.getDocument(widget.post!.user!),
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
                                  final rowUsersRecord = snapshot.data!;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 10.0),
                                        child: Text(
                                          rowUsersRecord.username!,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: Color(0x00EEEEEE),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SINGLE_VIDEO_Text_xpwz0h1a_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: DescriptionSheetWidget(
                                                    postsDescription:
                                                        widget.post,
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: Text(
                                            widget.post!.description!
                                                .maybeHandleOverflow(
                                              maxChars: 170,
                                              replacement: '…',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 20.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                widget.post!.user!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    child: SpinKitThreeBounce(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final stackUsersRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'SINGLE_VIDEO_Stack_yhf35iwu_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Stack_navigate_to');

                                                  context.pushNamed(
                                                    'viewProfileOther',
                                                    queryParams: {
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
                                                          0.0, 0.0),
                                                  children: [
                                                    Container(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEEEEEE),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Container(
                                                        width: 120.0,
                                                        height: 120.0,
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
                                                              valueOrDefault<
                                                                  String>(
                                                            stackUsersRecord
                                                                .photoUrl,
                                                            'https://wpcdn.us-east-1.vip.tn-cloud.net/www.hawaiimagazine.com/content/uploads/2020/12/pineapple-opener.jpg',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  30.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 15.0,
                                                        height: 15.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          Icons.add_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                          size: 10.0,
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
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 20.0, 0.0),
                                              child: StreamBuilder<
                                                  RestaurantsRecord>(
                                                stream: RestaurantsRecord
                                                    .getDocument(
                                                        singleVideoPagePostsRecord
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
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'SINGLE_VIDEO_commentSection_ON_TAP');
                                                          logFirebaseEvent(
                                                              'commentSection_bottom_sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: 600.0,
                                                                  child:
                                                                      CommentsWidget(
                                                                    post:
                                                                        singleVideoPagePostsRecord,
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
                                                            InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'SINGLE_VIDEO_Icon_0xbeogvt_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon_play_sound');
                                                                _model.soundPlayer1 ??=
                                                                    AudioPlayer();
                                                                if (_model
                                                                    .soundPlayer1!
                                                                    .playing) {
                                                                  await _model
                                                                      .soundPlayer1!
                                                                      .stop();
                                                                }

                                                                _model
                                                                    .soundPlayer1!
                                                                    .setAsset(
                                                                        'assets/audios/Female_Saying_Yummy_2_1.mp3')
                                                                    .then((_) => _model
                                                                        .soundPlayer1!
                                                                        .play());

                                                                logFirebaseEvent(
                                                                    'Icon_bottom_sheet');
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryDark,
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
                                                                            470.0,
                                                                        child:
                                                                            AddMenuCartWidget(
                                                                          post:
                                                                              singleVideoPagePostsRecord,
                                                                          restaurant:
                                                                              columnRestaurantsRecord,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .fastfood_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          singleVideoPagePostsRecord
                                                              .menuItems!
                                                              .toList()
                                                              .length
                                                              .toString(),
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
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
                                                      0.0, 0.0, 20.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SINGLE_VIDEO_commentSection_ON_TAP');
                                                      logFirebaseEvent(
                                                          'commentSection_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child: Container(
                                                              height: 600.0,
                                                              child:
                                                                  CommentsWidget(
                                                                post:
                                                                    widget.post,
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
                                                        InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'SINGLE_VIDEO_Icon_v463gx3o_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Icon_bottom_sheet');
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
                                                                      CommentsCopyWidget(
                                                                    post: widget
                                                                        .post,
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .mode_comment_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiaryColor,
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      singleVideoPagePostsRecord
                                                          .numComments
                                                          ?.toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  singleVideoPagePostsRecord
                                                      .user!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 30.0,
                                                      height: 30.0,
                                                      child: SpinKitThreeBounce(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final columnUsersRecord =
                                                    snapshot.data!;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        if (widget.post!.likes!
                                                            .toList()
                                                            .contains(
                                                                currentUserReference))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.25),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'SINGLE_VIDEO_Icon_5wyt9od5_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon_backend_call');

                                                                final postsUpdateData =
                                                                    {
                                                                  'likes':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    currentUserReference
                                                                  ]),
                                                                };
                                                                await widget
                                                                    .post!
                                                                    .reference
                                                                    .update(
                                                                        postsUpdateData);
                                                                logFirebaseEvent(
                                                                    'Icon_play_sound');
                                                                _model.soundPlayer2 ??=
                                                                    AudioPlayer();
                                                                if (_model
                                                                    .soundPlayer2!
                                                                    .playing) {
                                                                  await _model
                                                                      .soundPlayer2!
                                                                      .stop();
                                                                }

                                                                _model
                                                                    .soundPlayer2!
                                                                    .setAsset(
                                                                        'assets/audios/Transform_Sizzle_Swoosh_04.wav')
                                                                    .then((_) => _model
                                                                        .soundPlayer2!
                                                                        .play());

                                                                logFirebaseEvent(
                                                                    'Icon_widget_animation');
                                                                if (animationsMap[
                                                                        'iconOnActionTriggerAnimation'] !=
                                                                    null) {
                                                                  setState(() =>
                                                                      hasIconTriggered =
                                                                          true);
                                                                  SchedulerBinding
                                                                      .instance
                                                                      .addPostFrameCallback((_) async => await animationsMap[
                                                                              'iconOnActionTriggerAnimation']!
                                                                          .controller
                                                                          .forward(
                                                                              from: 0.0));
                                                                }
                                                                logFirebaseEvent(
                                                                    'Icon_backend_call');

                                                                final usersUpdateData =
                                                                    {
                                                                  'fizzzCoin':
                                                                      FieldValue
                                                                          .increment(
                                                                              2),
                                                                  'fizzzMonthly':
                                                                      FieldValue
                                                                          .increment(
                                                                              2),
                                                                };
                                                                await currentUserReference!
                                                                    .update(
                                                                        usersUpdateData);
                                                              },
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .fire,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                                size: 26.0,
                                                              ),
                                                            ),
                                                          ),
                                                        if (widget.post!.likes!
                                                            .toList()
                                                            .contains(
                                                                currentUserReference))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.25),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'SINGLE_VIDEO_Icon_bq4eq2jn_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon_backend_call');

                                                                final postsUpdateData =
                                                                    {
                                                                  'likes':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    currentUserReference
                                                                  ]),
                                                                };
                                                                await widget
                                                                    .post!
                                                                    .reference
                                                                    .update(
                                                                        postsUpdateData);
                                                                logFirebaseEvent(
                                                                    'Icon_backend_call');

                                                                final usersUpdateData =
                                                                    {
                                                                  'fizzzCoin':
                                                                      FieldValue
                                                                          .increment(
                                                                              -2),
                                                                  'fizzzMonthly':
                                                                      FieldValue
                                                                          .increment(
                                                                              -2),
                                                                };
                                                                await currentUserReference!
                                                                    .update(
                                                                        usersUpdateData);
                                                              },
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .fire,
                                                                color: Color(
                                                                    0xFFB94600),
                                                                size: 26.0,
                                                              ),
                                                            ).animateOnActionTrigger(
                                                                animationsMap[
                                                                    'iconOnActionTriggerAnimation']!,
                                                                hasBeenTriggered:
                                                                    hasIconTriggered),
                                                          ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions
                                                                .likes(
                                                                    widget.post)
                                                                .toString(),
                                                            '0',
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
                  ],
                ),
              ),
            ));
      },
    );
  }
}
