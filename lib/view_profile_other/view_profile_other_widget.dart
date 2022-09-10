import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewProfileOtherWidget extends StatefulWidget {
  const ViewProfileOtherWidget({
    Key? key,
    this.otherUser,
    this.user,
    this.friends,
  }) : super(key: key);

  final DocumentReference? otherUser;
  final UsersRecord? user;
  final FriendsRecord? friends;

  @override
  _ViewProfileOtherWidgetState createState() => _ViewProfileOtherWidgetState();
}

class _ViewProfileOtherWidgetState extends State<ViewProfileOtherWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      curve: Curves.elasticOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 300,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        scale: 0.8,
        opacity: 0,
      ),
      finalState: AnimationState(
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      curve: Curves.elasticOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 300,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        scale: 0.8,
        opacity: 0,
      ),
      finalState: AnimationState(
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'viewProfileOther'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.otherUser!),
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
        final viewProfileOtherUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryDark,
            automaticallyImplyLeading: true,
            title: Text(
              viewProfileOtherUsersRecord.username!,
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    fontSize: 20,
                  ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.person_add_disabled_rounded,
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                  size: 30,
                ),
                onPressed: () async {
                  logFirebaseEvent('VIEW_PROFILE_OTHER_person_add_disabled_r');
                  logFirebaseEvent('IconButton_Backend-Call');

                  final usersUpdateData = {
                    'blockedUsers': FieldValue.arrayUnion(
                        [viewProfileOtherUsersRecord.reference]),
                  };
                  await currentUserReference!.update(usersUpdateData);
                  logFirebaseEvent('IconButton_Widget-Animation');
                  if (animationsMap['containerOnActionTriggerAnimation2'] ==
                      null) {
                    return;
                  }
                  await (animationsMap['containerOnActionTriggerAnimation2']!
                          .curvedAnimation
                          .parent as AnimationController)
                      .forward(from: 0.0);

                  logFirebaseEvent('IconButton_Navigate-Back');
                  context.pop();
                },
              ),
            ],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryDark,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(99),
                                      child: CachedNetworkImage(
                                        imageUrl: valueOrDefault<String>(
                                          viewProfileOtherUsersRecord.photoUrl,
                                          'https://p1.pxfuel.com/preview/828/149/229/indistinct-blurred-pineapple-rough.jpg',
                                        ),
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          StreamBuilder<List<StreamsRecord>>(
                            stream: queryStreamsRecord(
                              queryBuilder: (streamsRecord) => streamsRecord
                                  .where('uid',
                                      isEqualTo:
                                          viewProfileOtherUsersRecord.uid)
                                  .orderBy('timestamp', descending: true),
                              singleRecord: true,
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
                              List<StreamsRecord> columnStreamsRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the document does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final columnStreamsRecord =
                                  columnStreamsRecordList.isNotEmpty
                                      ? columnStreamsRecordList.first
                                      : null;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (columnStreamsRecord!.isLive ?? true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 10),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'VIEW_PROFILE_OTHER_Container_dv63ar6z_ON');
                                          logFirebaseEvent(
                                              'Container_Navigate-To');

                                          context.pushNamed(
                                            'LiveVideoPage',
                                            queryParams: {
                                              'stream': serializeParam(
                                                  columnStreamsRecord,
                                                  ParamType.Document),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'stream': columnStreamsRecord,
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 65,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: FlutterFlowVideoPlayer(
                                            path: columnStreamsRecord!
                                                .playbackUrl!,
                                            videoType: VideoType.network,
                                            autoPlay: true,
                                            looping: false,
                                            showControls: false,
                                            allowFullScreen: false,
                                            allowPlaybackSpeedMenu: false,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                                child: Text(
                                  viewProfileOtherUsersRecord.displayName!,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(60, 5, 60, 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (viewProfileOtherUsersRecord.hasFacebook ??
                                    true)
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    buttonSize: 48,
                                    icon: FaIcon(
                                      FontAwesomeIcons.facebookSquare,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'VIEW_PROFILE_OTHER_facebookSquare_ICN_ON');
                                      logFirebaseEvent(
                                          'IconButton_Launch-U-R-L');
                                      await launchURL(
                                          viewProfileOtherUsersRecord
                                              .facebookUrl!);
                                    },
                                  ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (viewProfileOtherUsersRecord.hasInstagram ??
                                    true)
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    buttonSize: 48,
                                    icon: FaIcon(
                                      FontAwesomeIcons.instagram,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'VIEW_PROFILE_OTHER_instagram_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_Launch-U-R-L');
                                      await launchURL(
                                          viewProfileOtherUsersRecord
                                              .instagramUrl!);
                                    },
                                  ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (viewProfileOtherUsersRecord.hasTikTok ??
                                    true)
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    buttonSize: 48,
                                    icon: FaIcon(
                                      FontAwesomeIcons.tiktok,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'VIEW_PROFILE_OTHER_tiktok_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_Launch-U-R-L');
                                      await launchURL(
                                          viewProfileOtherUsersRecord
                                              .tiktokUrl!);
                                    },
                                  ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (viewProfileOtherUsersRecord.hasLink ?? true)
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    buttonSize: 48,
                                    icon: FaIcon(
                                      FontAwesomeIcons.link,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'VIEW_PROFILE_OTHER_PAGE_link_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_Launch-U-R-L');
                                      await launchURL(
                                          viewProfileOtherUsersRecord.website!);
                                    },
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(60, 0, 60, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 10),
                                  child: Text(
                                    viewProfileOtherUsersRecord.bio!
                                        .maybeHandleOverflow(maxChars: 100),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          fontSize: 14,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'VIEW_PROFILE_OTHER_Container_qesf911q_ON');
                                    logFirebaseEvent('Container_Navigate-To');

                                    context.pushNamed(
                                      'chatUser',
                                      queryParams: {
                                        'chatUser': serializeParam(
                                            viewProfileOtherUsersRecord,
                                            ParamType.Document),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'chatUser': viewProfileOtherUsersRecord,
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0x00960000),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Icon(
                                      Icons.message_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (!(currentUserDocument?.following?.toList() ??
                                    [])
                                .contains(
                                    viewProfileOtherUsersRecord.reference))
                              AuthUserStreamWidget(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'VIEW_PROFILE_OTHER_Container_7fng4dgw_ON');
                                        logFirebaseEvent(
                                            'Container_Backend-Call');

                                        final usersUpdateData = {
                                          'following': FieldValue.arrayUnion([
                                            viewProfileOtherUsersRecord
                                                .reference
                                          ]),
                                        };
                                        await currentUserReference!
                                            .update(usersUpdateData);
                                        logFirebaseEvent(
                                            'Container_Widget-Animation');
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation1'] ==
                                            null) {
                                          return;
                                        }
                                        await (animationsMap[
                                                    'containerOnActionTriggerAnimation1']!
                                                .curvedAnimation
                                                .parent as AnimationController)
                                            .forward(from: 0.0);

                                        logFirebaseEvent(
                                            'Container_Alert-Dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'You are now following this user.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        logFirebaseEvent(
                                            'Container_Trigger-Push-Notification');
                                        triggerPushNotification(
                                          notificationTitle: 'New Follower',
                                          notificationText:
                                              '${currentUserDisplayName} is following you',
                                          notificationImageUrl:
                                              currentUserPhoto,
                                          userRefs: [widget.otherUser!],
                                          initialPageName: 'homePage',
                                          parameterData: {},
                                        );
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'jwhmq2vp' /* Follow */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    fontSize: 18,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ).animated([
                                      animationsMap[
                                          'containerOnActionTriggerAnimation1']!
                                    ]),
                                  ],
                                ),
                              ),
                            if ((currentUserDocument?.following?.toList() ?? [])
                                .contains(
                                    viewProfileOtherUsersRecord.reference))
                              AuthUserStreamWidget(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'VIEW_PROFILE_OTHER_Container_iztby73l_ON');
                                            logFirebaseEvent(
                                                'Container_Backend-Call');

                                            final usersUpdateData = {
                                              'following':
                                                  FieldValue.arrayRemove([
                                                viewProfileOtherUsersRecord
                                                    .reference
                                              ]),
                                            };
                                            await currentUserReference!
                                                .update(usersUpdateData);
                                            logFirebaseEvent(
                                                'Container_Widget-Animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation2'] ==
                                                null) {
                                              return;
                                            }
                                            await (animationsMap[
                                                        'containerOnActionTriggerAnimation2']!
                                                    .curvedAnimation
                                                    .parent as AnimationController)
                                                .forward(from: 0.0);

                                            logFirebaseEvent(
                                                'Container_Alert-Dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'You have unfollowed this user.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child:
                                                          Text('Bye, Felicia'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Color(0x00960000),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qm8rl106' /* Unfollow */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontSize: 18,
                                                  ),
                                            ),
                                          ),
                                        ).animated([
                                          animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                        ]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(60, 0, 46, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 20, 20, 20),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'VIEW_PROFILE_OTHER_Column_hfanzwy3_ON_TA');
                                  logFirebaseEvent('Column_Navigate-To');

                                  context.pushNamed(
                                    'following',
                                    queryParams: {
                                      'user': serializeParam(
                                          viewProfileOtherUsersRecord,
                                          ParamType.Document),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'user': viewProfileOtherUsersRecord,
                                    },
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 5),
                                      child: Text(
                                        viewProfileOtherUsersRecord.following!
                                            .toList()
                                            .length
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'al40nzii' /* Following */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(),
                        child: DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                labelStyle: GoogleFonts.getFont(
                                  'Roboto',
                                ),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                tabs: [
                                  Tab(
                                    icon: Icon(
                                      Icons.dashboard_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                  Tab(
                                    icon: FaIcon(
                                      FontAwesomeIcons.fire,
                                      color: Color(0xFFB94600),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        StreamBuilder<List<PostsRecord>>(
                                          stream: queryPostsRecord(
                                            queryBuilder: (postsRecord) =>
                                                postsRecord
                                                    .where('user',
                                                        isEqualTo:
                                                            viewProfileOtherUsersRecord
                                                                .reference)
                                                    .where('isFlagged',
                                                        isEqualTo: false)
                                                    .orderBy('created_at',
                                                        descending: true),
                                            limit: 9,
                                          ),
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
                                            List<PostsRecord>
                                                gridViewPostsRecordList =
                                                snapshot.data!;
                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 3,
                                                mainAxisSpacing: 0,
                                                childAspectRatio: 0.75,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: gridViewPostsRecordList
                                                  .length,
                                              itemBuilder:
                                                  (context, gridViewIndex) {
                                                final gridViewPostsRecord =
                                                    gridViewPostsRecordList[
                                                        gridViewIndex];
                                                return Stack(
                                                  children: [
                                                    StreamBuilder<PostsRecord>(
                                                      stream: PostsRecord
                                                          .getDocument(
                                                              gridViewPostsRecord
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
                                                        final imagePostsRecord =
                                                            snapshot.data!;
                                                        return InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'VIEW_PROFILE_OTHER_Image_ptut6h4w_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Image_Navigate-To');

                                                            context.pushNamed(
                                                              'videoScreen',
                                                              queryParams: {
                                                                'post': serializeParam(
                                                                    gridViewPostsRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference),
                                                                'initialStoryIndex':
                                                                    serializeParam(
                                                                        gridViewIndex,
                                                                        ParamType
                                                                            .int),
                                                                'user': serializeParam(
                                                                    viewProfileOtherUsersRecord,
                                                                    ParamType
                                                                        .Document),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'user':
                                                                    viewProfileOtherUsersRecord,
                                                              },
                                                            );

                                                            logFirebaseEvent(
                                                                'Image_Backend-Call');

                                                            final postsUpdateData =
                                                                {
                                                              'wacthed':
                                                                  FieldValue
                                                                      .increment(
                                                                          1),
                                                            };
                                                            await gridViewPostsRecord
                                                                .reference
                                                                .update(
                                                                    postsUpdateData);
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  valueOrDefault<
                                                                      String>(
                                                                gridViewPostsRecord
                                                                    .videoThumbnail,
                                                                'http://colorly.app/wp-content/uploads/2021/08/OQaOKP_t20_g8wmld.jpg',
                                                              ),
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.85, -0.85),
                                                      child: Icon(
                                                        Icons
                                                            .play_circle_outline_rounded,
                                                        color:
                                                            Color(0xD8FFFFFF),
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                Color(
                                                                    0x00960000),
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryDark
                                                              ],
                                                              stops: [0, 1],
                                                              begin:
                                                                  AlignmentDirectional(
                                                                      0, -1),
                                                              end:
                                                                  AlignmentDirectional(
                                                                      0, 1),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            0,
                                                                            3,
                                                                            0),
                                                                child: Icon(
                                                                  Icons
                                                                      .remove_red_eye,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  size: 14,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    gridViewPostsRecord
                                                                        .wacthed
                                                                        ?.toString(),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            3,
                                                                            0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .fire,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  size: 12,
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  gridViewPostsRecord
                                                                      .likes!
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 20, 20, 70),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'VIEW_PROFILE_OTHER_VIEW_ALL_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_Navigate-To');

                                                    context.pushNamed(
                                                      'postCollage',
                                                      queryParams: {
                                                        'user': serializeParam(
                                                            viewProfileOtherUsersRecord,
                                                            ParamType.Document),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'user':
                                                            viewProfileOtherUsersRecord,
                                                      },
                                                    );
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'hlwr6k04' /* View all */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 130,
                                                    height: 40,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: Colors.white,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 70),
                                          child:
                                              StreamBuilder<List<PostsRecord>>(
                                            stream: queryPostsRecord(
                                              queryBuilder: (postsRecord) =>
                                                  postsRecord
                                                      .where(
                                                          'likes',
                                                          arrayContains:
                                                              viewProfileOtherUsersRecord
                                                                  .reference)
                                                      .where('isFlagged',
                                                          isEqualTo: false)
                                                      .orderBy('created_at',
                                                          descending: true),
                                              limit: 12,
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 30,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<PostsRecord>
                                                  gridViewPostsRecordList =
                                                  snapshot.data!;
                                              return GridView.builder(
                                                padding: EdgeInsets.zero,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  crossAxisSpacing: 3,
                                                  mainAxisSpacing: 0,
                                                  childAspectRatio: 0.75,
                                                ),
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    gridViewPostsRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, gridViewIndex) {
                                                  final gridViewPostsRecord =
                                                      gridViewPostsRecordList[
                                                          gridViewIndex];
                                                  return StreamBuilder<
                                                      UsersRecord>(
                                                    stream:
                                                        UsersRecord.getDocument(
                                                            gridViewPostsRecord
                                                                .user!),
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
                                                      final stackUsersRecord =
                                                          snapshot.data!;
                                                      return Stack(
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'VIEW_PROFILE_OTHER_Image_gzs6d2e1_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Image_Backend-Call');

                                                              final postsUpdateData =
                                                                  {
                                                                'wacthed':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              };
                                                              await gridViewPostsRecord
                                                                  .reference
                                                                  .update(
                                                                      postsUpdateData);
                                                              logFirebaseEvent(
                                                                  'Image_Navigate-To');

                                                              context.pushNamed(
                                                                'singleVideoPage',
                                                                queryParams: {
                                                                  'post': serializeParam(
                                                                      gridViewPostsRecord,
                                                                      ParamType
                                                                          .Document),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'post':
                                                                      gridViewPostsRecord,
                                                                },
                                                              );
                                                            },
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  gridViewPostsRecord
                                                                      .videoThumbnail,
                                                                  'http://colorly.app/wp-content/uploads/2021/08/OQaOKP_t20_g8wmld.jpg',
                                                                ),
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.85,
                                                                    -0.85),
                                                            child: Icon(
                                                              Icons
                                                                  .play_circle_outline_rounded,
                                                              color: Color(
                                                                  0xD8FFFFFF),
                                                              size: 24,
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0x00960000),
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryDark
                                                                    ],
                                                                    stops: [
                                                                      0,
                                                                      1
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            -1),
                                                                    end:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            1),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              2,
                                                                              0,
                                                                              3,
                                                                              0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .remove_red_eye,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        size:
                                                                            14,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              5,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          gridViewPostsRecord
                                                                              .wacthed
                                                                              ?.toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                              fontSize: 12,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              3,
                                                                              0),
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .fire,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        size:
                                                                            12,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        gridViewPostsRecord
                                                                            .likes!
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
                                                                            fontSize:
                                                                                12,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
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
                          ),
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
