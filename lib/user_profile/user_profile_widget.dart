import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/connected_restaurants_widget.dart';
import '../components/deal_popup_copy_widget.dart';
import '../components/delete_account_widget.dart';
import '../components/delete_post_widget.dart';
import '../components/edit_review_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({
    Key? key,
    this.posts,
    this.user,
    this.friends,
    this.post,
    this.likes,
  }) : super(key: key);

  final DocumentReference? posts;
  final UsersRecord? user;
  final FriendsRecord? friends;
  final PostsRecord? post;
  final LikesRecord? likes;

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        offset: Offset(0, 0),
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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'userProfile'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
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
        final userProfileUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryDark,
            automaticallyImplyLeading: true,
            leading: Visibility(
              visible: userProfileUsersRecord.isRestaurant ?? true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('USER_PROFILE_PAGE_BUTTON_BTN_ON_TAP');
                    logFirebaseEvent('Button_Bottom-Sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: Container(
                            height: 400,
                            child: ConnectedRestaurantsWidget(),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  text: FFLocalizations.of(context).getText(
                    'q3634yci' /* Button */,
                  ),
                  icon: Icon(
                    Icons.add_business_rounded,
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    size: 24,
                  ),
                  options: FFButtonOptions(
                    width: 60,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                        ),
                    elevation: 6,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            title: Text(
              userProfileUsersRecord.username!,
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    fontSize: 20,
                  ),
            ),
            actions: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'USER_PROFILE_PAGE_Icon_zg7e8orb_ON_TAP');
                      logFirebaseEvent('Icon_Drawer');
                      scaffoldKey.currentState!.openEndDrawer();
                    },
                    child: FaIcon(
                      FontAwesomeIcons.hamburger,
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                      size: 24,
                    ),
                  ).animated([animationsMap['iconOnActionTriggerAnimation']!]),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryDark,
          endDrawer: Drawer(
            elevation: 16,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://media.giphy.com/media/3Z1ePk6idWGFvxAXhm/giphy-downsized.gif',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Color(0x950F0F0F),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 25, 0, 0),
                              child: AuthUserStreamWidget(
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      currentUserPhoto,
                                      'https://p1.pxfuel.com/preview/828/149/229/indistinct-blurred-pineapple-rough.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 110, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 5),
                                  child: AuthUserStreamWidget(
                                    child: Text(
                                      currentUserDisplayName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 5),
                                  child: Text(
                                    currentUserEmail,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 5),
                                  child: AuthUserStreamWidget(
                                    child: Text(
                                      currentPhoneNumber,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 5),
                                  child: AuthUserStreamWidget(
                                    child: Text(
                                      valueOrDefault(
                                          currentUserDocument?.username, ''),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
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
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent('USER_PROFILE_ListTile_fb9vwcqo_ON_TAP');
                      logFirebaseEvent('ListTile_Navigate-To');

                      context.pushNamed(
                        'editProfile',
                        queryParams: {
                          'user': serializeParam(
                              userProfileUsersRecord, ParamType.Document),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'user': userProfileUsersRecord,
                        },
                      );
                    },
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'eopqvooa' /* Edit Profile */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent('USER_PROFILE_ListTile_07srdoq2_ON_TAP');
                      logFirebaseEvent('ListTile_Navigate-To');

                      context.pushNamed('orderTransactions');
                    },
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'q295y2bw' /* Orders */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent('USER_PROFILE_ListTile_tpxxap7q_ON_TAP');
                      logFirebaseEvent('ListTile_Navigate-To');

                      context.pushNamed('wallet');
                    },
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'zvt3165s' /* Wallet */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent('USER_PROFILE_ListTile_pk5c1s19_ON_TAP');
                      logFirebaseEvent('ListTile_Navigate-To');

                      context.pushNamed('likedVideos');
                    },
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'vmi9lhjx' /* Liked Videos */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent('USER_PROFILE_ListTile_we4yhbdo_ON_TAP');
                      logFirebaseEvent('ListTile_Navigate-To');

                      context.pushNamed('draftVideos');
                    },
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'bdaitso5' /* Drafts */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent('USER_PROFILE_ListTile_vx41esuc_ON_TAP');
                      logFirebaseEvent('ListTile_Navigate-To');

                      context.pushNamed(
                        'nearbyVideoPage',
                        queryParams: {
                          'initialStoryIndex': serializeParam(0, ParamType.int),
                        }.withoutNulls,
                      );
                    },
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          't5b8gz96' /* Nearby Reviews */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent('USER_PROFILE_ListTile_ah5xcuvw_ON_TAP');
                      logFirebaseEvent('ListTile_Navigate-To');

                      context.pushNamed(
                        'bookmarked',
                        queryParams: {
                          'user': serializeParam(
                              userProfileUsersRecord, ParamType.Document),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'user': userProfileUsersRecord,
                        },
                      );
                    },
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'guux0m1w' /* Bookmarked */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent('USER_PROFILE_ListTile_xkw6bhnf_ON_TAP');
                      logFirebaseEvent('ListTile_Navigate-To');

                      context.pushNamed(
                        'blockedUsers',
                        queryParams: {
                          'user': serializeParam(
                              userProfileUsersRecord, ParamType.Document),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'user': userProfileUsersRecord,
                        },
                      );
                    },
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'gv630zln' /* Blocked Users */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent('USER_PROFILE_ListTile_cs14sxsx_ON_TAP');
                      logFirebaseEvent('ListTile_Navigate-To');

                      context.pushNamed('createRestaurant');
                    },
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          '95hwejfe' /* Create Restaurant */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent('USER_PROFILE_ListTile_hx2w6h60_ON_TAP');
                      logFirebaseEvent('ListTile_Auth');
                      GoRouter.of(context).prepareAuthEvent();
                      await signOut();

                      context.goNamedAuth('login', mounted);
                    },
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          '0i8ugku9' /* Log Out */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  Slidable(
                    actionPane: const SlidableScrollActionPane(),
                    secondaryActions: [
                      IconSlideAction(
                        caption: FFLocalizations.of(context).getText(
                          'ndtukt0l' /* Delete */,
                        ),
                        color: Color(0xFFF3213B),
                        icon: FontAwesomeIcons.exclamationTriangle,
                        onTap: () async {
                          logFirebaseEvent(
                              'USER_PROFILE_SlidableActionWidget_9dy03h');
                          logFirebaseEvent('SlidableActionWidget_Bottom-Sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: DeleteAccountWidget(),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                      ),
                    ],
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'ioq21w1l' /* Delete Account */,
                        ),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(99),
                                        child: CachedNetworkImage(
                                          imageUrl: valueOrDefault<String>(
                                            userProfileUsersRecord.photoUrl,
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
                            if (userProfileUsersRecord.isPremium ?? true)
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: Icon(
                                  Icons.live_tv_rounded,
                                  color: FlutterFlowTheme.of(context).white,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'USER_PROFILE_live_tv_rounded_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_Navigate-To');

                                  context.pushNamed('BroadcastPage');
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 10),
                                  child: Text(
                                    userProfileUsersRecord.displayName!,
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
                                  if (valueOrDefault<bool>(
                                      currentUserDocument?.hasFacebook, false))
                                    AuthUserStreamWidget(
                                      child: FlutterFlowIconButton(
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
                                              'USER_PROFILE_facebookSquare_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_Launch-U-R-L');
                                          await launchURL(userProfileUsersRecord
                                              .facebookUrl!);
                                        },
                                      ),
                                    ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (valueOrDefault<bool>(
                                      currentUserDocument?.hasInstagram, false))
                                    AuthUserStreamWidget(
                                      child: FlutterFlowIconButton(
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
                                              'USER_PROFILE_PAGE_instagram_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_Launch-U-R-L');
                                          await launchURL(userProfileUsersRecord
                                              .instagramUrl!);
                                        },
                                      ),
                                    ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (valueOrDefault<bool>(
                                      currentUserDocument?.hasTikTok, false))
                                    AuthUserStreamWidget(
                                      child: FlutterFlowIconButton(
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
                                              'USER_PROFILE_PAGE_tiktok_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_Launch-U-R-L');
                                          await launchURL(userProfileUsersRecord
                                              .tiktokUrl!);
                                        },
                                      ),
                                    ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (valueOrDefault<bool>(
                                      currentUserDocument?.hasLink, false))
                                    AuthUserStreamWidget(
                                      child: FlutterFlowIconButton(
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
                                              'USER_PROFILE_PAGE_link_ICN_ON_TAP');
                                          logFirebaseEvent(
                                              'IconButton_Launch-U-R-L');
                                          await launchURL(
                                              userProfileUsersRecord.website!);
                                        },
                                      ),
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
                                      userProfileUsersRecord.bio!
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'USER_PROFILE_EDIT_PROFILE_BTN_ON_TAP');
                                logFirebaseEvent('Button_Navigate-To');

                                context.pushNamed(
                                  'editProfile',
                                  queryParams: {
                                    'user': serializeParam(
                                        userProfileUsersRecord,
                                        ParamType.Document),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'user': userProfileUsersRecord,
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'dozwcfes' /* Edit Profile */,
                              ),
                              options: FFButtonOptions(
                                width: 120,
                                height: 46,
                                color: FlutterFlowTheme.of(context).primaryDark,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontSize: 18,
                                    ),
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'USER_PROFILE_PAGE__BTN_ON_TAP');
                                      logFirebaseEvent('Button_Navigate-To');

                                      context.pushNamed(
                                        'blockedUsers',
                                        queryParams: {
                                          'user': serializeParam(
                                              userProfileUsersRecord,
                                              ParamType.Document),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'user': userProfileUsersRecord,
                                        },
                                      );
                                    },
                                    text: '',
                                    icon: Icon(
                                      Icons.person_add_disabled,
                                      size: 26,
                                    ),
                                    options: FFButtonOptions(
                                      width: 50,
                                      height: 46,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryDark,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 18,
                                          ),
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'USER_PROFILE_PAGE__BTN_ON_TAP');
                                        logFirebaseEvent('Button_Navigate-To');

                                        context.pushNamed(
                                          'bookmarked',
                                          queryParams: {
                                            'user': serializeParam(
                                                userProfileUsersRecord,
                                                ParamType.Document),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'user': userProfileUsersRecord,
                                          },
                                        );
                                      },
                                      text: '',
                                      icon: Icon(
                                        Icons.book,
                                        size: 26,
                                      ),
                                      options: FFButtonOptions(
                                        width: 50,
                                        height: 46,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryDark,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              fontSize: 18,
                                            ),
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  if (valueOrDefault<bool>(
                                      currentUserDocument?.superAdmin, false))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: AuthUserStreamWidget(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'USER_PROFILE_PAGE__BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_Navigate-To');

                                            context.pushNamed('adventurePage');
                                          },
                                          text: '',
                                          icon: FaIcon(
                                            FontAwesomeIcons.utensils,
                                            size: 22,
                                          ),
                                          options: FFButtonOptions(
                                            width: 50,
                                            height: 46,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryDark,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      fontSize: 18,
                                                    ),
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Container(
                                      width: 50,
                                      height: 46,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryDark,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'USER_PROFILE_LottieAnimation_gh6skhe7_ON');
                                          logFirebaseEvent(
                                              'LottieAnimation_Navigate-To');

                                          context.pushNamed('wallet');
                                        },
                                        child: Lottie.asset(
                                          'assets/lottie_animations/coin-wallet.json',
                                          width: 150,
                                          height: 130,
                                          fit: BoxFit.cover,
                                          animate: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (currentUserDocument!.shoppingBag != null)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: AuthUserStreamWidget(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'USER_PROFILE_PAGE__BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_Navigate-To');

                                            context.pushNamed('shoppingCart');
                                          },
                                          text: '',
                                          icon: Icon(
                                            Icons.shopping_bag,
                                            size: 30,
                                          ),
                                          options: FFButtonOptions(
                                            width: 50,
                                            height: 46,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryDark,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      fontSize: 18,
                                                    ),
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(60, 0, 46, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'USER_PROFILE_PAGE_Column_b9v2k3ao_ON_TAP');
                                    logFirebaseEvent('Column_Navigate-To');

                                    context.pushNamed(
                                      'following',
                                      queryParams: {
                                        'user': serializeParam(
                                            userProfileUsersRecord,
                                            ParamType.Document),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'user': userProfileUsersRecord,
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
                                          userProfileUsersRecord.following!
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
                                          'c2iihdt4' /* Following */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                            length: 3,
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
                                      FlutterFlowTheme.of(context).primaryColor,
                                  tabs: [
                                    Tab(
                                      icon: Icon(
                                        Icons.dashboard_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                    Tab(
                                      icon: Icon(
                                        Icons.theaters,
                                        color: Color(0xFFB94600),
                                      ),
                                    ),
                                    Tab(
                                      icon: FaIcon(
                                        FontAwesomeIcons.tag,
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
                                                      .where(
                                                          'user',
                                                          isEqualTo:
                                                              currentUserReference)
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
                                                            userProfileUsersRecord
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
                                                      final stackUsersRecord =
                                                          snapshot.data!;
                                                      return Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'USER_PROFILE_PAGE_Image_spd6dwne_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Image_Navigate-To');

                                                                context
                                                                    .pushNamed(
                                                                  'videoScreen',
                                                                  queryParams: {
                                                                    'initialStoryIndex': serializeParam(
                                                                        gridViewIndex,
                                                                        ParamType
                                                                            .int),
                                                                    'post': serializeParam(
                                                                        gridViewPostsRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference),
                                                                    'user': serializeParam(
                                                                        stackUsersRecord,
                                                                        ParamType
                                                                            .Document),
                                                                  }.withoutNulls,
                                                                  extra: <
                                                                      String,
                                                                      dynamic>{
                                                                    'user':
                                                                        stackUsersRecord,
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
                                                              onDoubleTap:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'USER_PROFILE_Image_spd6dwne_ON_DOUBLE_TA');
                                                                logFirebaseEvent(
                                                                    'Image_Bottom-Sheet');
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
                                                                          Container(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.8,
                                                                        child:
                                                                            EditReviewWidget(
                                                                          posts:
                                                                              gridViewPostsRecord,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              onLongPress:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'USER_PROFILE_Image_spd6dwne_ON_LONG_PRES');
                                                                logFirebaseEvent(
                                                                    'Image_Bottom-Sheet');
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
                                                                          DeletePostWidget(
                                                                        post:
                                                                            gridViewPostsRecord,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
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
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.85,
                                                                    -0.85),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .playCircle,
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
                                                                        gridViewPostsRecord
                                                                            .wacthed!
                                                                            .toString(),
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
                                                                      gridViewPostsRecord
                                                                          .likes!
                                                                          .toList()
                                                                          .length
                                                                          .toString(),
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
                                                          if (gridViewPostsRecord
                                                                  .isFlagged ??
                                                              true)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          0,
                                                                          0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .solidEyeSlash,
                                                                color: Color(
                                                                    0xFF960000),
                                                                size: 24,
                                                              ),
                                                            ),
                                                        ],
                                                      );
                                                    },
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
                                                          'USER_PROFILE_PAGE_VIEW_ALL_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_Navigate-To');

                                                      context.pushNamed(
                                                        'postCollage',
                                                        queryParams: {
                                                          'user': serializeParam(
                                                              userProfileUsersRecord,
                                                              ParamType
                                                                  .Document),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'user':
                                                              userProfileUsersRecord,
                                                        },
                                                      );
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '87v2092y' /* View all */,
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
                                                        color:
                                                            Colors.transparent,
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
                                                    0, 0, 0, 50),
                                            child: AuthUserStreamWidget(
                                              child: Builder(
                                                builder: (context) {
                                                  final savedPosts =
                                                      (currentUserDocument
                                                                  ?.savedPosts
                                                                  ?.toList() ??
                                                              [])
                                                          .toList()
                                                          .take(12)
                                                          .toList();
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
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        savedPosts.length,
                                                    itemBuilder: (context,
                                                        savedPostsIndex) {
                                                      final savedPostsItem =
                                                          savedPosts[
                                                              savedPostsIndex];
                                                      return StreamBuilder<
                                                          PostsRecord>(
                                                        stream: PostsRecord
                                                            .getDocument(
                                                                savedPostsItem),
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
                                                          final stackPostsRecord =
                                                              snapshot.data!;
                                                          return Stack(
                                                            children: [
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'USER_PROFILE_PAGE_Image_l7r00bjj_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Image_Navigate-To');

                                                                  context
                                                                      .pushNamed(
                                                                    'singleVideoPage',
                                                                    queryParams:
                                                                        {
                                                                      'post': serializeParam(
                                                                          stackPostsRecord,
                                                                          ParamType
                                                                              .Document),
                                                                    }.withoutNulls,
                                                                    extra: <
                                                                        String,
                                                                        dynamic>{
                                                                      'post':
                                                                          stackPostsRecord,
                                                                    },
                                                                  );

                                                                  logFirebaseEvent(
                                                                      'Image_Backend-Call');

                                                                  final postsUpdateData =
                                                                      {
                                                                    'wacthed':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  };
                                                                  await stackPostsRecord
                                                                      .reference
                                                                      .update(
                                                                          postsUpdateData);
                                                                },
                                                                onLongPress:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'USER_PROFILE_Image_l7r00bjj_ON_LONG_PRES');
                                                                  logFirebaseEvent(
                                                                      'Image_Backend-Call');

                                                                  final usersUpdateData =
                                                                      {
                                                                    'savedPosts':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      stackPostsRecord
                                                                          .reference
                                                                    ]),
                                                                  };
                                                                  await currentUserReference!
                                                                      .update(
                                                                          usersUpdateData);
                                                                },
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    imageUrl:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      stackPostsRecord
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryDark
                                                                        ],
                                                                        stops: [
                                                                          0,
                                                                          1
                                                                        ],
                                                                        begin: AlignmentDirectional(
                                                                            0,
                                                                            -1),
                                                                        end: AlignmentDirectional(
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            0),
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2,
                                                                              0,
                                                                              3,
                                                                              0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.remove_red_eye,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            size:
                                                                                14,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              5,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              stackPostsRecord.wacthed?.toString(),
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                  fontSize: 12,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              3,
                                                                              0),
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.fire,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            size:
                                                                                12,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            stackPostsRecord.likes!.toList().length.toString(),
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
                                          ),
                                        ],
                                      ),
                                      StreamBuilder<List<DealsRecord>>(
                                        stream: queryDealsRecord(
                                          queryBuilder: (dealsRecord) =>
                                              dealsRecord
                                                  .where('active',
                                                      isEqualTo: true)
                                                  .where('userSaved',
                                                      arrayContains:
                                                          currentUserReference)
                                                  .where('expiry',
                                                      isGreaterThanOrEqualTo:
                                                          getCurrentTimestamp)
                                                  .orderBy('expiry'),
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
                                          List<DealsRecord>
                                              listViewDealsRecordList =
                                              snapshot.data!;
                                          if (listViewDealsRecordList.isEmpty) {
                                            return Image.network(
                                              '',
                                            );
                                          }
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewDealsRecordList.length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewDealsRecord =
                                                  listViewDealsRecordList[
                                                      listViewIndex];
                                              return Visibility(
                                                visible: !(currentUserDocument
                                                            ?.usedDeals
                                                            ?.toList() ??
                                                        [])
                                                    .contains(
                                                        listViewDealsRecord
                                                            .reference),
                                                child: AuthUserStreamWidget(
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    12, 16, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'USER_PROFILE_Container_1yi3ygpz_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Container_Bottom-Sheet');
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
                                                                    height: 800,
                                                                    child:
                                                                        DealPopupCopyWidget(
                                                                      deal:
                                                                          listViewDealsRecord,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.86,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 3,
                                                                  color: Color(
                                                                      0x25000000),
                                                                  offset:
                                                                      Offset(
                                                                          0, 2),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          4,
                                                                          4,
                                                                          4),
                                                                  child:
                                                                      Container(
                                                                    width: 4,
                                                                    height: 90,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 200,
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            12,
                                                                            16,
                                                                            12),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          listViewDealsRecord
                                                                              .title!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .title2
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: Color(0xFF090F13),
                                                                                fontSize: 22,
                                                                                fontWeight: FontWeight.w800,
                                                                              ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            listViewDealsRecord.details!.maybeHandleOverflow(
                                                                              maxChars: 21,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: Color(0xFF090F13),
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            'Until ${dateTimeFormat('MMMEd', listViewDealsRecord.expiry)}',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: Color(0xFF874E00),
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
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
                                                                    Container(
                                                                      width: 5,
                                                                      height:
                                                                          10,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 5,
                                                                      height: 5,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 5,
                                                                      height:
                                                                          10,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 5,
                                                                      height: 5,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 5,
                                                                      height:
                                                                          10,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 5,
                                                                      height: 5,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 5,
                                                                      height:
                                                                          10,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 5,
                                                                      height: 5,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 5,
                                                                      height:
                                                                          10,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 5,
                                                                      height: 5,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 5,
                                                                      height:
                                                                          10,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 5,
                                                                      height: 5,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 5,
                                                                      height:
                                                                          10,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      10, 0, 0),
                                                          child: Container(
                                                            width: 50,
                                                            height: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryDark,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 1,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryDark,
                                                                )
                                                              ],
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.6, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      10, 0, 0),
                                                          child: StreamBuilder<
                                                              RestaurantsRecord>(
                                                            stream: RestaurantsRecord
                                                                .getDocument(
                                                                    listViewDealsRecord
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
                                                              final circleImageRestaurantsRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                width: 60,
                                                                height: 60,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  circleImageRestaurantsRecord
                                                                      .logo!,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
