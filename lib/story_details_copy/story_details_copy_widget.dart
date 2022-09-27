import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/comments_widget.dart';
import '../components/deal_popup_widget.dart';
import '../components/flag_story_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StoryDetailsCopyWidget extends StatefulWidget {
  const StoryDetailsCopyWidget({
    Key? key,
    this.initialStoryIndex,
    this.restaurant,
    this.user,
    this.stories,
  }) : super(key: key);

  final int? initialStoryIndex;
  final RestaurantsRecord? restaurant;
  final UsersRecord? user;
  final StoriesRecord? stories;

  @override
  _StoryDetailsCopyWidgetState createState() => _StoryDetailsCopyWidgetState();
}

class _StoryDetailsCopyWidgetState extends State<StoryDetailsCopyWidget> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'storyDetailsCopy'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryDark,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: StreamBuilder<List<StoriesRecord>>(
                stream: queryStoriesRecord(
                  queryBuilder: (storiesRecord) => storiesRecord
                      .where('rest_ref',
                          isEqualTo: widget.restaurant!.reference)
                      .where('isFlagged', isEqualTo: false)
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
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 30,
                        ),
                      ),
                    );
                  }
                  List<StoriesRecord> pageViewStoriesRecordList =
                      snapshot.data!;
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: pageViewController ??= PageController(
                              initialPage: min(widget.initialStoryIndex!,
                                  pageViewStoriesRecordList.length - 1)),
                          scrollDirection: Axis.vertical,
                          itemCount: pageViewStoriesRecordList.length,
                          itemBuilder: (context, pageViewIndex) {
                            final pageViewStoriesRecord =
                                pageViewStoriesRecordList[pageViewIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1,
                                        decoration: BoxDecoration(),
                                        child: FlutterFlowVideoPlayer(
                                          path: pageViewStoriesRecord.videoUrl!,
                                          videoType: VideoType.network,
                                          autoPlay: true,
                                          looping: true,
                                          showControls: false,
                                          allowFullScreen: false,
                                          allowPlaybackSpeedMenu: false,
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 122,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    FlutterFlowTheme.of(context)
                                                        .primaryDark,
                                                    Color(0x001A1F24)
                                                  ],
                                                  stops: [0, 1],
                                                  begin: AlignmentDirectional(
                                                      0, -1),
                                                  end: AlignmentDirectional(
                                                      0, 1),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 12, 16, 0),
                                                    child: StreamBuilder<
                                                        RestaurantsRecord>(
                                                      stream: RestaurantsRecord
                                                          .getDocument(
                                                              pageViewStoriesRecord
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
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'STORY_DETAILS_COPY_CircleImage_3j7i5k25_');
                                                                logFirebaseEvent(
                                                                    'CircleImage_Navigate-To');

                                                                context
                                                                    .pushNamed(
                                                                  'restaurantDetails',
                                                                  queryParams: {
                                                                    'restaurant': serializeParam(
                                                                        userInfoRestaurantsRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Container(
                                                                width: 40,
                                                                height: 40,
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
                                                            Expanded(
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
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      userInfoRestaurantsRecord
                                                                          .restaurantName!,
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
                                                                          .restAddress!,
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
                                                                ],
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
                                                                      'STORY_DETAILS_COPY_flag_rounded_ICN_ON_T');
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
                                                                            FlagStoryWidget(
                                                                          flagStory:
                                                                              pageViewStoriesRecord,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));

                                                                  logFirebaseEvent(
                                                                      'IconButton_Alert-Dialog');
                                                                  var confirmDialogResponse =
                                                                      await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Confirm'),
                                                                                content: Text('Are you sure you want to flag this video?'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Confirm'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                  if (confirmDialogResponse) {
                                                                    logFirebaseEvent(
                                                                        'IconButton_Navigate-Back');
                                                                    context
                                                                        .pop();
                                                                  }
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
                                                                borderColor: Color(
                                                                    0xFF2D2D2D),
                                                                borderRadius:
                                                                    30,
                                                                buttonSize: 34,
                                                                fillColor: Color(
                                                                    0xFF2D2D2D),
                                                                icon: Icon(
                                                                  Icons
                                                                      .close_rounded,
                                                                  color: Color(
                                                                      0xFFA4A4A4),
                                                                  size: 20,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'STORY_DETAILS_COPY_close_rounded_ICN_ON_');
                                                                  logFirebaseEvent(
                                                                      'IconButton_Navigate-Back');
                                                                  context.pop();
                                                                },
                                                              ),
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
                                                                      .primaryColor,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            60),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            2,
                                                                            2,
                                                                            2),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'STORY_DETAILS_COPY_LottieAnimation_fz4d6');
                                                                        logFirebaseEvent(
                                                                            'LottieAnimation_Navigate-To');

                                                                        context
                                                                            .pushNamed(
                                                                          'restDealPage',
                                                                          queryParams:
                                                                              {
                                                                            'restaurant':
                                                                                serializeParam(userInfoRestaurantsRecord, ParamType.Document),
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
                                                                            31,
                                                                        height:
                                                                            31,
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
                                                              ],
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  if (pageViewStoriesRecord
                                                          .hasDeal ??
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 10,
                                                                  16, 0),
                                                      child: StreamBuilder<
                                                          DealsRecord>(
                                                        stream: DealsRecord
                                                            .getDocument(
                                                                pageViewStoriesRecord
                                                                    .dealRef!),
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
                                                          final userInfoDealsRecord =
                                                              snapshot.data!;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              if (!(currentUserDocument
                                                                          ?.usedDeals
                                                                          ?.toList() ??
                                                                      [])
                                                                  .contains(
                                                                      userInfoDealsRecord
                                                                          .reference))
                                                                AuthUserStreamWidget(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Stack(
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('STORY_DETAILS_COPY_Container_jzaoowkc_ON');
                                                                              logFirebaseEvent('Container_Bottom-Sheet');
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: Container(
                                                                                      height: 800,
                                                                                      child: DealPopupWidget(
                                                                                        deal: userInfoDealsRecord,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            },
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 4,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(99),
                                                                              ),
                                                                              child: Container(
                                                                                width: 160,
                                                                                height: 44,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFEEEEEE),
                                                                                  borderRadius: BorderRadius.circular(99),
                                                                                ),
                                                                                alignment: AlignmentDirectional(1, 0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                                                  child: Container(
                                                                                    width: 90,
                                                                                    height: 100,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFEEEEEE),
                                                                                      borderRadius: BorderRadius.circular(99),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4, 2, 0, 0),
                                                                                      child: Text(
                                                                                        userInfoDealsRecord.details!.maybeHandleOverflow(
                                                                                          maxChars: 33,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Lexend Deca',
                                                                                              fontSize: 12,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              lineHeight: 1,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Card(
                                                                            clipBehavior:
                                                                                Clip.antiAliasWithSaveLayer,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(60),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                                                              child: Text(
                                                                                userInfoDealsRecord.title!.maybeHandleOverflow(maxChars: 4),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontWeight: FontWeight.w800,
                                                                                    ),
                                                                              ),
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
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0x001A1F24),
                                                    FlutterFlowTheme.of(context)
                                                        .primaryDark
                                                  ],
                                                  stops: [0, 1],
                                                  begin: AlignmentDirectional(
                                                      0, -1),
                                                  end: AlignmentDirectional(
                                                      0, 1),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 16, 16, 16),
                                                    child: Text(
                                                      pageViewStoriesRecord
                                                          .comment!
                                                          .maybeHandleOverflow(
                                                              maxChars: 200),
                                                      textAlign:
                                                          TextAlign.start,
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
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 0, 0, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'STORY_DETAILS_COPY_LEARN_MORE_BTN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Button_Launch-U-R-L');
                                                        await launchURL(
                                                            pageViewStoriesRecord
                                                                .linkLearnMore!);
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'kxhglt0j' /* Learn More */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 130,
                                                        height: 40,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'STORY_DETAILS_COPY_commentSection_ON_TAP');
                                          logFirebaseEvent(
                                              'commentSection_Bottom-Sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: 600,
                                                  child: CommentsWidget(
                                                    story:
                                                        pageViewStoriesRecord,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.mode_comment_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 24,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 0),
                                              child: Text(
                                                pageViewStoriesRecord
                                                    .numComments!
                                                    .toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                    ),
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
                        Align(
                          alignment: AlignmentDirectional(0.95, 0.7),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: SmoothPageIndicator(
                              controller: pageViewController ??= PageController(
                                  initialPage: min(widget.initialStoryIndex!,
                                      pageViewStoriesRecordList.length - 1)),
                              count: pageViewStoriesRecordList.length,
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
                                dotColor: Color(0x65DBE2E7),
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
