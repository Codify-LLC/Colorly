import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/connected_restaurants/connected_restaurants_widget.dart';
import '/components/deal_popup_copy/deal_popup_copy_widget.dart';
import '/components/delete_account/delete_account_widget.dart';
import '/components/delete_post/delete_post_widget.dart';
import '/components/edit_review/edit_review_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'user_profile_model.dart';
export 'user_profile_model.dart';

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
  late UserProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'userProfile'});
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
      stream: UsersRecord.getDocument(currentUserReference!),
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
        final userProfileUsersRecord = snapshot.data!;
        return Title(
            title: 'userProfile',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              endDrawer: Drawer(
                elevation: 16.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://media.giphy.com/media/3Z1ePk6idWGFvxAXhm/giphy-downsized.gif',
                                width: double.infinity,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 200.0,
                              decoration: BoxDecoration(
                                color: Color(0x950F0F0F),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 25.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Container(
                                        width: 60.0,
                                        height: 60.0,
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 110.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 5.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            currentUserDisplayName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          currentUserEmail,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 5.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            currentPhoneNumber,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 5.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault(
                                                currentUserDocument?.username,
                                                ''),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'USER_PROFILE_ListTile_fb9vwcqo_ON_TAP');
                              logFirebaseEvent('ListTile_navigate_to');

                              context.pushNamed('profileHome');
                            },
                            child: ListTile(
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'eopqvooa' /* Edit Profile */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'USER_PROFILE_ListTile_07srdoq2_ON_TAP');
                              logFirebaseEvent('ListTile_navigate_to');

                              context.pushNamed('orderTransactions');
                            },
                            child: ListTile(
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'q295y2bw' /* Orders */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'USER_PROFILE_ListTile_tpxxap7q_ON_TAP');
                              logFirebaseEvent('ListTile_navigate_to');

                              context.pushNamed('wallet');
                            },
                            child: ListTile(
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'zvt3165s' /* Wallet */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'USER_PROFILE_ListTile_pk5c1s19_ON_TAP');
                              logFirebaseEvent('ListTile_navigate_to');

                              context.pushNamed('likedVideos');
                            },
                            child: ListTile(
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'vmi9lhjx' /* Liked Videos */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'USER_PROFILE_ListTile_we4yhbdo_ON_TAP');
                              logFirebaseEvent('ListTile_navigate_to');

                              context.pushNamed('draftVideos');
                            },
                            child: ListTile(
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'bdaitso5' /* Drafts */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'USER_PROFILE_ListTile_vx41esuc_ON_TAP');
                              logFirebaseEvent('ListTile_navigate_to');

                              context.pushNamed(
                                'nearbyVideoPage',
                                queryParams: {
                                  'initialStoryIndex': serializeParam(
                                    0,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: ListTile(
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  't5b8gz96' /* Nearby Reviews */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'USER_PROFILE_ListTile_ah5xcuvw_ON_TAP');
                              logFirebaseEvent('ListTile_navigate_to');

                              context.pushNamed(
                                'bookmarked',
                                queryParams: {
                                  'user': serializeParam(
                                    userProfileUsersRecord,
                                    ParamType.Document,
                                  ),
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
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'USER_PROFILE_ListTile_xkw6bhnf_ON_TAP');
                              logFirebaseEvent('ListTile_navigate_to');

                              context.pushNamed(
                                'blockedUsers',
                                queryParams: {
                                  'user': serializeParam(
                                    userProfileUsersRecord,
                                    ParamType.Document,
                                  ),
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
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'USER_PROFILE_ListTile_cs14sxsx_ON_TAP');
                              logFirebaseEvent('ListTile_navigate_to');

                              context.pushNamed('createRestaurant');
                            },
                            child: ListTile(
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  '95hwejfe' /* Create Restaurant */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'USER_PROFILE_ListTile_hx2w6h60_ON_TAP');
                              logFirebaseEvent('ListTile_auth');
                              GoRouter.of(context).prepareAuthEvent();
                              await signOut();

                              context.goNamedAuth('login', mounted);
                            },
                            child: ListTile(
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  '0i8ugku9' /* Log Out */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: Slidable(
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
                                  logFirebaseEvent(
                                      'SlidableActionWidget_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
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
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              dense: false,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: true,
                leading: Visibility(
                  visible: userProfileUsersRecord.isRestaurant ?? true,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('USER_PROFILE_PAGE_BUTTON_BTN_ON_TAP');
                        logFirebaseEvent('Button_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                height: 400.0,
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
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      options: FFButtonOptions(
                        width: 60.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                ),
                        elevation: 6.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  userProfileUsersRecord.username!,
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 20.0,
                      ),
                ),
                actions: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'USER_PROFILE_PAGE_Icon_zg7e8orb_ON_TAP');
                          logFirebaseEvent('Icon_drawer');
                          scaffoldKey.currentState!.openEndDrawer();
                        },
                        child: FaIcon(
                          FontAwesomeIcons.hamburger,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ],
                centerTitle: true,
                elevation: 4.0,
              ),
              body: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 1.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(99.0),
                                            child: CachedNetworkImage(
                                              imageUrl: valueOrDefault<String>(
                                                userProfileUsersRecord.photoUrl,
                                                'https://wpcdn.us-east-1.vip.tn-cloud.net/www.hawaiimagazine.com/content/uploads/2020/12/pineapple-opener.jpg',
                                              ),
                                              width: 80.0,
                                              height: 80.0,
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
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      Icons.live_tv_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 10.0),
                                      child: Text(
                                        userProfileUsersRecord.displayName!,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 18.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  60.0, 5.0, 60.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (valueOrDefault<bool>(
                                          currentUserDocument?.hasFacebook,
                                          false))
                                        AuthUserStreamWidget(
                                          builder: (context) =>
                                              FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 48.0,
                                            icon: FaIcon(
                                              FontAwesomeIcons.facebookSquare,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'USER_PROFILE_facebookSquare_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_launch_u_r_l');
                                              await launchURL(
                                                  userProfileUsersRecord
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
                                          currentUserDocument?.hasInstagram,
                                          false))
                                        AuthUserStreamWidget(
                                          builder: (context) =>
                                              FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 48.0,
                                            icon: FaIcon(
                                              FontAwesomeIcons.instagram,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'USER_PROFILE_PAGE_instagram_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_launch_u_r_l');
                                              await launchURL(
                                                  userProfileUsersRecord
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
                                          currentUserDocument?.hasTikTok,
                                          false))
                                        AuthUserStreamWidget(
                                          builder: (context) =>
                                              FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 48.0,
                                            icon: FaIcon(
                                              FontAwesomeIcons.tiktok,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'USER_PROFILE_PAGE_tiktok_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_launch_u_r_l');
                                              await launchURL(
                                                  userProfileUsersRecord
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
                                          builder: (context) =>
                                              FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 48.0,
                                            icon: FaIcon(
                                              FontAwesomeIcons.link,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'USER_PROFILE_PAGE_link_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_launch_u_r_l');
                                              await launchURL(
                                                  userProfileUsersRecord
                                                      .website!);
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  60.0, 0.0, 60.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 10.0),
                                        child: Text(
                                          userProfileUsersRecord.bio!
                                              .maybeHandleOverflow(
                                                  maxChars: 100),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
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
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed('profileHome');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'dozwcfes' /* Edit Profile */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 120.0,
                                    height: 46.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18.0,
                                        ),
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
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
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed(
                                            'blockedUsers',
                                            queryParams: {
                                              'user': serializeParam(
                                                userProfileUsersRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'user': userProfileUsersRecord,
                                            },
                                          );
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.person_add_disabled,
                                          size: 26.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 50.0,
                                          height: 46.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                              ),
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'USER_PROFILE_PAGE__BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.pushNamed(
                                              'bookmarked',
                                              queryParams: {
                                                'user': serializeParam(
                                                  userProfileUsersRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'user': userProfileUsersRecord,
                                              },
                                            );
                                          },
                                          text: '',
                                          icon: Icon(
                                            Icons.book,
                                            size: 26.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: 50.0,
                                            height: 46.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 18.0,
                                                    ),
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          height: 46.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'USER_PROFILE_LottieAnimation_gh6skhe7_ON');
                                              logFirebaseEvent(
                                                  'LottieAnimation_navigate_to');

                                              context.pushNamed('wallet');
                                            },
                                            child: Lottie.asset(
                                              'assets/lottie_animations/coin-wallet.json',
                                              width: 150.0,
                                              height: 130.0,
                                              fit: BoxFit.cover,
                                              animate: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (currentUserDocument!.shoppingBag !=
                                          null)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'USER_PROFILE_PAGE__BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context
                                                    .pushNamed('shoppingCart');
                                              },
                                              text: '',
                                              icon: Icon(
                                                Icons.shopping_bag,
                                                size: 30.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 50.0,
                                                height: 46.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 18.0,
                                                    ),
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  60.0, 0.0, 46.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 20.0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'USER_PROFILE_PAGE_Column_b9v2k3ao_ON_TAP');
                                        logFirebaseEvent('Column_navigate_to');

                                        context.pushNamed(
                                          'following',
                                          queryParams: {
                                            'user': serializeParam(
                                              userProfileUsersRecord,
                                              ParamType.Document,
                                            ),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 5.0),
                                            child: Text(
                                              userProfileUsersRecord.following!
                                                  .toList()
                                                  .length
                                                  .toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 20.0,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
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
                              height: MediaQuery.of(context).size.height * 1.0,
                              decoration: BoxDecoration(),
                              child: DefaultTabController(
                                length: 3,
                                initialIndex: 0,
                                child: Column(
                                  children: [
                                    TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      labelStyle: GoogleFonts.getFont(
                                        'Roboto',
                                      ),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
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
                                                          .where('user',
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
                                                  List<PostsRecord>
                                                      gridViewPostsRecordList =
                                                      snapshot.data!;
                                                  return GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      crossAxisSpacing: 3.0,
                                                      mainAxisSpacing: 0.0,
                                                      childAspectRatio: 0.75,
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        gridViewPostsRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        gridViewIndex) {
                                                      final gridViewPostsRecord =
                                                          gridViewPostsRecordList[
                                                              gridViewIndex];
                                                      return StreamBuilder<
                                                          UsersRecord>(
                                                        stream: UsersRecord
                                                            .getDocument(
                                                                userProfileUsersRecord
                                                                    .reference),
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
                                                          final stackUsersRecord =
                                                              snapshot.data!;
                                                          return Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'USER_PROFILE_PAGE_Image_spd6dwne_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Image_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'videoScreen',
                                                                      queryParams:
                                                                          {
                                                                        'initialStoryIndex':
                                                                            serializeParam(
                                                                          gridViewIndex,
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                        'post':
                                                                            serializeParam(
                                                                          gridViewPostsRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                        'user':
                                                                            serializeParam(
                                                                          stackUsersRecord,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <
                                                                          String,
                                                                          dynamic>{
                                                                        'user':
                                                                            stackUsersRecord,
                                                                      },
                                                                    );

                                                                    logFirebaseEvent(
                                                                        'Image_backend_call');

                                                                    final postsUpdateData =
                                                                        {
                                                                      'wacthed':
                                                                          FieldValue.increment(
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
                                                                        'Image_bottom_sheet');
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
                                                                                MediaQuery.of(context).size.height * 0.8,
                                                                            child:
                                                                                EditReviewWidget(
                                                                              posts: gridViewPostsRecord,
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
                                                                        'Image_bottom_sheet');
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
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
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
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              StreamBuilder<
                                                                  RestaurantsRecord>(
                                                                stream: RestaurantsRecord
                                                                    .getDocument(
                                                                        gridViewPostsRecord
                                                                            .restRef!),
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
                                                                  final columnRestaurantsRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 3.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.store_mall_directory_rounded,
                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                size: 14.0,
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Text(
                                                                                columnRestaurantsRecord.restaurantName!,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                      fontSize: 12.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          gradient:
                                                                              LinearGradient(
                                                                            colors: [
                                                                              Color(0x00960000),
                                                                              FlutterFlowTheme.of(context).primaryDark
                                                                            ],
                                                                            stops: [
                                                                              0.0,
                                                                              1.0
                                                                            ],
                                                                            begin:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            end:
                                                                                AlignmentDirectional(0, 1.0),
                                                                          ),
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 3.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.location_pin,
                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                size: 14.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              '${functions.getDistance(currentUserLocationValue, columnRestaurantsRecord.restLatLong)} mi.',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Lexend Deca',
                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                              child: FaIcon(
                                                                                FontAwesomeIcons.fire,
                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                size: 12.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              gridViewPostsRecord.likes!.toList().length.toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Lexend Deca',
                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    fontSize: 12.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                              if (gridViewPostsRecord
                                                                      .isFlagged ??
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .solidEyeSlash,
                                                                    color: Color(
                                                                        0xFF960000),
                                                                    size: 24.0,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  20.0,
                                                                  20.0,
                                                                  70.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'USER_PROFILE_PAGE_VIEW_ALL_BTN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Button_navigate_to');

                                                          context.pushNamed(
                                                            'postCollage',
                                                            queryParams: {
                                                              'user':
                                                                  serializeParam(
                                                                userProfileUsersRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'user':
                                                                  userProfileUsersRecord,
                                                            },
                                                          );
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '87v2092y' /* View all */,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 50.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) => Builder(
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
                                                        padding:
                                                            EdgeInsets.zero,
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                          crossAxisSpacing: 3.0,
                                                          mainAxisSpacing: 0.0,
                                                          childAspectRatio:
                                                              0.75,
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
                                                              final stackPostsRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Stack(
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'USER_PROFILE_PAGE_Image_l7r00bjj_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Image_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'singleVideoPage',
                                                                        queryParams:
                                                                            {
                                                                          'post':
                                                                              serializeParam(
                                                                            stackPostsRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <
                                                                            String,
                                                                            dynamic>{
                                                                          'post':
                                                                              stackPostsRecord,
                                                                        },
                                                                      );

                                                                      logFirebaseEvent(
                                                                          'Image_backend_call');

                                                                      final postsUpdateData =
                                                                          {
                                                                        'wacthed':
                                                                            FieldValue.increment(1),
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
                                                                          'Image_backend_call');

                                                                      final usersUpdateData =
                                                                          {
                                                                        'savedPosts':
                                                                            FieldValue.arrayRemove([
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
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        imageUrl:
                                                                            valueOrDefault<String>(
                                                                          stackPostsRecord
                                                                              .videoThumbnail,
                                                                          'http://colorly.app/wp-content/uploads/2021/08/OQaOKP_t20_g8wmld.jpg',
                                                                        ),
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
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
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                  StreamBuilder<
                                                                      RestaurantsRecord>(
                                                                    stream: RestaurantsRecord.getDocument(
                                                                        stackPostsRecord
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
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 1.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 3.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.store_mall_directory_rounded,
                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    size: 14.0,
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    columnRestaurantsRecord.restaurantName!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Lexend Deca',
                                                                                          color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                          fontSize: 12.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              gradient: LinearGradient(
                                                                                colors: [
                                                                                  Color(0x00960000),
                                                                                  FlutterFlowTheme.of(context).primaryDark
                                                                                ],
                                                                                stops: [
                                                                                  0.0,
                                                                                  1.0
                                                                                ],
                                                                                begin: AlignmentDirectional(0.0, -1.0),
                                                                                end: AlignmentDirectional(0, 1.0),
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 3.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.location_pin,
                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    size: 14.0,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  '${functions.getDistance(currentUserLocationValue, columnRestaurantsRecord.restLatLong)} mi.',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Lexend Deca',
                                                                                        color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.fire,
                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    size: 12.0,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    stackPostsRecord.likes!.toList().length.toString(),
                                                                                    '0',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Lexend Deca',
                                                                                        color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
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
                                                      .where(
                                                          'active',
                                                          isEqualTo: true)
                                                      .where(
                                                          'userSaved',
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
                                              List<DealsRecord>
                                                  listViewDealsRecordList =
                                                  snapshot.data!;
                                              if (listViewDealsRecordList
                                                  .isEmpty) {
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
                                                    listViewDealsRecordList
                                                        .length,
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
                                                      builder: (context) =>
                                                          Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        12.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'USER_PROFILE_Container_1yi3ygpz_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Container_bottom_sheet');
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
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
                                                                            800.0,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          3.0,
                                                                      color: Color(
                                                                          0x25000000),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          2.0),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          4.0,
                                                                          4.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            4.0,
                                                                        height:
                                                                            90.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          200.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            16.0,
                                                                            12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              listViewDealsRecord.title!,
                                                                              style: FlutterFlowTheme.of(context).title2.override(
                                                                                    fontFamily: 'Lexend Deca',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 22.0,
                                                                                    fontWeight: FontWeight.w800,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                listViewDealsRecord.details!.maybeHandleOverflow(
                                                                                  maxChars: 21,
                                                                                  replacement: '…',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'Until ${dateTimeFormat(
                                                                                  'MMMEd',
                                                                                  listViewDealsRecord.expiry,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                )}',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Color(0xFF874E00),
                                                                                      fontSize: 14.0,
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
                                                                          width:
                                                                              5.0,
                                                                          height:
                                                                              10.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              5.0,
                                                                          height:
                                                                              5.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              5.0,
                                                                          height:
                                                                              10.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              5.0,
                                                                          height:
                                                                              5.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              5.0,
                                                                          height:
                                                                              10.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              5.0,
                                                                          height:
                                                                              5.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              5.0,
                                                                          height:
                                                                              10.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              5.0,
                                                                          height:
                                                                              5.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              5.0,
                                                                          height:
                                                                              10.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              5.0,
                                                                          height:
                                                                              5.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              5.0,
                                                                          height:
                                                                              10.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              5.0,
                                                                          height:
                                                                              5.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              5.0,
                                                                          height:
                                                                              10.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
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
                                                                    1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          1.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
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
                                                                    0.6, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
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
                                                                  final circleImageRestaurantsRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Container(
                                                                    width: 60.0,
                                                                    height:
                                                                        60.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
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
            ));
      },
    );
  }
}
