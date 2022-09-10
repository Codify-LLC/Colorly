import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/add_menu_cart_widget.dart';
import '../components/comments_copy_widget.dart';
import '../components/comments_widget.dart';
import '../components/description_sheet_widget.dart';
import '../components/flag_video_widget.dart';
import '../components/reply_video_widget.dart';
import '../components/video_player_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

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
  AudioPlayer? soundPlayer;
  ReplyVideosRecord? replyVideo;
  String uploadedFileUrl = '';
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
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_homePage_ON_PAGE_LOAD');
      logFirebaseEvent('homePage_Custom-Action');
      await actions.lockOrientation();
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'homePage'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<List<PostsRecord>>(
                  stream: queryPostsRecord(
                    queryBuilder: (postsRecord) => postsRecord
                        .where('isFlagged', isEqualTo: false)
                        .orderBy('created_at', descending: true),
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
                    if (pageViewPostsRecordList.isEmpty) {
                      return Center(
                        child: Image.asset(
                          'assets/images/no_video_reviews.png',
                        ),
                      );
                    }
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        controller: pageViewController ??= PageController(
                            initialPage:
                                min(0, pageViewPostsRecordList.length - 1)),
                        scrollDirection: Axis.vertical,
                        itemCount: pageViewPostsRecordList.length,
                        itemBuilder: (context, pageViewIndex) {
                          final pageViewPostsRecord =
                              pageViewPostsRecordList[pageViewIndex];
                          return Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryDark,
                                ),
                                child: VideoPlayerWidget(
                                  url: pageViewPostsRecord.videoUrl,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 250,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primaryDark,
                                            Color(0x001A1F24)
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(0, -1),
                                          end: AlignmentDirectional(0, 1),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: Color(0x45EEEEEE),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 16, 0),
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
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      10, 0, 0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'HOME_CircleImage_inz8fq0g_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'CircleImage_Navigate-To');

                                                              context.pushNamed(
                                                                'restaurantDetails',
                                                                queryParams: {
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
                                                                        .increment(
                                                                            1),
                                                              };
                                                              await userInfoRestaurantsRecord
                                                                  .reference
                                                                  .update(
                                                                      restaurantsUpdateData);
                                                            },
                                                            child: Container(
                                                              width: 50,
                                                              height: 50,
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
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_Column_hl76wrm2_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Column_Navigate-To');

                                                              context.pushNamed(
                                                                'restaurantDetails',
                                                                queryParams: {
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
                                                                        .increment(
                                                                            1),
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        userInfoRestaurantsRecord
                                                                            .restaurantName!
                                                                            .maybeHandleOverflow(maxChars: 25),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                            ),
                                                                      ),
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
                                                                        '${functions.getDistance(currentUserLocationValue, userInfoRestaurantsRecord.restLatLong)} mi.',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
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
                                                                  child: Text(
                                                                    userInfoRestaurantsRecord
                                                                        .restAddress!
                                                                        .maybeHandleOverflow(
                                                                            maxChars:
                                                                                40),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiaryColor,
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          userInfoRestaurantsRecord
                                                                              .priceRange,
                                                                          '\$\$',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: Color(0xFF32FF48),
                                                                              fontSize: 12,
                                                                            ),
                                                                      ),
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
                                                                            .categories!
                                                                            .maybeHandleOverflow(maxChars: 35),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        '${valueOrDefault<String>(
                                                                          userInfoRestaurantsRecord
                                                                              .reviews
                                                                              ?.toString(),
                                                                          '0',
                                                                        )} reviews',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 5, 0),
                                            child: StreamBuilder<
                                                RestaurantsRecord>(
                                              stream:
                                                  RestaurantsRecord.getDocument(
                                                      pageViewPostsRecord
                                                          .restRef!),
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
                                                final userInfoRestaurantsRecord =
                                                    snapshot.data!;
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    StreamBuilder<PostsRecord>(
                                                      stream: PostsRecord
                                                          .getDocument(
                                                              pageViewPostsRecord
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 30,
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (pageViewPostsRecord
                                                                        .hasReply ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'HOME_VideoPlayer_knvnikdw_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'VideoPlayer_Bottom-Sheet');
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
                                                                                height: MediaQuery.of(context).size.height * 1,
                                                                                child: ReplyVideoWidget(),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          FlutterFlowVideoPlayer(
                                                                        path: pageViewPostsRecord
                                                                            .videoReplyURL!,
                                                                        videoType:
                                                                            VideoType.network,
                                                                        width:
                                                                            54,
                                                                        height:
                                                                            96,
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
                                                            if (!pageViewPostsRecord
                                                                .hasReply!)
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
                                                                            10,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('HOME_PAGE_PAGE_REPLY_BTN_ON_TAP');
                                                                            var _shouldSetState =
                                                                                false;
                                                                            logFirebaseEvent('Button_Upload-Photo-Video');
                                                                            final selectedMedia =
                                                                                await selectMediaWithSourceBottomSheet(
                                                                              context: context,
                                                                              allowPhoto: false,
                                                                              allowVideo: true,
                                                                            );
                                                                            if (selectedMedia != null &&
                                                                                selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                              showUploadMessage(
                                                                                context,
                                                                                'Uploading file...',
                                                                                showLoading: true,
                                                                              );
                                                                              final downloadUrls = (await Future.wait(selectedMedia.map((m) async => await uploadData(m.storagePath, m.bytes)))).where((u) => u != null).map((u) => u!).toList();
                                                                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                              if (downloadUrls.length == selectedMedia.length) {
                                                                                setState(() => uploadedFileUrl = downloadUrls.first);
                                                                                showUploadMessage(
                                                                                  context,
                                                                                  'Success!',
                                                                                );
                                                                              } else {
                                                                                showUploadMessage(
                                                                                  context,
                                                                                  'Failed to upload media',
                                                                                );
                                                                                return;
                                                                              }
                                                                            }

                                                                            if (uploadedFileUrl != null &&
                                                                                uploadedFileUrl != '') {
                                                                              logFirebaseEvent('Button_Backend-Call');

                                                                              final replyVideosCreateData = createReplyVideosRecordData(
                                                                                user: currentUserReference,
                                                                                post: pageViewPostsRecord.reference,
                                                                                video: uploadedFileUrl,
                                                                              );
                                                                              var replyVideosRecordReference = ReplyVideosRecord.collection.doc();
                                                                              await replyVideosRecordReference.set(replyVideosCreateData);
                                                                              replyVideo = ReplyVideosRecord.getDocumentFromData(replyVideosCreateData, replyVideosRecordReference);
                                                                              _shouldSetState = true;
                                                                              logFirebaseEvent('Button_Backend-Call');

                                                                              final postsUpdateData = createPostsRecordData(
                                                                                replyVideo: replyVideo!.reference,
                                                                                hasReply: true,
                                                                                videoReplyURL: uploadedFileUrl,
                                                                              );
                                                                              await pageViewPostsRecord.reference.update(postsUpdateData);
                                                                            } else {
                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '1n2x30vk' /* Reply */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                130,
                                                                            height:
                                                                                40,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: Colors.white,
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            if (stackPostsRecord
                                                                    .hasReply ??
                                                                true)
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.36,
                                                                        14.18),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          5,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_PAGE_PAGE_Container_f1q0swy1_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Container_Bottom-Sheet');
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
                                                                            padding:
                                                                                MediaQuery.of(context).viewInsets,
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.of(context).size.height * 1,
                                                                              child: ReplyVideoWidget(
                                                                                video2: pageViewPostsRecord.replyVideo,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 54,
                                                                      height:
                                                                          96,
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
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
                                                            borderRadius: 30,
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
                                                                  'HOME_PAGE_PAGE_flag_rounded_ICN_ON_TAP');
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
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
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
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                buttonSize: 34,
                                                                fillColor: Color(
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
                                                                      'HOME_PAGE_PAGE_theaters_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_Backend-Call');

                                                                  final usersUpdateData =
                                                                      {
                                                                    'savedPosts':
                                                                        FieldValue
                                                                            .arrayUnion([
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                      size: 18,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_PAGE_PAGE_theaters_ICN_ON_TAP');
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
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'HOME_LottieAnimation_ya1znwdh_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'LottieAnimation_Navigate-To');

                                                                context
                                                                    .pushNamed(
                                                                  'restDealPage',
                                                                  queryParams: {
                                                                    'restaurant': serializeParam(
                                                                        userInfoRestaurantsRecord,
                                                                        ParamType
                                                                            .Document),
                                                                  }.withoutNulls,
                                                                  extra: <
                                                                      String,
                                                                      dynamic>{
                                                                    'restaurant':
                                                                        userInfoRestaurantsRecord,
                                                                  },
                                                                );
                                                              },
                                                              child:
                                                                  Lottie.asset(
                                                                'assets/lottie_animations/deal_tag.json',
                                                                width: 31,
                                                                height: 31,
                                                                fit: BoxFit
                                                                    .cover,
                                                                reverse: true,
                                                                animate: true,
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
                                                            borderRadius: 30,
                                                            buttonSize: 34,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .mapMarkerAlt,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                              size: 20,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'HOME_PAGE_PAGE_mapMarkerAlt_ICN_ON_TAP');
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
                                          begin: AlignmentDirectional(0, -1),
                                          end: AlignmentDirectional(0, 1),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 10),
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    formatNumber(
                                                      pageViewPostsRecord
                                                          .userRating!,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '0',
                                                      locale: '',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                              final rowUsersRecord =
                                                  snapshot.data!;
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 10),
                                                    child: Text(
                                                      rowUsersRecord.username!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                            decoration: BoxDecoration(
                                              color: Color(0x00EEEEEE),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'HOME_PAGE_PAGE_Text_5i9yvke0_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Text_Bottom-Sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 12, 16, 8),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 20, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
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
                                                                  final containerUsersRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Container(
                                                                    width: 40,
                                                                    height: 40,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFEEEEEE),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'HOME_CircleImage_lrd1mzw5_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'CircleImage_Navigate-To');

                                                                        context
                                                                            .pushNamed(
                                                                          'viewProfileOther',
                                                                          queryParams:
                                                                              {
                                                                            'otherUser':
                                                                                serializeParam(containerUsersRecord.reference, ParamType.DocumentReference),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
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
                                                                            containerUsersRecord.photoUrl,
                                                                            'https://p1.pxfuel.com/preview/828/149/229/indistinct-blurred-pineapple-rough.jpg',
                                                                          ),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            40,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 15,
                                                                  height: 15,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Icon(
                                                                    Icons
                                                                        .add_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    size: 10,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  50, 0, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        20,
                                                                        0),
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
                                                                    child:
                                                                        SizedBox(
                                                                      width: 30,
                                                                      height:
                                                                          30,
                                                                      child:
                                                                          SpinKitThreeBounce(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            30,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final columnRestaurantsRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return Column(
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
                                                                            'HOME_PAGE_PAGE_commentSection_ON_TAP');
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
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_PAGE_Icon_ke38ktju_ON_TAP');
                                                                              logFirebaseEvent('Icon_Play-Sound');
                                                                              soundPlayer ??= AudioPlayer();
                                                                              if (soundPlayer!.playing) {
                                                                                await soundPlayer!.stop();
                                                                              }

                                                                              soundPlayer!.setAsset('assets/audios/Female_Saying_Yummy_2_1.mp3').then((_) => soundPlayer!.play());

                                                                              logFirebaseEvent('Icon_Bottom-Sheet');
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: FlutterFlowTheme.of(context).primaryDark,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: Container(
                                                                                      height: 470,
                                                                                      child: AddMenuCartWidget(
                                                                                        post: pageViewPostsRecord,
                                                                                        restaurant: columnRestaurantsRecord,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.fastfood_rounded,
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
                                                                        pageViewPostsRecord
                                                                            .menuItems!
                                                                            .toList()
                                                                            .length
                                                                            .toString(),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
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
                                                                        'HOME_PAGE_PAGE_commentSection_ON_TAP');
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
                                                                          padding:
                                                                              MediaQuery.of(context).viewInsets,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                600,
                                                                            child:
                                                                                CommentsWidget(
                                                                              post: pageViewPostsRecord,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'HOME_PAGE_PAGE_Icon_byirxp84_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Icon_Bottom-Sheet');
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
                                                                                  height: 525,
                                                                                  child: CommentsCopyWidget(
                                                                                    post: pageViewPostsRecord,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .mode_comment_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiaryColor,
                                                                          size:
                                                                              30,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Text(
                                                                  pageViewPostsRecord
                                                                      .numComments!
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
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
                                                                      if (!pageViewPostsRecord
                                                                          .likes!
                                                                          .toList()
                                                                          .contains(
                                                                              currentUserReference))
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0.25),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_PAGE_Icon_q0caoiro_ON_TAP');
                                                                              logFirebaseEvent('Icon_Haptic-Feedback');
                                                                              HapticFeedback.selectionClick();
                                                                              logFirebaseEvent('Icon_Backend-Call');

                                                                              final postsUpdateData = {
                                                                                'likes': FieldValue.arrayUnion([
                                                                                  currentUserReference
                                                                                ]),
                                                                              };
                                                                              await pageViewPostsRecord.reference.update(postsUpdateData);
                                                                              logFirebaseEvent('Icon_Widget-Animation');
                                                                              if (animationsMap['iconOnActionTriggerAnimation'] == null) {
                                                                                return;
                                                                              }
                                                                              await (animationsMap['iconOnActionTriggerAnimation']!.curvedAnimation.parent as AnimationController).forward(from: 0.0);

                                                                              logFirebaseEvent('Icon_Trigger-Push-Notification');
                                                                              triggerPushNotification(
                                                                                notificationTitle: 'You got Flavor! 🔥',
                                                                                notificationText: '${valueOrDefault<String>(
                                                                                  currentUserDisplayName,
                                                                                  'A Colorly foodie',
                                                                                )} gave you flavor',
                                                                                notificationImageUrl: currentUserPhoto,
                                                                                notificationSound: 'default',
                                                                                userRefs: [
                                                                                  pageViewPostsRecord.user!
                                                                                ],
                                                                                initialPageName: 'userProfile',
                                                                                parameterData: {},
                                                                              );
                                                                              logFirebaseEvent('Icon_Backend-Call');

                                                                              final usersUpdateData = {
                                                                                'fizzzCoin': FieldValue.increment(2),
                                                                                'fizzzMonthly': FieldValue.increment(2),
                                                                              };
                                                                              await currentUserReference!.update(usersUpdateData);
                                                                            },
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.fire,
                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                              size: 26,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (pageViewPostsRecord
                                                                          .likes!
                                                                          .toList()
                                                                          .contains(
                                                                              currentUserReference))
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0.25),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('HOME_PAGE_PAGE_Icon_8i3ek2lc_ON_TAP');
                                                                              logFirebaseEvent('Icon_Backend-Call');

                                                                              final postsUpdateData = {
                                                                                'likes': FieldValue.arrayRemove([
                                                                                  currentUserReference
                                                                                ]),
                                                                              };
                                                                              await pageViewPostsRecord.reference.update(postsUpdateData);
                                                                              logFirebaseEvent('Icon_Backend-Call');

                                                                              final usersUpdateData = {
                                                                                'fizzzCoin': FieldValue.increment(-2),
                                                                                'fizzzMonthly': FieldValue.increment(-2),
                                                                              };
                                                                              await currentUserReference!.update(usersUpdateData);
                                                                            },
                                                                            child:
                                                                                FaIcon(
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
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        functions
                                                                            .likes(pageViewPostsRecord)
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
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
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
    );
  }
}
