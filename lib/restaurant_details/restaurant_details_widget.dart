import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_deal_widget.dart';
import '/components/add_menu_course_widget.dart';
import '/components/deal_popup_widget.dart';
import '/components/delivery_sheet_widget.dart';
import '/components/edit_deal_widget.dart';
import '/components/edit_menu_course_widget.dart';
import '/components/empty_reviews_widget.dart';
import '/components/hours_sheet_widget.dart';
import '/components/menu_sheet_widget.dart';
import '/components/no_deals_copy_widget.dart';
import '/components/no_menu_widget.dart';
import '/components/no_reviews_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'restaurant_details_model.dart';
export 'restaurant_details_model.dart';

class RestaurantDetailsWidget extends StatefulWidget {
  const RestaurantDetailsWidget({
    Key? key,
    this.restaurant,
    this.posts,
    this.user,
    this.menuitems,
    this.authUser,
    this.menuCourse,
    this.menuCourses,
    this.restaurantrec,
    this.integer,
    this.initialIndex,
  }) : super(key: key);

  final DocumentReference? restaurant;
  final PostsRecord? posts;
  final UsersRecord? user;
  final MenuItemRecord? menuitems;
  final DocumentReference? authUser;
  final MenuCourseRecord? menuCourse;
  final DocumentReference? menuCourses;
  final RestaurantsRecord? restaurantrec;
  final int? integer;
  final int? initialIndex;

  @override
  _RestaurantDetailsWidgetState createState() =>
      _RestaurantDetailsWidgetState();
}

class _RestaurantDetailsWidgetState extends State<RestaurantDetailsWidget>
    with TickerProviderStateMixin {
  late RestaurantDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestaurantDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'restaurantDetails'});
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

    return StreamBuilder<List<PostsRecord>>(
      stream: queryPostsRecord(
        queryBuilder: (postsRecord) =>
            postsRecord.where('rest_ref', isEqualTo: widget.restaurant),
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
        List<PostsRecord> restaurantDetailsPostsRecordList = snapshot.data!;
        return Title(
            title: 'restaurantDetails',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: SafeArea(
                child: StreamBuilder<RestaurantsRecord>(
                  stream: RestaurantsRecord.getDocument(widget.restaurant!),
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
                    final column1RestaurantsRecord = snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: StreamBuilder<UsersRecord>(
                            stream:
                                UsersRecord.getDocument(currentUserReference!),
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
                              final stackUsersRecord = snapshot.data!;
                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.99, -1.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        buttonSize: 48.0,
                                        icon: Icon(
                                          Icons.arrow_back_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'RESTAURANT_DETAILS_arrow_back_rounded_IC');
                                          logFirebaseEvent(
                                              'IconButton_navigate_back');
                                          context.pop();
                                        },
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -0.98),
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x00EEEEEE),
                                            ),
                                            child: ToggleIcon(
                                              onPressed: () async {
                                                final whoBookmarkedElement =
                                                    currentUserReference;
                                                final whoBookmarkedUpdate =
                                                    column1RestaurantsRecord
                                                            .whoBookmarked!
                                                            .toList()
                                                            .contains(
                                                                whoBookmarkedElement)
                                                        ? FieldValue
                                                            .arrayRemove([
                                                            whoBookmarkedElement
                                                          ])
                                                        : FieldValue
                                                            .arrayUnion([
                                                            whoBookmarkedElement
                                                          ]);
                                                final restaurantsUpdateData = {
                                                  'whoBookmarked':
                                                      whoBookmarkedUpdate,
                                                };
                                                await column1RestaurantsRecord
                                                    .reference
                                                    .update(
                                                        restaurantsUpdateData);
                                              },
                                              value: column1RestaurantsRecord
                                                  .whoBookmarked!
                                                  .toList()
                                                  .contains(
                                                      currentUserReference),
                                              onIcon: Icon(
                                                Icons.book,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 22.0,
                                              ),
                                              offIcon: Icon(
                                                Icons.book,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 22.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 800.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: DefaultTabController(
                                        length: 4,
                                        initialIndex: 0,
                                        child: Column(
                                          children: [
                                            TabBar(
                                              isScrollable: true,
                                              labelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              unselectedLabelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              labelStyle: GoogleFonts.getFont(
                                                'Roboto',
                                                fontWeight: FontWeight.w600,
                                              ),
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              indicatorWeight: 4.0,
                                              tabs: [
                                                Tab(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '806bg15c' /* About */,
                                                  ),
                                                ),
                                                Tab(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '2qhir7v3' /* Reviews */,
                                                  ),
                                                ),
                                                Tab(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'omqeuiy7' /* Menu */,
                                                  ),
                                                ),
                                                Tab(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '83amgoty' /* Deals */,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                children: [
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
                                                        Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        250.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final gallery2 =
                                                                        column1RestaurantsRecord
                                                                            .gallery!
                                                                            .toList();
                                                                    return SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            gallery2.length,
                                                                            (gallery2Index) {
                                                                          final gallery2Item =
                                                                              gallery2[gallery2Index];
                                                                          return InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('RESTAURANT_DETAILS_MediaDisplay_m8jk4cww');
                                                                              logFirebaseEvent('MediaDisplay_navigate_to');

                                                                              context.pushNamed(
                                                                                'gallery',
                                                                                queryParams: {
                                                                                  'restaurant': serializeParam(
                                                                                    column1RestaurantsRecord,
                                                                                    ParamType.Document,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  'restaurant': column1RestaurantsRecord,
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                FlutterFlowMediaDisplay(
                                                                              path: valueOrDefault<String>(
                                                                                gallery2Item,
                                                                                'https://images.wsj.net/im-581988/M',
                                                                              ),
                                                                              imageBuilder: (path) => CachedNetworkImage(
                                                                                imageUrl: path,
                                                                                width: MediaQuery.of(context).size.width * 1.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                              videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                path: path,
                                                                                width: 300.0,
                                                                                autoPlay: false,
                                                                                looping: false,
                                                                                showControls: true,
                                                                                allowFullScreen: true,
                                                                                allowPlaybackSpeedMenu: false,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -0.95),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xC0E5831D),
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                            child:
                                                                                ClipRRect(
                                                                              child: BackdropFilter(
                                                                                filter: ImageFilter.blur(
                                                                                  sigmaX: 1.0,
                                                                                  sigmaY: 1.0,
                                                                                ),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('RESTAURANT_DETAILS_Icon_cv2p5kik_ON_TAP');
                                                                                    logFirebaseEvent('Icon_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'submitReviewPage',
                                                                                      queryParams: {
                                                                                        'restaurant': serializeParam(
                                                                                          column1RestaurantsRecord,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'restaurant': column1RestaurantsRecord,
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.video_call_rounded,
                                                                                    color: Colors.white,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('RESTAURANT_DETAILS_Container_psntyci9_ON');
                                                                              logFirebaseEvent('Container_bottom_sheet');
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: Container(
                                                                                      height: 280.0,
                                                                                      child: HoursSheetWidget(
                                                                                        restaurant: column1RestaurantsRecord,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 40.0,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xBFE5831D),
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: ClipRRect(
                                                                                  child: BackdropFilter(
                                                                                    filter: ImageFilter.blur(
                                                                                      sigmaX: 1.0,
                                                                                      sigmaY: 1.0,
                                                                                    ),
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.solidClock,
                                                                                      color: Colors.white,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Builder(
                                                                            builder: (context) =>
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('RESTAURANT_DETAILS_Container_soqcv1dh_ON');
                                                                                  logFirebaseEvent('Container_generate_current_page_link');
                                                                                  _model.currentPageLink = await generateCurrentPageLink(
                                                                                    context,
                                                                                    title: column1RestaurantsRecord.restaurantName,
                                                                                    imageUrl: column1RestaurantsRecord.featuredImage,
                                                                                    description: 'Check out this restaurant in the Colorly App',
                                                                                  );

                                                                                  logFirebaseEvent('Container_share');
                                                                                  await Share.share(
                                                                                    _model.currentPageLink,
                                                                                    sharePositionOrigin: getWidgetBoundingBox(context),
                                                                                  );
                                                                                },
                                                                                child: Container(
                                                                                  width: 40.0,
                                                                                  height: 40.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xBFE5831D),
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: ClipRRect(
                                                                                      child: BackdropFilter(
                                                                                        filter: ImageFilter.blur(
                                                                                          sigmaX: 1.0,
                                                                                          sigmaY: 1.0,
                                                                                        ),
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.solidShareSquare,
                                                                                          color: Colors.white,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('RESTAURANT_DETAILS_Container_m6q8dlpu_ON');
                                                                                logFirebaseEvent('Container_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: Container(
                                                                                        height: 370.0,
                                                                                        child: MenuSheetWidget(
                                                                                          restaurant: column1RestaurantsRecord,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              },
                                                                              child: Container(
                                                                                width: 40.0,
                                                                                height: 40.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xBFE5831D),
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: ClipRRect(
                                                                                    child: BackdropFilter(
                                                                                      filter: ImageFilter.blur(
                                                                                        sigmaX: 1.0,
                                                                                        sigmaY: 1.0,
                                                                                      ),
                                                                                      child: FaIcon(
                                                                                        FontAwesomeIcons.ellipsisH,
                                                                                        color: Colors.white,
                                                                                        size: 26.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            60.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(30.0),
                                                                          topRight:
                                                                              Radius.circular(30.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          color:
                                                                              Color(0x00000000),
                                                                          child:
                                                                              ExpandableNotifier(
                                                                            initialExpanded:
                                                                                false,
                                                                            child:
                                                                                ExpandablePanel(
                                                                              header: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                child: AutoSizeText(
                                                                                  column1RestaurantsRecord.restaurantName!,
                                                                                  style: FlutterFlowTheme.of(context).title1.override(
                                                                                        fontFamily: 'Lexend Deca',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              collapsed: Container(
                                                                                width: MediaQuery.of(context).size.width * 1.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(0.0),
                                                                                      topLeft: Radius.circular(30.0),
                                                                                      topRight: Radius.circular(30.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Stack(
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 50.0,
                                                                                                    height: 50.0,
                                                                                                    clipBehavior: Clip.antiAlias,
                                                                                                    decoration: BoxDecoration(
                                                                                                      shape: BoxShape.circle,
                                                                                                    ),
                                                                                                    child: CachedNetworkImage(
                                                                                                      imageUrl: valueOrDefault<String>(
                                                                                                        column1RestaurantsRecord.logo,
                                                                                                        'https://images.wsj.net/im-581988/M',
                                                                                                      ),
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-0.36, 0.75),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                      child: Icon(
                                                                                                        Icons.verified_rounded,
                                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                        size: 16.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                      child: Container(
                                                                                                        width: 70.0,
                                                                                                        height: 50.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: valueOrDefault<Color>(
                                                                                                            () {
                                                                                                              if (FFAppState().excellent.contains(functions.getAverageRatingCopy(restaurantDetailsPostsRecordList
                                                                                                                  .map((e) => valueOrDefault<double>(
                                                                                                                        e.userRating,
                                                                                                                        1.0,
                                                                                                                      ))
                                                                                                                  .toList()))) {
                                                                                                                return Color(0xFF3FDF86);
                                                                                                              } else if (FFAppState().good.contains(functions.getAverageRatingCopy(restaurantDetailsPostsRecordList
                                                                                                                  .map((e) => valueOrDefault<double>(
                                                                                                                        e.userRating,
                                                                                                                        1.0,
                                                                                                                      ))
                                                                                                                  .toList()))) {
                                                                                                                return Color(0xFFC3DF3F);
                                                                                                              } else if (FFAppState().average.contains(functions.getAverageRatingCopy(restaurantDetailsPostsRecordList
                                                                                                                  .map((e) => valueOrDefault<double>(
                                                                                                                        e.userRating,
                                                                                                                        1.0,
                                                                                                                      ))
                                                                                                                  .toList()))) {
                                                                                                                return Color(0xFFDFCB3F);
                                                                                                              } else if (FFAppState().bad.contains(functions.getAverageRatingCopy(restaurantDetailsPostsRecordList
                                                                                                                  .map((e) => valueOrDefault<double>(
                                                                                                                        e.userRating,
                                                                                                                        1.0,
                                                                                                                      ))
                                                                                                                  .toList()))) {
                                                                                                                return Color(0xFFDF993F);
                                                                                                              } else if (FFAppState().horrible.contains(functions.getAverageRatingCopy(restaurantDetailsPostsRecordList
                                                                                                                  .map((e) => valueOrDefault<double>(
                                                                                                                        e.userRating,
                                                                                                                        1.0,
                                                                                                                      ))
                                                                                                                  .toList()))) {
                                                                                                                return Color(0xFFDF5A3F);
                                                                                                              } else {
                                                                                                                return FlutterFlowTheme.of(context).secondaryBackground;
                                                                                                              }
                                                                                                            }(),
                                                                                                            Color(0x8E95A1AC),
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                        ),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              functions.getAverageRating(restaurantDetailsPostsRecordList.toList()),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 20.0,
                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'p0os1vf1' /* Avg. rating */,
                                                                                                              ),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                                    color: Color(0xFFB3B3B3),
                                                                                                                    fontSize: 8.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                      child: Container(
                                                                                                        width: 70.0,
                                                                                                        height: 50.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                        ),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              column1RestaurantsRecord.reviews!.toString(),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 20.0,
                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'sl4yi2xt' /* Reviews */,
                                                                                                              ),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                                    color: Color(0xFFB3B3B3),
                                                                                                                    fontSize: 8.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                      child: Container(
                                                                                                        width: 70.0,
                                                                                                        height: 50.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                        ),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              column1RestaurantsRecord.priceRange!,
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                                    color: Color(0xFF3FDF86),
                                                                                                                    fontSize: 18.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                '7x8qss8l' /* Price */,
                                                                                                              ),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                                    color: Color(0xFFB3B3B3),
                                                                                                                    fontSize: 8.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
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
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Text(
                                                                                                column1RestaurantsRecord.restAddress!,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 18.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                        child: Wrap(
                                                                                          spacing: 0.0,
                                                                                          runSpacing: 0.0,
                                                                                          alignment: WrapAlignment.start,
                                                                                          crossAxisAlignment: WrapCrossAlignment.start,
                                                                                          direction: Axis.horizontal,
                                                                                          runAlignment: WrapAlignment.start,
                                                                                          verticalDirection: VerticalDirection.down,
                                                                                          clipBehavior: Clip.none,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        column1RestaurantsRecord.categories!,
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                              color: Color(0xFFB32A2A),
                                                                                                              fontSize: 16.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 5.0),
                                                                                        child: Container(
                                                                                          width: MediaQuery.of(context).size.width * 1.0,
                                                                                          height: 70.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    buttonSize: 48.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.phone_enabled,
                                                                                                      color: Colors.orange,
                                                                                                      size: 30.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      logFirebaseEvent('RESTAURANT_DETAILS_phone_enabled_ICN_ON_');
                                                                                                      logFirebaseEvent('IconButton_backend_call');

                                                                                                      final restaurantsUpdateData = {
                                                                                                        'phoneClicks': FieldValue.increment(1),
                                                                                                      };
                                                                                                      await column1RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                      logFirebaseEvent('IconButton_call_number');
                                                                                                      await launchUrl(Uri(
                                                                                                        scheme: 'tel',
                                                                                                        path: column1RestaurantsRecord.phoneNumber!,
                                                                                                      ));
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    buttonSize: 48.0,
                                                                                                    icon: FaIcon(
                                                                                                      FontAwesomeIcons.mapMarkedAlt,
                                                                                                      color: Colors.orange,
                                                                                                      size: 30.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      logFirebaseEvent('RESTAURANT_DETAILS_mapMarkedAlt_ICN_ON_T');
                                                                                                      logFirebaseEvent('IconButton_backend_call');

                                                                                                      final restaurantsUpdateData = {
                                                                                                        'mapClicks': FieldValue.increment(1),
                                                                                                      };
                                                                                                      await column1RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                      logFirebaseEvent('IconButton_launch_map');
                                                                                                      await launchMap(
                                                                                                        location: column1RestaurantsRecord.restLatLong,
                                                                                                        title: column1RestaurantsRecord.restaurantName!,
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    buttonSize: 48.0,
                                                                                                    icon: FaIcon(
                                                                                                      FontAwesomeIcons.globe,
                                                                                                      color: Colors.orange,
                                                                                                      size: 30.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      logFirebaseEvent('RESTAURANT_DETAILS_PAGE_globe_ICN_ON_TAP');
                                                                                                      logFirebaseEvent('IconButton_backend_call');

                                                                                                      final restaurantsUpdateData = {
                                                                                                        'websiteClicks': FieldValue.increment(1),
                                                                                                      };
                                                                                                      await column1RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                      logFirebaseEvent('IconButton_launch_u_r_l');
                                                                                                      await launchURL(column1RestaurantsRecord.website!);
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              if (column1RestaurantsRecord.isSubscribed ?? true)
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderRadius: 30.0,
                                                                                                      buttonSize: 48.0,
                                                                                                      icon: Icon(
                                                                                                        Icons.ondemand_video_rounded,
                                                                                                        color: Colors.orange,
                                                                                                        size: 30.0,
                                                                                                      ),
                                                                                                      onPressed: () async {
                                                                                                        logFirebaseEvent('RESTAURANT_DETAILS_ondemand_video_rounde');
                                                                                                        logFirebaseEvent('IconButton_navigate_to');

                                                                                                        context.pushNamed(
                                                                                                          'videoTour',
                                                                                                          queryParams: {
                                                                                                            'restaurant': serializeParam(
                                                                                                              column1RestaurantsRecord,
                                                                                                              ParamType.Document,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                          extra: <String, dynamic>{
                                                                                                            'restaurant': column1RestaurantsRecord,
                                                                                                          },
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              if (column1RestaurantsRecord.isSubscribed ?? true)
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderRadius: 30.0,
                                                                                                      borderWidth: 1.0,
                                                                                                      buttonSize: 60.0,
                                                                                                      icon: Icon(
                                                                                                        Icons.fastfood_rounded,
                                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                        size: 34.0,
                                                                                                      ),
                                                                                                      onPressed: () async {
                                                                                                        logFirebaseEvent('RESTAURANT_DETAILS_fastfood_rounded_ICN_');
                                                                                                        logFirebaseEvent('IconButton_backend_call');

                                                                                                        final restaurantsUpdateData = {
                                                                                                          'orderNowClicks': FieldValue.increment(1),
                                                                                                        };
                                                                                                        await column1RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                        logFirebaseEvent('IconButton_bottom_sheet');
                                                                                                        await showModalBottomSheet(
                                                                                                          isScrollControlled: true,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          context: context,
                                                                                                          builder: (context) {
                                                                                                            return Padding(
                                                                                                              padding: MediaQuery.of(context).viewInsets,
                                                                                                              child: Container(
                                                                                                                height: 400.0,
                                                                                                                child: DeliverySheetWidget(
                                                                                                                  restaurant: column1RestaurantsRecord,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ).then((value) => setState(() {}));
                                                                                                      },
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              expanded: Container(
                                                                                width: MediaQuery.of(context).size.width * 1.0,
                                                                                height: MediaQuery.of(context).size.height * 0.7,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: SingleChildScrollView(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(0.0),
                                                                                            bottomRight: Radius.circular(0.0),
                                                                                            topLeft: Radius.circular(30.0),
                                                                                            topRight: Radius.circular(30.0),
                                                                                          ),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(0.0),
                                                                                                  bottomRight: Radius.circular(0.0),
                                                                                                  topLeft: Radius.circular(30.0),
                                                                                                  topRight: Radius.circular(30.0),
                                                                                                ),
                                                                                              ),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Stack(
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: 50.0,
                                                                                                                height: 50.0,
                                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  shape: BoxShape.circle,
                                                                                                                ),
                                                                                                                child: CachedNetworkImage(
                                                                                                                  imageUrl: valueOrDefault<String>(
                                                                                                                    column1RestaurantsRecord.logo,
                                                                                                                    'https://images.wsj.net/im-581988/M',
                                                                                                                  ),
                                                                                                                  fit: BoxFit.cover,
                                                                                                                ),
                                                                                                              ),
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(-0.36, 0.75),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Icon(
                                                                                                                    Icons.verified_rounded,
                                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                    size: 16.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Container(
                                                                                                                    width: 70.0,
                                                                                                                    height: 50.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: valueOrDefault<Color>(
                                                                                                                        () {
                                                                                                                          if (FFAppState().excellent.contains(functions.getAverageRatingCopy(restaurantDetailsPostsRecordList
                                                                                                                              .map((e) => valueOrDefault<double>(
                                                                                                                                    e.userRating,
                                                                                                                                    1.0,
                                                                                                                                  ))
                                                                                                                              .toList()))) {
                                                                                                                            return Color(0xFF3FDF86);
                                                                                                                          } else if (FFAppState().good.contains(functions.getAverageRatingCopy(restaurantDetailsPostsRecordList
                                                                                                                              .map((e) => valueOrDefault<double>(
                                                                                                                                    e.userRating,
                                                                                                                                    1.0,
                                                                                                                                  ))
                                                                                                                              .toList()))) {
                                                                                                                            return Color(0xFFC3DF3F);
                                                                                                                          } else if (FFAppState().average.contains(functions.getAverageRatingCopy(restaurantDetailsPostsRecordList
                                                                                                                              .map((e) => valueOrDefault<double>(
                                                                                                                                    e.userRating,
                                                                                                                                    1.0,
                                                                                                                                  ))
                                                                                                                              .toList()))) {
                                                                                                                            return Color(0xFFDFCB3F);
                                                                                                                          } else if (FFAppState().bad.contains(functions.getAverageRatingCopy(restaurantDetailsPostsRecordList
                                                                                                                              .map((e) => valueOrDefault<double>(
                                                                                                                                    e.userRating,
                                                                                                                                    1.0,
                                                                                                                                  ))
                                                                                                                              .toList()))) {
                                                                                                                            return Color(0xFFDF993F);
                                                                                                                          } else if (FFAppState().horrible.contains(functions.getAverageRatingCopy(restaurantDetailsPostsRecordList
                                                                                                                              .map((e) => valueOrDefault<double>(
                                                                                                                                    e.userRating,
                                                                                                                                    1.0,
                                                                                                                                  ))
                                                                                                                              .toList()))) {
                                                                                                                            return Color(0xFFDF5A3F);
                                                                                                                          } else {
                                                                                                                            return FlutterFlowTheme.of(context).secondaryBackground;
                                                                                                                          }
                                                                                                                        }(),
                                                                                                                        Color(0x8E95A1AC),
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                                                    ),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          functions.getAverageRating(restaurantDetailsPostsRecordList.toList()),
                                                                                                                          textAlign: TextAlign.center,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                fontFamily: 'Lexend Deca',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 20.0,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'weu9n3rc' /* Avg. rating */,
                                                                                                                          ),
                                                                                                                          textAlign: TextAlign.center,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                fontFamily: 'Lexend Deca',
                                                                                                                                color: Color(0xFFB3B3B3),
                                                                                                                                fontSize: 8.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Container(
                                                                                                                    width: 70.0,
                                                                                                                    height: 50.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                                                    ),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          column1RestaurantsRecord.reviews!.toString(),
                                                                                                                          textAlign: TextAlign.center,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                fontFamily: 'Lexend Deca',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                fontSize: 20.0,
                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'rcrs3v8k' /* Reviews */,
                                                                                                                          ),
                                                                                                                          textAlign: TextAlign.center,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                fontFamily: 'Lexend Deca',
                                                                                                                                color: Color(0xFFB3B3B3),
                                                                                                                                fontSize: 8.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Container(
                                                                                                                    width: 70.0,
                                                                                                                    height: 50.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                                                    ),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          column1RestaurantsRecord.priceRange!,
                                                                                                                          textAlign: TextAlign.center,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                fontFamily: 'Lexend Deca',
                                                                                                                                color: Color(0xFF3FDF86),
                                                                                                                                fontSize: 18.0,
                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '9qor34u4' /* Price */,
                                                                                                                          ),
                                                                                                                          textAlign: TextAlign.center,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                fontFamily: 'Lexend Deca',
                                                                                                                                color: Color(0xFFB3B3B3),
                                                                                                                                fontSize: 8.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ],
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
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Text(
                                                                                                            column1RestaurantsRecord.restAddress!,
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 18.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                    child: Wrap(
                                                                                                      spacing: 0.0,
                                                                                                      runSpacing: 0.0,
                                                                                                      alignment: WrapAlignment.start,
                                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                      direction: Axis.horizontal,
                                                                                                      runAlignment: WrapAlignment.start,
                                                                                                      verticalDirection: VerticalDirection.down,
                                                                                                      clipBehavior: Clip.none,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    column1RestaurantsRecord.categories!,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                                          color: Color(0xFFB32A2A),
                                                                                                                          fontSize: 16.0,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 5.0),
                                                                                                    child: Container(
                                                                                                      width: MediaQuery.of(context).size.width * 1.0,
                                                                                                      height: 70.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                                      ),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                        children: [
                                                                                                          Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              FlutterFlowIconButton(
                                                                                                                borderColor: Colors.transparent,
                                                                                                                borderRadius: 30.0,
                                                                                                                buttonSize: 48.0,
                                                                                                                icon: Icon(
                                                                                                                  Icons.phone_enabled,
                                                                                                                  color: Colors.orange,
                                                                                                                  size: 30.0,
                                                                                                                ),
                                                                                                                onPressed: () async {
                                                                                                                  logFirebaseEvent('RESTAURANT_DETAILS_phone_enabled_ICN_ON_');
                                                                                                                  logFirebaseEvent('IconButton_backend_call');

                                                                                                                  final restaurantsUpdateData = {
                                                                                                                    'phoneClicks': FieldValue.increment(1),
                                                                                                                  };
                                                                                                                  await column1RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                                  logFirebaseEvent('IconButton_call_number');
                                                                                                                  await launchUrl(Uri(
                                                                                                                    scheme: 'tel',
                                                                                                                    path: column1RestaurantsRecord.phoneNumber!,
                                                                                                                  ));
                                                                                                                },
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                          Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              FlutterFlowIconButton(
                                                                                                                borderColor: Colors.transparent,
                                                                                                                borderRadius: 30.0,
                                                                                                                buttonSize: 48.0,
                                                                                                                icon: FaIcon(
                                                                                                                  FontAwesomeIcons.mapMarkedAlt,
                                                                                                                  color: Colors.orange,
                                                                                                                  size: 30.0,
                                                                                                                ),
                                                                                                                onPressed: () async {
                                                                                                                  logFirebaseEvent('RESTAURANT_DETAILS_mapMarkedAlt_ICN_ON_T');
                                                                                                                  logFirebaseEvent('IconButton_backend_call');

                                                                                                                  final restaurantsUpdateData = {
                                                                                                                    'mapClicks': FieldValue.increment(1),
                                                                                                                  };
                                                                                                                  await column1RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                                  logFirebaseEvent('IconButton_launch_map');
                                                                                                                  await launchMap(
                                                                                                                    location: column1RestaurantsRecord.restLatLong,
                                                                                                                    title: column1RestaurantsRecord.restaurantName!,
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                          Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              FlutterFlowIconButton(
                                                                                                                borderColor: Colors.transparent,
                                                                                                                borderRadius: 30.0,
                                                                                                                buttonSize: 48.0,
                                                                                                                icon: FaIcon(
                                                                                                                  FontAwesomeIcons.globe,
                                                                                                                  color: Colors.orange,
                                                                                                                  size: 30.0,
                                                                                                                ),
                                                                                                                onPressed: () async {
                                                                                                                  logFirebaseEvent('RESTAURANT_DETAILS_PAGE_globe_ICN_ON_TAP');
                                                                                                                  logFirebaseEvent('IconButton_backend_call');

                                                                                                                  final restaurantsUpdateData = {
                                                                                                                    'websiteClicks': FieldValue.increment(1),
                                                                                                                  };
                                                                                                                  await column1RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                                  logFirebaseEvent('IconButton_launch_u_r_l');
                                                                                                                  await launchURL(column1RestaurantsRecord.website!);
                                                                                                                },
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                          if (column1RestaurantsRecord.isSubscribed ?? true)
                                                                                                            Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              children: [
                                                                                                                FlutterFlowIconButton(
                                                                                                                  borderColor: Colors.transparent,
                                                                                                                  borderRadius: 30.0,
                                                                                                                  buttonSize: 48.0,
                                                                                                                  icon: Icon(
                                                                                                                    Icons.ondemand_video_rounded,
                                                                                                                    color: Colors.orange,
                                                                                                                    size: 30.0,
                                                                                                                  ),
                                                                                                                  onPressed: () async {
                                                                                                                    logFirebaseEvent('RESTAURANT_DETAILS_ondemand_video_rounde');
                                                                                                                    logFirebaseEvent('IconButton_navigate_to');

                                                                                                                    context.pushNamed(
                                                                                                                      'videoTour',
                                                                                                                      queryParams: {
                                                                                                                        'restaurant': serializeParam(
                                                                                                                          column1RestaurantsRecord,
                                                                                                                          ParamType.Document,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        'restaurant': column1RestaurantsRecord,
                                                                                                                      },
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          if (column1RestaurantsRecord.isSubscribed ?? true)
                                                                                                            Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              children: [
                                                                                                                FlutterFlowIconButton(
                                                                                                                  borderColor: Colors.transparent,
                                                                                                                  borderRadius: 30.0,
                                                                                                                  borderWidth: 1.0,
                                                                                                                  buttonSize: 60.0,
                                                                                                                  icon: Icon(
                                                                                                                    Icons.fastfood_rounded,
                                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                    size: 34.0,
                                                                                                                  ),
                                                                                                                  onPressed: () async {
                                                                                                                    logFirebaseEvent('RESTAURANT_DETAILS_fastfood_rounded_ICN_');
                                                                                                                    logFirebaseEvent('IconButton_backend_call');

                                                                                                                    final restaurantsUpdateData = {
                                                                                                                      'orderNowClicks': FieldValue.increment(1),
                                                                                                                    };
                                                                                                                    await column1RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                                    logFirebaseEvent('IconButton_bottom_sheet');
                                                                                                                    await showModalBottomSheet(
                                                                                                                      isScrollControlled: true,
                                                                                                                      backgroundColor: Colors.transparent,
                                                                                                                      context: context,
                                                                                                                      builder: (context) {
                                                                                                                        return Padding(
                                                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                                                          child: Container(
                                                                                                                            height: 400.0,
                                                                                                                            child: DeliverySheetWidget(
                                                                                                                              restaurant: column1RestaurantsRecord,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ).then((value) => setState(() {}));
                                                                                                                  },
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              '9p249uxe' /* Stories */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 14.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                                    child: Container(
                                                                                                      width: MediaQuery.of(context).size.width * 1.0,
                                                                                                      height: 80.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                                      ),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: StreamBuilder<List<StoriesRecord>>(
                                                                                                        stream: queryStoriesRecord(
                                                                                                          queryBuilder: (storiesRecord) => storiesRecord.where('rest_ref', isEqualTo: column1RestaurantsRecord.reference).orderBy('created_time', descending: true),
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
                                                                                                          List<StoriesRecord> listViewStoriesRecordList = snapshot.data!;
                                                                                                          if (listViewStoriesRecordList.isEmpty) {
                                                                                                            return Center(
                                                                                                              child: Image.asset(
                                                                                                                'assets/images/no_stories_white.png',
                                                                                                              ),
                                                                                                            );
                                                                                                          }
                                                                                                          return ListView.builder(
                                                                                                            padding: EdgeInsets.zero,
                                                                                                            scrollDirection: Axis.horizontal,
                                                                                                            itemCount: listViewStoriesRecordList.length,
                                                                                                            itemBuilder: (context, listViewIndex) {
                                                                                                              final listViewStoriesRecord = listViewStoriesRecordList[listViewIndex];
                                                                                                              return Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                child: StreamBuilder<RestaurantsRecord>(
                                                                                                                  stream: RestaurantsRecord.getDocument(column1RestaurantsRecord.reference),
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
                                                                                                                    final columnRestaurantsRecord = snapshot.data!;
                                                                                                                    return InkWell(
                                                                                                                      onTap: () async {
                                                                                                                        logFirebaseEvent('RESTAURANT_DETAILS_Column_xoz5h159_ON_TA');
                                                                                                                        logFirebaseEvent('Column_navigate_to');

                                                                                                                        context.pushNamed(
                                                                                                                          'storyDetailsCopy',
                                                                                                                          queryParams: {
                                                                                                                            'initialStoryIndex': serializeParam(
                                                                                                                              listViewIndex,
                                                                                                                              ParamType.int,
                                                                                                                            ),
                                                                                                                            'restaurant': serializeParam(
                                                                                                                              columnRestaurantsRecord,
                                                                                                                              ParamType.Document,
                                                                                                                            ),
                                                                                                                          }.withoutNulls,
                                                                                                                          extra: <String, dynamic>{
                                                                                                                            'restaurant': columnRestaurantsRecord,
                                                                                                                            kTransitionInfoKey: TransitionInfo(
                                                                                                                              hasTransition: true,
                                                                                                                              transitionType: PageTransitionType.bottomToTop,
                                                                                                                              duration: Duration(milliseconds: 200),
                                                                                                                            ),
                                                                                                                          },
                                                                                                                        );

                                                                                                                        logFirebaseEvent('Column_backend_call');

                                                                                                                        final restaurantsUpdateData = {
                                                                                                                          'storyClicks': FieldValue.increment(1),
                                                                                                                        };
                                                                                                                        await columnRestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                                      },
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 50.0,
                                                                                                                            height: 50.0,
                                                                                                                            clipBehavior: Clip.antiAlias,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              shape: BoxShape.circle,
                                                                                                                            ),
                                                                                                                            child: CachedNetworkImage(
                                                                                                                              imageUrl: columnRestaurantsRecord.logo!,
                                                                                                                              fit: BoxFit.cover,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            columnRestaurantsRecord.restaurantName!.maybeHandleOverflow(
                                                                                                                              maxChars: 12,
                                                                                                                              replacement: '…',
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  fontSize: 10.0,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'tnkbg3gf' /* About */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 14.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 15.0),
                                                                                                    child: ListView(
                                                                                                      padding: EdgeInsets.zero,
                                                                                                      primary: false,
                                                                                                      shrinkWrap: true,
                                                                                                      scrollDirection: Axis.vertical,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                    child: Container(
                                                                                                                      width: double.infinity,
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                                            child: Text(
                                                                                                                              column1RestaurantsRecord.restSlogan!,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 22.0,
                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Divider(
                                                                                                                            thickness: 3.0,
                                                                                                                            endIndent: 150.0,
                                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 15.0),
                                                                                                                            child: Text(
                                                                                                                              column1RestaurantsRecord.restDescription!,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 12.0,
                                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          if (column1RestaurantsRecord.featuredImage != null && column1RestaurantsRecord.featuredImage != '')
                                                                                                                            FlutterFlowMediaDisplay(
                                                                                                                              path: column1RestaurantsRecord.featuredImage!,
                                                                                                                              imageBuilder: (path) => ClipRRect(
                                                                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                                                                child: Image.network(
                                                                                                                                  path,
                                                                                                                                  width: MediaQuery.of(context).size.width * 1.0,
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                                                                path: path,
                                                                                                                                width: MediaQuery.of(context).size.width * 1.0,
                                                                                                                                autoPlay: false,
                                                                                                                                looping: false,
                                                                                                                                showControls: true,
                                                                                                                                allowFullScreen: true,
                                                                                                                                allowPlaybackSpeedMenu: false,
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
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 5.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'lsgozxjc' /* Location */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 14.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                                            ),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                  child: ClipRRect(
                                                                                                                    child: Container(
                                                                                                                      width: double.infinity,
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: ClipRRect(
                                                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                                                        child: Container(
                                                                                                                          height: 200.0,
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                                                          ),
                                                                                                                          child: Builder(builder: (context) {
                                                                                                                            final _googleMapMarker = column1RestaurantsRecord;
                                                                                                                            return FlutterFlowGoogleMap(
                                                                                                                              controller: _model.googleMapsController,
                                                                                                                              onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                                                                                                                              initialLocation: _model.googleMapsCenter ??= column1RestaurantsRecord.restLatLong!,
                                                                                                                              markers: [
                                                                                                                                FlutterFlowMarker(
                                                                                                                                  _googleMapMarker.reference.path,
                                                                                                                                  _googleMapMarker.restLatLong!,
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                              markerColor: GoogleMarkerColor.violet,
                                                                                                                              mapType: MapType.normal,
                                                                                                                              style: GoogleMapStyle.standard,
                                                                                                                              initialZoom: 14.0,
                                                                                                                              allowInteraction: true,
                                                                                                                              allowZoom: true,
                                                                                                                              showZoomControls: true,
                                                                                                                              showLocation: true,
                                                                                                                              showCompass: false,
                                                                                                                              showMapToolbar: false,
                                                                                                                              showTraffic: true,
                                                                                                                              centerMapOnMarkerTap: true,
                                                                                                                            );
                                                                                                                          }),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        if (!column1RestaurantsRecord.isSubscribed!)
                                                                                                          Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'r55m03jp' /* Recommended */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                            fontFamily: 'Lexend Deca',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            fontSize: 16.0,
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                              AuthUserStreamWidget(
                                                                                                                builder: (context) => StreamBuilder<AddNumberRecord>(
                                                                                                                  stream: AddNumberRecord.getDocument(currentUserDocument!.addNumberRef!),
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
                                                                                                                    final rowAddNumberRecord = snapshot.data!;
                                                                                                                    return Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        StreamBuilder<List<RestaurantsRecord>>(
                                                                                                                          stream: queryRestaurantsRecord(
                                                                                                                            queryBuilder: (restaurantsRecord) => restaurantsRecord.where('hasAdNumber', isEqualTo: true).where('adNumber', isEqualTo: rowAddNumberRecord.count),
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
                                                                                                                            List<RestaurantsRecord> rowRestaurantsRecordList = snapshot.data!;
                                                                                                                            return SingleChildScrollView(
                                                                                                                              scrollDirection: Axis.horizontal,
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                children: List.generate(rowRestaurantsRecordList.length, (rowIndex) {
                                                                                                                                  final rowRestaurantsRecord = rowRestaurantsRecordList[rowIndex];
                                                                                                                                  return Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 10.0),
                                                                                                                                    child: StreamBuilder<AddNumberRecord>(
                                                                                                                                      stream: AddNumberRecord.getDocument(rowAddNumberRecord.reference),
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
                                                                                                                                        final containerAddNumberRecord = snapshot.data!;
                                                                                                                                        return Container(
                                                                                                                                          width: MediaQuery.of(context).size.width * 0.9,
                                                                                                                                          decoration: BoxDecoration(),
                                                                                                                                          child: Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                                                                            child: StreamBuilder<RestaurantsRecord>(
                                                                                                                                              stream: RestaurantsRecord.getDocument(rowRestaurantsRecord.reference),
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
                                                                                                                                                final storeListView3RestaurantsRecord = snapshot.data!;
                                                                                                                                                return Row(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                  children: [
                                                                                                                                                    Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                                                      child: Material(
                                                                                                                                                        color: Colors.transparent,
                                                                                                                                                        elevation: 4.0,
                                                                                                                                                        shape: RoundedRectangleBorder(
                                                                                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                                                                                        ),
                                                                                                                                                        child: Container(
                                                                                                                                                          width: MediaQuery.of(context).size.width * 0.9,
                                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                            boxShadow: [
                                                                                                                                                              BoxShadow(
                                                                                                                                                                color: FlutterFlowTheme.of(context).primaryDark,
                                                                                                                                                              )
                                                                                                                                                            ],
                                                                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                                                                          ),
                                                                                                                                                          child: Column(
                                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                                            children: [
                                                                                                                                                              InkWell(
                                                                                                                                                                onTap: () async {
                                                                                                                                                                  logFirebaseEvent('RESTAURANT_DETAILS_Container_hnia2qss_ON');
                                                                                                                                                                  logFirebaseEvent('Container_backend_call');

                                                                                                                                                                  final restaurantsUpdateData = {
                                                                                                                                                                    'cardClicks': FieldValue.increment(1),
                                                                                                                                                                  };
                                                                                                                                                                  await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                                                                                  logFirebaseEvent('Container_navigate_to');

                                                                                                                                                                  context.pushNamed(
                                                                                                                                                                    'restaurantDetails',
                                                                                                                                                                    queryParams: {
                                                                                                                                                                      'restaurant': serializeParam(
                                                                                                                                                                        storeListView3RestaurantsRecord.reference,
                                                                                                                                                                        ParamType.DocumentReference,
                                                                                                                                                                      ),
                                                                                                                                                                    }.withoutNulls,
                                                                                                                                                                  );
                                                                                                                                                                },
                                                                                                                                                                child: Material(
                                                                                                                                                                  color: Colors.transparent,
                                                                                                                                                                  elevation: 1.0,
                                                                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                                                                                                  ),
                                                                                                                                                                  child: Container(
                                                                                                                                                                    width: MediaQuery.of(context).size.width * 1.0,
                                                                                                                                                                    height: 120.0,
                                                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                                                                    ),
                                                                                                                                                                    child: Padding(
                                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                                                      child: Row(
                                                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                                                        children: [
                                                                                                                                                                          Stack(
                                                                                                                                                                            children: [
                                                                                                                                                                              Column(
                                                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                                                children: [
                                                                                                                                                                                  Padding(
                                                                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 8.0, 8.0),
                                                                                                                                                                                    child: InkWell(
                                                                                                                                                                                      onTap: () async {
                                                                                                                                                                                        logFirebaseEvent('RESTAURANT_DETAILS_Image_tn36l86p_ON_TAP');
                                                                                                                                                                                        logFirebaseEvent('Image_expand_image');
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
                                                                                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                                                                                          child: CachedNetworkImage(
                                                                                                                                                                                            imageUrl: valueOrDefault<String>(
                                                                                                                                                                                              storeListView3RestaurantsRecord.featuredImage,
                                                                                                                                                                                              'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                                                                                                                                                                            ),
                                                                                                                                                                                            width: 74.0,
                                                                                                                                                                                            height: 74.0,
                                                                                                                                                                                            fit: BoxFit.cover,
                                                                                                                                                                                          ),
                                                                                                                                                                                        ),
                                                                                                                                                                                      ),
                                                                                                                                                                                    ),
                                                                                                                                                                                  ),
                                                                                                                                                                                ],
                                                                                                                                                                              ),
                                                                                                                                                                              Padding(
                                                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                                                child: StreamBuilder<RestaurantsRecord>(
                                                                                                                                                                                  stream: RestaurantsRecord.getDocument(storeListView3RestaurantsRecord.reference),
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
                                                                                                                                                                                    final containerRestaurantsRecord = snapshot.data!;
                                                                                                                                                                                    return Material(
                                                                                                                                                                                      color: Colors.transparent,
                                                                                                                                                                                      elevation: 4.0,
                                                                                                                                                                                      shape: RoundedRectangleBorder(
                                                                                                                                                                                        borderRadius: BorderRadius.circular(99.0),
                                                                                                                                                                                      ),
                                                                                                                                                                                      child: Container(
                                                                                                                                                                                        width: 35.0,
                                                                                                                                                                                        height: 35.0,
                                                                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                                                                          color: Color(0xFFEEEEEE),
                                                                                                                                                                                          borderRadius: BorderRadius.circular(99.0),
                                                                                                                                                                                        ),
                                                                                                                                                                                        child: Container(
                                                                                                                                                                                          width: 120.0,
                                                                                                                                                                                          height: 120.0,
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
                                                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 55.0, 0.0, 0.0),
                                                                                                                                                                                child: StreamBuilder<List<PostsRecord>>(
                                                                                                                                                                                  stream: queryPostsRecord(
                                                                                                                                                                                    queryBuilder: (postsRecord) => postsRecord.where('rest_ref', isEqualTo: storeListView3RestaurantsRecord.reference),
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
                                                                                                                                                                                    List<PostsRecord> containerPostsRecordList = snapshot.data!;
                                                                                                                                                                                    return Material(
                                                                                                                                                                                      color: Colors.transparent,
                                                                                                                                                                                      elevation: 4.0,
                                                                                                                                                                                      shape: RoundedRectangleBorder(
                                                                                                                                                                                        borderRadius: BorderRadius.circular(99.0),
                                                                                                                                                                                      ),
                                                                                                                                                                                      child: Container(
                                                                                                                                                                                        width: 35.0,
                                                                                                                                                                                        height: 35.0,
                                                                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                                                                                            () {
                                                                                                                                                                                              if (FFAppState().excellent.contains(functions.getAverageRatingCopy(containerPostsRecordList
                                                                                                                                                                                                  .map((e) => valueOrDefault<double>(
                                                                                                                                                                                                        e.userRating,
                                                                                                                                                                                                        1.0,
                                                                                                                                                                                                      ))
                                                                                                                                                                                                  .toList()))) {
                                                                                                                                                                                                return Color(0xFF3FDF86);
                                                                                                                                                                                              } else if (FFAppState().good.contains(functions.getAverageRatingCopy(containerPostsRecordList
                                                                                                                                                                                                  .map((e) => valueOrDefault<double>(
                                                                                                                                                                                                        e.userRating,
                                                                                                                                                                                                        1.0,
                                                                                                                                                                                                      ))
                                                                                                                                                                                                  .toList()))) {
                                                                                                                                                                                                return Color(0xFFC3DF3F);
                                                                                                                                                                                              } else if (FFAppState().average.contains(functions.getAverageRatingCopy(containerPostsRecordList
                                                                                                                                                                                                  .map((e) => valueOrDefault<double>(
                                                                                                                                                                                                        e.userRating,
                                                                                                                                                                                                        1.0,
                                                                                                                                                                                                      ))
                                                                                                                                                                                                  .toList()))) {
                                                                                                                                                                                                return Color(0xFFDFCB3F);
                                                                                                                                                                                              } else if (FFAppState().bad.contains(functions.getAverageRatingCopy(containerPostsRecordList
                                                                                                                                                                                                  .map((e) => valueOrDefault<double>(
                                                                                                                                                                                                        e.userRating,
                                                                                                                                                                                                        1.0,
                                                                                                                                                                                                      ))
                                                                                                                                                                                                  .toList()))) {
                                                                                                                                                                                                return Color(0xFFDF993F);
                                                                                                                                                                                              } else if (FFAppState().horrible.contains(functions.getAverageRatingCopy(containerPostsRecordList
                                                                                                                                                                                                  .map((e) => valueOrDefault<double>(
                                                                                                                                                                                                        e.userRating,
                                                                                                                                                                                                        1.0,
                                                                                                                                                                                                      ))
                                                                                                                                                                                                  .toList()))) {
                                                                                                                                                                                                return Color(0xFFDF5A3F);
                                                                                                                                                                                              } else {
                                                                                                                                                                                                return FlutterFlowTheme.of(context).secondaryBackground;
                                                                                                                                                                                              }
                                                                                                                                                                                            }(),
                                                                                                                                                                                            Color(0x8E95A1AC),
                                                                                                                                                                                          ),
                                                                                                                                                                                          borderRadius: BorderRadius.circular(99.0),
                                                                                                                                                                                        ),
                                                                                                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
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
                                                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 1.0, 0.0, 0.0),
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
                                                                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                                              fontSize: 18.0,
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
                                                                                                                                                                                              fontSize: 14.0,
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
                                                                                                                                                                                              fontSize: 14.0,
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
                                                                                                                                                                                              fontSize: 14.0,
                                                                                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                                                                                            ),
                                                                                                                                                                                      ),
                                                                                                                                                                                      Padding(
                                                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                                                        child: Text(
                                                                                                                                                                                          valueOrDefault<String>(
                                                                                                                                                                                            '${formatNumber(
                                                                                                                                                                                              storeListView3RestaurantsRecord.reviews,
                                                                                                                                                                                              formatType: FormatType.compact,
                                                                                                                                                                                            )} reviews',
                                                                                                                                                                                            '0 reviews',
                                                                                                                                                                                          ),
                                                                                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                                                                fontFamily: 'Lexend Deca',
                                                                                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                                              ),
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
                                                                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                                              fontSize: 14.0,
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
                                                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                                                                                  child: Icon(
                                                                                                                                                                                    Icons.chevron_right_outlined,
                                                                                                                                                                                    color: Color(0xFF95A1AC),
                                                                                                                                                                                    size: 24.0,
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
                                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                                                                children: [
                                                                                                                                                                  Column(
                                                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                                                    children: [
                                                                                                                                                                      FlutterFlowIconButton(
                                                                                                                                                                        borderColor: Colors.transparent,
                                                                                                                                                                        borderRadius: 30.0,
                                                                                                                                                                        borderWidth: 1.0,
                                                                                                                                                                        buttonSize: 60.0,
                                                                                                                                                                        icon: Icon(
                                                                                                                                                                          Icons.phone,
                                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                                                          size: 30.0,
                                                                                                                                                                        ),
                                                                                                                                                                        onPressed: () async {
                                                                                                                                                                          logFirebaseEvent('RESTAURANT_DETAILS_PAGE_phone_ICN_ON_TAP');
                                                                                                                                                                          logFirebaseEvent('IconButton_backend_call');

                                                                                                                                                                          final restaurantsUpdateData = {
                                                                                                                                                                            'phoneClicks': FieldValue.increment(1),
                                                                                                                                                                          };
                                                                                                                                                                          await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                                                                                          logFirebaseEvent('IconButton_launch_u_r_l');
                                                                                                                                                                          await launchURL('tel:${storeListView3RestaurantsRecord.phoneNumber}');
                                                                                                                                                                        },
                                                                                                                                                                      ),
                                                                                                                                                                    ],
                                                                                                                                                                  ),
                                                                                                                                                                  Column(
                                                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                                                    children: [
                                                                                                                                                                      FlutterFlowIconButton(
                                                                                                                                                                        borderColor: Colors.transparent,
                                                                                                                                                                        borderRadius: 30.0,
                                                                                                                                                                        borderWidth: 1.0,
                                                                                                                                                                        buttonSize: 60.0,
                                                                                                                                                                        icon: FaIcon(
                                                                                                                                                                          FontAwesomeIcons.mapMarkedAlt,
                                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                                                          size: 30.0,
                                                                                                                                                                        ),
                                                                                                                                                                        onPressed: () async {
                                                                                                                                                                          logFirebaseEvent('RESTAURANT_DETAILS_mapMarkedAlt_ICN_ON_T');
                                                                                                                                                                          logFirebaseEvent('IconButton_backend_call');

                                                                                                                                                                          final restaurantsUpdateData = {
                                                                                                                                                                            'mapClicks': FieldValue.increment(1),
                                                                                                                                                                          };
                                                                                                                                                                          await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                                                                                          logFirebaseEvent('IconButton_launch_u_r_l');
                                                                                                                                                                          await launchURL(functions.getMapUrl(storeListView3RestaurantsRecord.restLatLong));
                                                                                                                                                                        },
                                                                                                                                                                      ),
                                                                                                                                                                    ],
                                                                                                                                                                  ),
                                                                                                                                                                  Column(
                                                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                                                                                    children: [
                                                                                                                                                                      FlutterFlowIconButton(
                                                                                                                                                                        borderColor: Colors.transparent,
                                                                                                                                                                        borderRadius: 30.0,
                                                                                                                                                                        borderWidth: 1.0,
                                                                                                                                                                        buttonSize: 60.0,
                                                                                                                                                                        icon: FaIcon(
                                                                                                                                                                          FontAwesomeIcons.globe,
                                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                                                          size: 30.0,
                                                                                                                                                                        ),
                                                                                                                                                                        onPressed: () async {
                                                                                                                                                                          logFirebaseEvent('RESTAURANT_DETAILS_PAGE_globe_ICN_ON_TAP');
                                                                                                                                                                          logFirebaseEvent('IconButton_backend_call');

                                                                                                                                                                          final restaurantsUpdateData = {
                                                                                                                                                                            'websiteClicks': FieldValue.increment(1),
                                                                                                                                                                          };
                                                                                                                                                                          await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                                                                                          logFirebaseEvent('IconButton_launch_u_r_l');
                                                                                                                                                                          await launchURL(storeListView3RestaurantsRecord.website!);
                                                                                                                                                                        },
                                                                                                                                                                      ),
                                                                                                                                                                    ],
                                                                                                                                                                  ),
                                                                                                                                                                  if (storeListView3RestaurantsRecord.isSubscribed ?? true)
                                                                                                                                                                    Column(
                                                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                                                      children: [
                                                                                                                                                                        FlutterFlowIconButton(
                                                                                                                                                                          borderColor: Colors.transparent,
                                                                                                                                                                          borderRadius: 30.0,
                                                                                                                                                                          borderWidth: 1.0,
                                                                                                                                                                          buttonSize: 60.0,
                                                                                                                                                                          icon: Icon(
                                                                                                                                                                            Icons.fastfood_rounded,
                                                                                                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                                                            size: 34.0,
                                                                                                                                                                          ),
                                                                                                                                                                          onPressed: () async {
                                                                                                                                                                            logFirebaseEvent('RESTAURANT_DETAILS_fastfood_rounded_ICN_');
                                                                                                                                                                            logFirebaseEvent('IconButton_backend_call');

                                                                                                                                                                            final restaurantsUpdateData = {
                                                                                                                                                                              'orderNowClicks': FieldValue.increment(1),
                                                                                                                                                                            };
                                                                                                                                                                            await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                                                                                            logFirebaseEvent('IconButton_navigate_to');

                                                                                                                                                                            context.pushNamed(
                                                                                                                                                                              'order',
                                                                                                                                                                              queryParams: {
                                                                                                                                                                                'restaurant': serializeParam(
                                                                                                                                                                                  storeListView3RestaurantsRecord,
                                                                                                                                                                                  ParamType.Document,
                                                                                                                                                                                ),
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
                                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                                                                                child: StreamBuilder<List<PostsRecord>>(
                                                                                                                                                                  stream: queryPostsRecord(
                                                                                                                                                                    queryBuilder: (postsRecord) => postsRecord.where('rest_ref', isEqualTo: storeListView3RestaurantsRecord.reference),
                                                                                                                                                                    limit: 5,
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
                                                                                                                                                                    List<PostsRecord> rowPostsRecordList = snapshot.data!;
                                                                                                                                                                    if (rowPostsRecordList.isEmpty) {
                                                                                                                                                                      return EmptyReviewsWidget(
                                                                                                                                                                        restaurant: storeListView3RestaurantsRecord,
                                                                                                                                                                      );
                                                                                                                                                                    }
                                                                                                                                                                    return Row(
                                                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                                                      children: List.generate(rowPostsRecordList.length, (rowIndex) {
                                                                                                                                                                        final rowPostsRecord = rowPostsRecordList[rowIndex];
                                                                                                                                                                        return Padding(
                                                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                                                                                                                                                                          child: Container(
                                                                                                                                                                            width: 56.25,
                                                                                                                                                                            height: 100.0,
                                                                                                                                                                            decoration: BoxDecoration(
                                                                                                                                                                              color: Color(0xFFEEEEEE),
                                                                                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                                                                                            ),
                                                                                                                                                                            child: InkWell(
                                                                                                                                                                              onTap: () async {
                                                                                                                                                                                logFirebaseEvent('RESTAURANT_DETAILS_Image_ix8kvrv6_ON_TAP');
                                                                                                                                                                                logFirebaseEvent('Image_navigate_to');

                                                                                                                                                                                context.pushNamed(
                                                                                                                                                                                  'restaurantReviewsList',
                                                                                                                                                                                  queryParams: {
                                                                                                                                                                                    'initialStoryIndex': serializeParam(
                                                                                                                                                                                      rowIndex,
                                                                                                                                                                                      ParamType.int,
                                                                                                                                                                                    ),
                                                                                                                                                                                    'restaurant': serializeParam(
                                                                                                                                                                                      storeListView3RestaurantsRecord,
                                                                                                                                                                                      ParamType.Document,
                                                                                                                                                                                    ),
                                                                                                                                                                                  }.withoutNulls,
                                                                                                                                                                                  extra: <String, dynamic>{
                                                                                                                                                                                    'restaurant': storeListView3RestaurantsRecord,
                                                                                                                                                                                  },
                                                                                                                                                                                );
                                                                                                                                                                              },
                                                                                                                                                                              child: ClipRRect(
                                                                                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                                                                                child: Image.network(
                                                                                                                                                                                  valueOrDefault<String>(
                                                                                                                                                                                    rowPostsRecord.videoThumbnail,
                                                                                                                                                                                    'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                                                                                                                                                                  ),
                                                                                                                                                                                  width: 100.0,
                                                                                                                                                                                  height: 100.0,
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
                                                                                                                                        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
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
                                                                                                            ],
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  if (column1RestaurantsRecord.accessabilities!.toList().length >= 1)
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: double.infinity,
                                                                                                                  color: Color(0x00000000),
                                                                                                                  child: ExpandableNotifier(
                                                                                                                    initialExpanded: false,
                                                                                                                    child: ExpandablePanel(
                                                                                                                      header: SelectionArea(
                                                                                                                          child: Text(
                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                          '6d3y7khj' /* Accessabilities */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).title1.override(
                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 16.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                            ),
                                                                                                                      )),
                                                                                                                      collapsed: Container(
                                                                                                                        width: MediaQuery.of(context).size.width * 1.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Container(
                                                                                                                                height: 30.0,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: Builder(
                                                                                                                                  builder: (context) {
                                                                                                                                    final acessabilities = column1RestaurantsRecord.accessabilities!.toList().take(2).toList();
                                                                                                                                    return Wrap(
                                                                                                                                      spacing: 0.0,
                                                                                                                                      runSpacing: 0.0,
                                                                                                                                      alignment: WrapAlignment.start,
                                                                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                      direction: Axis.horizontal,
                                                                                                                                      runAlignment: WrapAlignment.start,
                                                                                                                                      verticalDirection: VerticalDirection.down,
                                                                                                                                      clipBehavior: Clip.none,
                                                                                                                                      children: List.generate(acessabilities.length, (acessabilitiesIndex) {
                                                                                                                                        final acessabilitiesItem = acessabilities[acessabilitiesIndex];
                                                                                                                                        return Container(
                                                                                                                                          width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                          decoration: BoxDecoration(),
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                            children: [
                                                                                                                                              Row(
                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                children: [
                                                                                                                                                  FaIcon(
                                                                                                                                                    FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                    color: Color(0xFF3FDF86),
                                                                                                                                                    size: 24.0,
                                                                                                                                                  ),
                                                                                                                                                  Expanded(
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                      child: SelectionArea(
                                                                                                                                                          child: Text(
                                                                                                                                                        acessabilitiesItem,
                                                                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                            ),
                                                                                                                                                      )),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      }),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      expanded: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Builder(
                                                                                                                              builder: (context) {
                                                                                                                                final acessabilities = column1RestaurantsRecord.accessabilities!.toList();
                                                                                                                                return Wrap(
                                                                                                                                  spacing: 0.0,
                                                                                                                                  runSpacing: 0.0,
                                                                                                                                  alignment: WrapAlignment.start,
                                                                                                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                  direction: Axis.horizontal,
                                                                                                                                  runAlignment: WrapAlignment.start,
                                                                                                                                  verticalDirection: VerticalDirection.down,
                                                                                                                                  clipBehavior: Clip.none,
                                                                                                                                  children: List.generate(acessabilities.length, (acessabilitiesIndex) {
                                                                                                                                    final acessabilitiesItem = acessabilities[acessabilitiesIndex];
                                                                                                                                    return Container(
                                                                                                                                      width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                      decoration: BoxDecoration(),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                        children: [
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              FaIcon(
                                                                                                                                                FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                color: Color(0xFF3FDF86),
                                                                                                                                                size: 24.0,
                                                                                                                                              ),
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                  child: SelectionArea(
                                                                                                                                                      child: Text(
                                                                                                                                                    acessabilitiesItem,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                        ),
                                                                                                                                                  )),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  }),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      theme: ExpandableThemeData(
                                                                                                                        tapHeaderToExpand: true,
                                                                                                                        tapBodyToExpand: false,
                                                                                                                        tapBodyToCollapse: false,
                                                                                                                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                                        hasIcon: true,
                                                                                                                        iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Divider(
                                                                                                                  thickness: 2.0,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  if (column1RestaurantsRecord.amenities!.toList().length >= 1)
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: double.infinity,
                                                                                                                  color: Color(0x00000000),
                                                                                                                  child: ExpandableNotifier(
                                                                                                                    initialExpanded: false,
                                                                                                                    child: ExpandablePanel(
                                                                                                                      header: SelectionArea(
                                                                                                                          child: Text(
                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                          '3o5btf94' /* Amenities */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).title1.override(
                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 16.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                            ),
                                                                                                                      )),
                                                                                                                      collapsed: Container(
                                                                                                                        width: MediaQuery.of(context).size.width * 1.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Container(
                                                                                                                                height: 30.0,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: Builder(
                                                                                                                                  builder: (context) {
                                                                                                                                    final amentities = column1RestaurantsRecord.amenities!.toList().take(2).toList();
                                                                                                                                    return Wrap(
                                                                                                                                      spacing: 0.0,
                                                                                                                                      runSpacing: 0.0,
                                                                                                                                      alignment: WrapAlignment.start,
                                                                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                      direction: Axis.horizontal,
                                                                                                                                      runAlignment: WrapAlignment.start,
                                                                                                                                      verticalDirection: VerticalDirection.down,
                                                                                                                                      clipBehavior: Clip.none,
                                                                                                                                      children: List.generate(amentities.length, (amentitiesIndex) {
                                                                                                                                        final amentitiesItem = amentities[amentitiesIndex];
                                                                                                                                        return Container(
                                                                                                                                          width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                          decoration: BoxDecoration(),
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                            children: [
                                                                                                                                              Row(
                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                children: [
                                                                                                                                                  FaIcon(
                                                                                                                                                    FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                    color: Color(0xFF3FDF86),
                                                                                                                                                    size: 24.0,
                                                                                                                                                  ),
                                                                                                                                                  Expanded(
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                      child: SelectionArea(
                                                                                                                                                          child: Text(
                                                                                                                                                        amentitiesItem,
                                                                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                            ),
                                                                                                                                                      )),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      }),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      expanded: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Builder(
                                                                                                                              builder: (context) {
                                                                                                                                final amentities2 = column1RestaurantsRecord.amenities!.toList();
                                                                                                                                return Wrap(
                                                                                                                                  spacing: 0.0,
                                                                                                                                  runSpacing: 0.0,
                                                                                                                                  alignment: WrapAlignment.start,
                                                                                                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                  direction: Axis.horizontal,
                                                                                                                                  runAlignment: WrapAlignment.start,
                                                                                                                                  verticalDirection: VerticalDirection.down,
                                                                                                                                  clipBehavior: Clip.none,
                                                                                                                                  children: List.generate(amentities2.length, (amentities2Index) {
                                                                                                                                    final amentities2Item = amentities2[amentities2Index];
                                                                                                                                    return Container(
                                                                                                                                      width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                      decoration: BoxDecoration(),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                        children: [
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              FaIcon(
                                                                                                                                                FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                color: Color(0xFF3FDF86),
                                                                                                                                                size: 24.0,
                                                                                                                                              ),
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                  child: SelectionArea(
                                                                                                                                                      child: Text(
                                                                                                                                                    amentities2Item,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                        ),
                                                                                                                                                  )),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  }),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      theme: ExpandableThemeData(
                                                                                                                        tapHeaderToExpand: true,
                                                                                                                        tapBodyToExpand: false,
                                                                                                                        tapBodyToCollapse: false,
                                                                                                                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                                        hasIcon: true,
                                                                                                                        iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Divider(
                                                                                                                  thickness: 2.0,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  if (column1RestaurantsRecord.crowd!.toList().length >= 1)
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: double.infinity,
                                                                                                                  color: Color(0x00000000),
                                                                                                                  child: ExpandableNotifier(
                                                                                                                    initialExpanded: false,
                                                                                                                    child: ExpandablePanel(
                                                                                                                      header: SelectionArea(
                                                                                                                          child: Text(
                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                          'jg1u1skv' /* Crowd */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).title1.override(
                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 16.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                            ),
                                                                                                                      )),
                                                                                                                      collapsed: Container(
                                                                                                                        width: MediaQuery.of(context).size.width * 1.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Container(
                                                                                                                                height: 30.0,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: Builder(
                                                                                                                                  builder: (context) {
                                                                                                                                    final crowd = column1RestaurantsRecord.crowd!.toList().take(2).toList();
                                                                                                                                    return Wrap(
                                                                                                                                      spacing: 0.0,
                                                                                                                                      runSpacing: 0.0,
                                                                                                                                      alignment: WrapAlignment.start,
                                                                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                      direction: Axis.horizontal,
                                                                                                                                      runAlignment: WrapAlignment.start,
                                                                                                                                      verticalDirection: VerticalDirection.down,
                                                                                                                                      clipBehavior: Clip.none,
                                                                                                                                      children: List.generate(crowd.length, (crowdIndex) {
                                                                                                                                        final crowdItem = crowd[crowdIndex];
                                                                                                                                        return Container(
                                                                                                                                          width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                          decoration: BoxDecoration(),
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                            children: [
                                                                                                                                              Row(
                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                children: [
                                                                                                                                                  FaIcon(
                                                                                                                                                    FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                    color: Color(0xFF3FDF86),
                                                                                                                                                    size: 24.0,
                                                                                                                                                  ),
                                                                                                                                                  Expanded(
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                      child: SelectionArea(
                                                                                                                                                          child: Text(
                                                                                                                                                        crowdItem,
                                                                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                            ),
                                                                                                                                                      )),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      }),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      expanded: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Builder(
                                                                                                                              builder: (context) {
                                                                                                                                final crowd2 = column1RestaurantsRecord.crowd!.toList();
                                                                                                                                return Wrap(
                                                                                                                                  spacing: 0.0,
                                                                                                                                  runSpacing: 0.0,
                                                                                                                                  alignment: WrapAlignment.start,
                                                                                                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                  direction: Axis.horizontal,
                                                                                                                                  runAlignment: WrapAlignment.start,
                                                                                                                                  verticalDirection: VerticalDirection.down,
                                                                                                                                  clipBehavior: Clip.none,
                                                                                                                                  children: List.generate(crowd2.length, (crowd2Index) {
                                                                                                                                    final crowd2Item = crowd2[crowd2Index];
                                                                                                                                    return Container(
                                                                                                                                      width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                      decoration: BoxDecoration(),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                        children: [
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              FaIcon(
                                                                                                                                                FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                color: Color(0xFF3FDF86),
                                                                                                                                                size: 24.0,
                                                                                                                                              ),
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                  child: SelectionArea(
                                                                                                                                                      child: Text(
                                                                                                                                                    crowd2Item,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                        ),
                                                                                                                                                  )),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  }),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      theme: ExpandableThemeData(
                                                                                                                        tapHeaderToExpand: true,
                                                                                                                        tapBodyToExpand: false,
                                                                                                                        tapBodyToCollapse: false,
                                                                                                                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                                        hasIcon: true,
                                                                                                                        iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Divider(
                                                                                                                  thickness: 2.0,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  if (column1RestaurantsRecord.diningOptions!.toList().length >= 1)
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: double.infinity,
                                                                                                                  color: Color(0x00000000),
                                                                                                                  child: ExpandableNotifier(
                                                                                                                    initialExpanded: false,
                                                                                                                    child: ExpandablePanel(
                                                                                                                      header: SelectionArea(
                                                                                                                          child: Text(
                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                          '3wwxnobj' /* Dining Options */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).title1.override(
                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 16.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                            ),
                                                                                                                      )),
                                                                                                                      collapsed: Container(
                                                                                                                        width: MediaQuery.of(context).size.width * 1.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Container(
                                                                                                                                height: 30.0,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: Builder(
                                                                                                                                  builder: (context) {
                                                                                                                                    final diningOptions = column1RestaurantsRecord.diningOptions!.toList().take(2).toList();
                                                                                                                                    return Wrap(
                                                                                                                                      spacing: 0.0,
                                                                                                                                      runSpacing: 0.0,
                                                                                                                                      alignment: WrapAlignment.start,
                                                                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                      direction: Axis.horizontal,
                                                                                                                                      runAlignment: WrapAlignment.start,
                                                                                                                                      verticalDirection: VerticalDirection.down,
                                                                                                                                      clipBehavior: Clip.none,
                                                                                                                                      children: List.generate(diningOptions.length, (diningOptionsIndex) {
                                                                                                                                        final diningOptionsItem = diningOptions[diningOptionsIndex];
                                                                                                                                        return Container(
                                                                                                                                          width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                          decoration: BoxDecoration(),
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                            children: [
                                                                                                                                              Row(
                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                children: [
                                                                                                                                                  FaIcon(
                                                                                                                                                    FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                    color: Color(0xFF3FDF86),
                                                                                                                                                    size: 24.0,
                                                                                                                                                  ),
                                                                                                                                                  Expanded(
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                      child: SelectionArea(
                                                                                                                                                          child: Text(
                                                                                                                                                        diningOptionsItem,
                                                                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                            ),
                                                                                                                                                      )),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      }),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      expanded: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Builder(
                                                                                                                              builder: (context) {
                                                                                                                                final diningOptions2 = column1RestaurantsRecord.diningOptions!.toList();
                                                                                                                                return Wrap(
                                                                                                                                  spacing: 0.0,
                                                                                                                                  runSpacing: 0.0,
                                                                                                                                  alignment: WrapAlignment.start,
                                                                                                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                  direction: Axis.horizontal,
                                                                                                                                  runAlignment: WrapAlignment.start,
                                                                                                                                  verticalDirection: VerticalDirection.down,
                                                                                                                                  clipBehavior: Clip.none,
                                                                                                                                  children: List.generate(diningOptions2.length, (diningOptions2Index) {
                                                                                                                                    final diningOptions2Item = diningOptions2[diningOptions2Index];
                                                                                                                                    return Container(
                                                                                                                                      width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                      decoration: BoxDecoration(),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                        children: [
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              FaIcon(
                                                                                                                                                FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                color: Color(0xFF3FDF86),
                                                                                                                                                size: 24.0,
                                                                                                                                              ),
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                  child: SelectionArea(
                                                                                                                                                      child: Text(
                                                                                                                                                    diningOptions2Item,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                        ),
                                                                                                                                                  )),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  }),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      theme: ExpandableThemeData(
                                                                                                                        tapHeaderToExpand: true,
                                                                                                                        tapBodyToExpand: false,
                                                                                                                        tapBodyToCollapse: false,
                                                                                                                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                                        hasIcon: true,
                                                                                                                        iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Divider(
                                                                                                                  thickness: 2.0,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  if (column1RestaurantsRecord.highlights!.toList().length >= 1)
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: double.infinity,
                                                                                                                  color: Color(0x00000000),
                                                                                                                  child: ExpandableNotifier(
                                                                                                                    initialExpanded: false,
                                                                                                                    child: ExpandablePanel(
                                                                                                                      header: SelectionArea(
                                                                                                                          child: Text(
                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                          'sdyaz4vy' /* Highlights */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).title1.override(
                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 16.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                            ),
                                                                                                                      )),
                                                                                                                      collapsed: Container(
                                                                                                                        width: MediaQuery.of(context).size.width * 1.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Container(
                                                                                                                                height: 30.0,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: Builder(
                                                                                                                                  builder: (context) {
                                                                                                                                    final highlights = column1RestaurantsRecord.highlights!.toList().take(2).toList();
                                                                                                                                    return Wrap(
                                                                                                                                      spacing: 0.0,
                                                                                                                                      runSpacing: 0.0,
                                                                                                                                      alignment: WrapAlignment.start,
                                                                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                      direction: Axis.horizontal,
                                                                                                                                      runAlignment: WrapAlignment.start,
                                                                                                                                      verticalDirection: VerticalDirection.down,
                                                                                                                                      clipBehavior: Clip.none,
                                                                                                                                      children: List.generate(highlights.length, (highlightsIndex) {
                                                                                                                                        final highlightsItem = highlights[highlightsIndex];
                                                                                                                                        return Container(
                                                                                                                                          width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                          decoration: BoxDecoration(),
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                            children: [
                                                                                                                                              Row(
                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                children: [
                                                                                                                                                  FaIcon(
                                                                                                                                                    FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                    color: Color(0xFF3FDF86),
                                                                                                                                                    size: 24.0,
                                                                                                                                                  ),
                                                                                                                                                  Expanded(
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                      child: SelectionArea(
                                                                                                                                                          child: Text(
                                                                                                                                                        highlightsItem,
                                                                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                            ),
                                                                                                                                                      )),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      }),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      expanded: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Builder(
                                                                                                                              builder: (context) {
                                                                                                                                final highlights2 = column1RestaurantsRecord.highlights!.toList();
                                                                                                                                return Wrap(
                                                                                                                                  spacing: 0.0,
                                                                                                                                  runSpacing: 0.0,
                                                                                                                                  alignment: WrapAlignment.start,
                                                                                                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                  direction: Axis.horizontal,
                                                                                                                                  runAlignment: WrapAlignment.start,
                                                                                                                                  verticalDirection: VerticalDirection.down,
                                                                                                                                  clipBehavior: Clip.none,
                                                                                                                                  children: List.generate(highlights2.length, (highlights2Index) {
                                                                                                                                    final highlights2Item = highlights2[highlights2Index];
                                                                                                                                    return Container(
                                                                                                                                      width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                      decoration: BoxDecoration(),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                        children: [
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              FaIcon(
                                                                                                                                                FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                color: Color(0xFF3FDF86),
                                                                                                                                                size: 24.0,
                                                                                                                                              ),
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                  child: SelectionArea(
                                                                                                                                                      child: Text(
                                                                                                                                                    highlights2Item,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                        ),
                                                                                                                                                  )),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  }),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      theme: ExpandableThemeData(
                                                                                                                        tapHeaderToExpand: true,
                                                                                                                        tapBodyToExpand: false,
                                                                                                                        tapBodyToCollapse: false,
                                                                                                                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                                        hasIcon: true,
                                                                                                                        iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Divider(
                                                                                                                  thickness: 2.0,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  if (column1RestaurantsRecord.offerings!.toList().length >= 1)
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: double.infinity,
                                                                                                                  color: Color(0x00000000),
                                                                                                                  child: ExpandableNotifier(
                                                                                                                    initialExpanded: false,
                                                                                                                    child: ExpandablePanel(
                                                                                                                      header: SelectionArea(
                                                                                                                          child: Text(
                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                          'y9e89p84' /* Offerings */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).title1.override(
                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 16.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                            ),
                                                                                                                      )),
                                                                                                                      collapsed: Container(
                                                                                                                        width: MediaQuery.of(context).size.width * 1.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Container(
                                                                                                                                height: 30.0,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: Builder(
                                                                                                                                  builder: (context) {
                                                                                                                                    final offerings = column1RestaurantsRecord.offerings!.toList().take(2).toList();
                                                                                                                                    return Wrap(
                                                                                                                                      spacing: 0.0,
                                                                                                                                      runSpacing: 0.0,
                                                                                                                                      alignment: WrapAlignment.start,
                                                                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                      direction: Axis.horizontal,
                                                                                                                                      runAlignment: WrapAlignment.start,
                                                                                                                                      verticalDirection: VerticalDirection.down,
                                                                                                                                      clipBehavior: Clip.none,
                                                                                                                                      children: List.generate(offerings.length, (offeringsIndex) {
                                                                                                                                        final offeringsItem = offerings[offeringsIndex];
                                                                                                                                        return Container(
                                                                                                                                          width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                          decoration: BoxDecoration(),
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                            children: [
                                                                                                                                              Row(
                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                children: [
                                                                                                                                                  FaIcon(
                                                                                                                                                    FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                    color: Color(0xFF3FDF86),
                                                                                                                                                    size: 24.0,
                                                                                                                                                  ),
                                                                                                                                                  Expanded(
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                      child: SelectionArea(
                                                                                                                                                          child: Text(
                                                                                                                                                        offeringsItem,
                                                                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                            ),
                                                                                                                                                      )),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      }),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      expanded: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Builder(
                                                                                                                              builder: (context) {
                                                                                                                                final offerings2 = column1RestaurantsRecord.offerings!.toList();
                                                                                                                                return Wrap(
                                                                                                                                  spacing: 0.0,
                                                                                                                                  runSpacing: 0.0,
                                                                                                                                  alignment: WrapAlignment.start,
                                                                                                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                  direction: Axis.horizontal,
                                                                                                                                  runAlignment: WrapAlignment.start,
                                                                                                                                  verticalDirection: VerticalDirection.down,
                                                                                                                                  clipBehavior: Clip.none,
                                                                                                                                  children: List.generate(offerings2.length, (offerings2Index) {
                                                                                                                                    final offerings2Item = offerings2[offerings2Index];
                                                                                                                                    return Container(
                                                                                                                                      width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                      decoration: BoxDecoration(),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                        children: [
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              FaIcon(
                                                                                                                                                FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                color: Color(0xFF3FDF86),
                                                                                                                                                size: 24.0,
                                                                                                                                              ),
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                  child: SelectionArea(
                                                                                                                                                      child: Text(
                                                                                                                                                    offerings2Item,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                        ),
                                                                                                                                                  )),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  }),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      theme: ExpandableThemeData(
                                                                                                                        tapHeaderToExpand: true,
                                                                                                                        tapBodyToExpand: false,
                                                                                                                        tapBodyToCollapse: false,
                                                                                                                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                                        hasIcon: true,
                                                                                                                        iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Divider(
                                                                                                                  thickness: 2.0,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  if (column1RestaurantsRecord.payments!.toList().length >= 1)
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: double.infinity,
                                                                                                                  color: Color(0x00000000),
                                                                                                                  child: ExpandableNotifier(
                                                                                                                    initialExpanded: false,
                                                                                                                    child: ExpandablePanel(
                                                                                                                      header: SelectionArea(
                                                                                                                          child: Text(
                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                          'bcntatqj' /* Payments */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).title1.override(
                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 16.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                            ),
                                                                                                                      )),
                                                                                                                      collapsed: Container(
                                                                                                                        width: MediaQuery.of(context).size.width * 1.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Container(
                                                                                                                                height: 30.0,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: Builder(
                                                                                                                                  builder: (context) {
                                                                                                                                    final payments = column1RestaurantsRecord.payments!.toList().take(2).toList();
                                                                                                                                    return Wrap(
                                                                                                                                      spacing: 0.0,
                                                                                                                                      runSpacing: 0.0,
                                                                                                                                      alignment: WrapAlignment.start,
                                                                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                      direction: Axis.horizontal,
                                                                                                                                      runAlignment: WrapAlignment.start,
                                                                                                                                      verticalDirection: VerticalDirection.down,
                                                                                                                                      clipBehavior: Clip.none,
                                                                                                                                      children: List.generate(payments.length, (paymentsIndex) {
                                                                                                                                        final paymentsItem = payments[paymentsIndex];
                                                                                                                                        return Container(
                                                                                                                                          width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                          decoration: BoxDecoration(),
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                            children: [
                                                                                                                                              Row(
                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                children: [
                                                                                                                                                  FaIcon(
                                                                                                                                                    FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                    color: Color(0xFF3FDF86),
                                                                                                                                                    size: 24.0,
                                                                                                                                                  ),
                                                                                                                                                  Expanded(
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                      child: SelectionArea(
                                                                                                                                                          child: Text(
                                                                                                                                                        paymentsItem,
                                                                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                            ),
                                                                                                                                                      )),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      }),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      expanded: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Builder(
                                                                                                                              builder: (context) {
                                                                                                                                final payments2 = column1RestaurantsRecord.payments!.toList();
                                                                                                                                return Wrap(
                                                                                                                                  spacing: 0.0,
                                                                                                                                  runSpacing: 0.0,
                                                                                                                                  alignment: WrapAlignment.start,
                                                                                                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                  direction: Axis.horizontal,
                                                                                                                                  runAlignment: WrapAlignment.start,
                                                                                                                                  verticalDirection: VerticalDirection.down,
                                                                                                                                  clipBehavior: Clip.none,
                                                                                                                                  children: List.generate(payments2.length, (payments2Index) {
                                                                                                                                    final payments2Item = payments2[payments2Index];
                                                                                                                                    return Container(
                                                                                                                                      width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                      decoration: BoxDecoration(),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                        children: [
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              FaIcon(
                                                                                                                                                FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                color: Color(0xFF3FDF86),
                                                                                                                                                size: 24.0,
                                                                                                                                              ),
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                  child: SelectionArea(
                                                                                                                                                      child: Text(
                                                                                                                                                    payments2Item,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                        ),
                                                                                                                                                  )),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  }),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      theme: ExpandableThemeData(
                                                                                                                        tapHeaderToExpand: true,
                                                                                                                        tapBodyToExpand: false,
                                                                                                                        tapBodyToCollapse: false,
                                                                                                                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                                        hasIcon: true,
                                                                                                                        iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Divider(
                                                                                                                  thickness: 2.0,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  if (column1RestaurantsRecord.planning!.toList().length >= 1)
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: double.infinity,
                                                                                                                  color: Color(0x00000000),
                                                                                                                  child: ExpandableNotifier(
                                                                                                                    initialExpanded: false,
                                                                                                                    child: ExpandablePanel(
                                                                                                                      header: SelectionArea(
                                                                                                                          child: Text(
                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                          'dde7qlpv' /* Planning */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).title1.override(
                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 16.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                            ),
                                                                                                                      )),
                                                                                                                      collapsed: Container(
                                                                                                                        width: MediaQuery.of(context).size.width * 1.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Container(
                                                                                                                                height: 30.0,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: Builder(
                                                                                                                                  builder: (context) {
                                                                                                                                    final planning = column1RestaurantsRecord.planning!.toList().take(2).toList();
                                                                                                                                    return Wrap(
                                                                                                                                      spacing: 0.0,
                                                                                                                                      runSpacing: 0.0,
                                                                                                                                      alignment: WrapAlignment.start,
                                                                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                      direction: Axis.horizontal,
                                                                                                                                      runAlignment: WrapAlignment.start,
                                                                                                                                      verticalDirection: VerticalDirection.down,
                                                                                                                                      clipBehavior: Clip.none,
                                                                                                                                      children: List.generate(planning.length, (planningIndex) {
                                                                                                                                        final planningItem = planning[planningIndex];
                                                                                                                                        return Container(
                                                                                                                                          width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                          decoration: BoxDecoration(),
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                            children: [
                                                                                                                                              Row(
                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                children: [
                                                                                                                                                  FaIcon(
                                                                                                                                                    FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                    color: Color(0xFF3FDF86),
                                                                                                                                                    size: 24.0,
                                                                                                                                                  ),
                                                                                                                                                  Expanded(
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                      child: SelectionArea(
                                                                                                                                                          child: Text(
                                                                                                                                                        planningItem,
                                                                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                            ),
                                                                                                                                                      )),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      }),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      expanded: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Builder(
                                                                                                                              builder: (context) {
                                                                                                                                final planning2 = column1RestaurantsRecord.planning!.toList();
                                                                                                                                return Wrap(
                                                                                                                                  spacing: 0.0,
                                                                                                                                  runSpacing: 0.0,
                                                                                                                                  alignment: WrapAlignment.start,
                                                                                                                                  crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                                  direction: Axis.horizontal,
                                                                                                                                  runAlignment: WrapAlignment.start,
                                                                                                                                  verticalDirection: VerticalDirection.down,
                                                                                                                                  clipBehavior: Clip.none,
                                                                                                                                  children: List.generate(planning2.length, (planning2Index) {
                                                                                                                                    final planning2Item = planning2[planning2Index];
                                                                                                                                    return Container(
                                                                                                                                      width: MediaQuery.of(context).size.width * 0.45,
                                                                                                                                      decoration: BoxDecoration(),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                        children: [
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              FaIcon(
                                                                                                                                                FontAwesomeIcons.solidCheckSquare,
                                                                                                                                                color: Color(0xFF3FDF86),
                                                                                                                                                size: 24.0,
                                                                                                                                              ),
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                                  child: SelectionArea(
                                                                                                                                                      child: Text(
                                                                                                                                                    planning2Item,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                        ),
                                                                                                                                                  )),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  }),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      theme: ExpandableThemeData(
                                                                                                                        tapHeaderToExpand: true,
                                                                                                                        tapBodyToExpand: false,
                                                                                                                        tapBodyToCollapse: false,
                                                                                                                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                                        hasIcon: true,
                                                                                                                        iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Divider(
                                                                                                                  thickness: 2.0,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  if (column1RestaurantsRecord.menuItems!.toList().length >= 1)
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'kuowja73' /* Featured Menu Items */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 16.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 20.0),
                                                                                                    child: StreamBuilder<List<MenuItemRecord>>(
                                                                                                      stream: queryMenuItemRecord(
                                                                                                        queryBuilder: (menuItemRecord) => menuItemRecord.where('restRef', isEqualTo: column1RestaurantsRecord.reference).where('featuredItem', isEqualTo: true),
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
                                                                                                        List<MenuItemRecord> eventsListMenuItemRecordList = snapshot.data!;
                                                                                                        return SingleChildScrollView(
                                                                                                          scrollDirection: Axis.horizontal,
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: List.generate(eventsListMenuItemRecordList.length, (eventsListIndex) {
                                                                                                              final eventsListMenuItemRecord = eventsListMenuItemRecordList[eventsListIndex];
                                                                                                              return Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 20.0),
                                                                                                                child: InkWell(
                                                                                                                  onTap: () async {
                                                                                                                    logFirebaseEvent('RESTAURANT_DETAILS_Container_taez9z6k_ON');
                                                                                                                    logFirebaseEvent('Container_navigate_to');

                                                                                                                    context.pushNamed(
                                                                                                                      'singleItem',
                                                                                                                      queryParams: {
                                                                                                                        'menuItem': serializeParam(
                                                                                                                          eventsListMenuItemRecord,
                                                                                                                          ParamType.Document,
                                                                                                                        ),
                                                                                                                        'restaurant': serializeParam(
                                                                                                                          column1RestaurantsRecord,
                                                                                                                          ParamType.Document,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        'menuItem': eventsListMenuItemRecord,
                                                                                                                        'restaurant': column1RestaurantsRecord,
                                                                                                                      },
                                                                                                                    );
                                                                                                                  },
                                                                                                                  child: Material(
                                                                                                                    color: Colors.transparent,
                                                                                                                    elevation: 4.0,
                                                                                                                    shape: RoundedRectangleBorder(
                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                    ),
                                                                                                                    child: Container(
                                                                                                                      width: 250.0,
                                                                                                                      height: 210.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                                                      ),
                                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 0.0, 0.0),
                                                                                                                                child: Material(
                                                                                                                                  color: Colors.transparent,
                                                                                                                                  elevation: 2.0,
                                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                                                                  ),
                                                                                                                                  child: Container(
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      color: Color(0xFFEEEEEE),
                                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                                    ),
                                                                                                                                    child: ClipRRect(
                                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                                      child: CachedNetworkImage(
                                                                                                                                        imageUrl: valueOrDefault<String>(
                                                                                                                                          eventsListMenuItemRecord.itemImage,
                                                                                                                                          'https://cdn.vox-cdn.com/thumbor/9qN-DmdwZE__GqwuoJIinjUXzmk=/0x0:960x646/1200x900/filters:focal(404x247:556x399)/cdn.vox-cdn.com/uploads/chorus_image/image/63084260/foodlife_2.0.jpg',
                                                                                                                                        ),
                                                                                                                                        width: 238.0,
                                                                                                                                        height: 125.0,
                                                                                                                                        fit: BoxFit.cover,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 0.0, 0.0),
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Text(
                                                                                                                                  eventsListMenuItemRecord.itemName!.maybeHandleOverflow(
                                                                                                                                    maxChars: 18,
                                                                                                                                    replacement: '…',
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                        fontFamily: 'Lexend Deca',
                                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                        fontSize: 18.0,
                                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Text(
                                                                                                                                  eventsListMenuItemRecord.itemDescription!.maybeHandleOverflow(
                                                                                                                                    maxChars: 25,
                                                                                                                                    replacement: '…',
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                        fontFamily: 'Lexend Deca',
                                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Text(
                                                                                                                                  formatNumber(
                                                                                                                                    eventsListMenuItemRecord.itemPrice!,
                                                                                                                                    formatType: FormatType.decimal,
                                                                                                                                    decimalType: DecimalType.periodDecimal,
                                                                                                                                    currency: '\$',
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                        fontFamily: 'Lexend Deca',
                                                                                                                                        color: Color(0xFF43C643),
                                                                                                                                        fontSize: 17.0,
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
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
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(0.0),
                                                                                            bottomRight: Radius.circular(0.0),
                                                                                            topLeft: Radius.circular(30.0),
                                                                                            topRight: Radius.circular(30.0),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              theme: ExpandableThemeData(
                                                                                tapHeaderToExpand: true,
                                                                                tapBodyToExpand: true,
                                                                                tapBodyToCollapse: true,
                                                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                hasIcon: true,
                                                                                expandIcon: Icons.arrow_drop_down_rounded,
                                                                                collapseIcon: Icons.arrow_drop_up_rounded,
                                                                                iconSize: 28.0,
                                                                                iconColor: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        40.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
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
                                                                        0x39000000),
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            1.0),
                                                                  )
                                                                ],
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        16.0,
                                                                        12.0,
                                                                        24.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              12.0),
                                                                          child:
                                                                              Text(
                                                                            column1RestaurantsRecord.reviews!.toString(),
                                                                            style: FlutterFlowTheme.of(context).title1.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 28.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'k4c2bsap' /* # of Reviews */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: Color(0xFF95A1AC),
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                              child: Text(
                                                                                functions.getAverageRating(restaurantDetailsPostsRecordList.toList()),
                                                                                style: FlutterFlowTheme.of(context).title1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 28.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 12.0),
                                                                              child: Icon(
                                                                                Icons.star_rounded,
                                                                                color: Color(0xFFFFA130),
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'ou55vegb' /* Avg. Rating */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: Color(0xFF8B97A2),
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          StreamBuilder<
                                                              List<
                                                                  PostsRecord>>(
                                                            stream:
                                                                queryPostsRecord(
                                                              queryBuilder: (postsRecord) => postsRecord
                                                                  .where(
                                                                      'rest_ref',
                                                                      isEqualTo:
                                                                          column1RestaurantsRecord
                                                                              .reference)
                                                                  .orderBy(
                                                                      'created_at',
                                                                      descending:
                                                                          true),
                                                            ),
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
                                                              List<PostsRecord>
                                                                  columnPostsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              if (columnPostsRecordList
                                                                  .isEmpty) {
                                                                return Center(
                                                                  child:
                                                                      NoReviewsWidget(),
                                                                );
                                                              }
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: List.generate(
                                                                    columnPostsRecordList
                                                                        .length,
                                                                    (columnIndex) {
                                                                  final columnPostsRecord =
                                                                      columnPostsRecordList[
                                                                          columnIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                    child: StreamBuilder<
                                                                        PostsRecord>(
                                                                      stream: PostsRecord.getDocument(
                                                                          columnPostsRecord
                                                                              .reference),
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
                                                                        final reviewRowPostsRecord =
                                                                            snapshot.data!;
                                                                        return Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                              child: Container(
                                                                                width: MediaQuery.of(context).size.width * 0.8,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                  child: InkWell(
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('RESTAURANT_DETAILS_Column_nh93e0f1_ON_TA');
                                                                                      logFirebaseEvent('Column_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'restaurantReviewsList',
                                                                                        queryParams: {
                                                                                          'initialStoryIndex': serializeParam(
                                                                                            columnIndex,
                                                                                            ParamType.int,
                                                                                          ),
                                                                                          'post': serializeParam(
                                                                                            columnPostsRecord.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                          'restaurant': serializeParam(
                                                                                            column1RestaurantsRecord,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'restaurant': column1RestaurantsRecord,
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    child: SingleChildScrollView(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 40.0,
                                                                                                          height: 40.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: valueOrDefault<Color>(
                                                                                                              () {
                                                                                                                if (columnPostsRecord.userRating == 5.0) {
                                                                                                                  return Color(0xFF3FDF86);
                                                                                                                } else if (widget.posts!.userRating == 4.0) {
                                                                                                                  return Color(0xFFC3DF3F);
                                                                                                                } else if (widget.posts!.userRating == 3.0) {
                                                                                                                  return Color(0xFFDFCB3F);
                                                                                                                } else if (widget.posts!.userRating == 2.0) {
                                                                                                                  return Color(0xFFDF993F);
                                                                                                                } else if (widget.posts!.userRating == 1.0) {
                                                                                                                  return Color(0xFFDF5A3F);
                                                                                                                } else {
                                                                                                                  return Color(0x00000000);
                                                                                                                }
                                                                                                              }(),
                                                                                                              Color(0x8E95A1AC),
                                                                                                            ),
                                                                                                            shape: BoxShape.circle,
                                                                                                          ),
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            formatNumber(
                                                                                                              reviewRowPostsRecord.userRating!,
                                                                                                              formatType: FormatType.custom,
                                                                                                              format: '0',
                                                                                                              locale: '',
                                                                                                            ),
                                                                                                            textAlign: TextAlign.center,
                                                                                                            style: FlutterFlowTheme.of(context).title1.override(
                                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                                  color: Color(0xFF0F0F0F),
                                                                                                                  fontSize: 28.0,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        RatingBarIndicator(
                                                                                                          itemBuilder: (context, index) => Icon(
                                                                                                            Icons.star_rounded,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                          ),
                                                                                                          direction: Axis.horizontal,
                                                                                                          rating: reviewRowPostsRecord.userRating!,
                                                                                                          unratedColor: Color(0xFF9E9E9E),
                                                                                                          itemCount: 5,
                                                                                                          itemSize: 30.0,
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                StreamBuilder<UsersRecord>(
                                                                                                  stream: UsersRecord.getDocument(reviewRowPostsRecord.user!),
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
                                                                                                    final cardUsersRecord = snapshot.data!;
                                                                                                    return Card(
                                                                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                      color: Color(0xFFDBE2E7),
                                                                                                      shape: RoundedRectangleBorder(
                                                                                                        borderRadius: BorderRadius.circular(40.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                                        child: Container(
                                                                                                          width: 50.0,
                                                                                                          height: 50.0,
                                                                                                          clipBehavior: Clip.antiAlias,
                                                                                                          decoration: BoxDecoration(
                                                                                                            shape: BoxShape.circle,
                                                                                                          ),
                                                                                                          child: CachedNetworkImage(
                                                                                                            imageUrl: valueOrDefault<String>(
                                                                                                              cardUsersRecord.photoUrl,
                                                                                                              'https://wpcdn.us-east-1.vip.tn-cloud.net/www.hawaiimagazine.com/content/uploads/2020/12/pineapple-opener.jpg',
                                                                                                            ),
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 12.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Text(
                                                                                                    reviewRowPostsRecord.description!.maybeHandleOverflow(
                                                                                                      maxChars: 200,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                          fontFamily: 'Lexend Deca',
                                                                                                          color: Color(0xFF8B97A2),
                                                                                                          fontSize: 14.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
                                                        Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (currentUserReference ==
                                                            column1RestaurantsRecord
                                                                .userConnection)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        30.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
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
                                                                          10.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'RESTAURANT_DETAILS_ADD_COURSE_BTN_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Button_bottom_sheet');
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
                                                                                  height: 385.0,
                                                                                  child: AddMenuCourseWidget(
                                                                                    restaurant: column1RestaurantsRecord,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        },
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'eqfvuwd9' /* Add Course */,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              130.0,
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .subtitle2
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: Colors.white,
                                                                              ),
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Row(
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
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.9,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'RESTAURANT_DETAILS_Row_sltvojpd_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Row_navigate_to');

                                                                        context
                                                                            .pushNamed(
                                                                          'searchMenuItems',
                                                                          queryParams:
                                                                              {
                                                                            'restaurant':
                                                                                serializeParam(
                                                                              column1RestaurantsRecord,
                                                                              ParamType.Document,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <
                                                                              String,
                                                                              dynamic>{
                                                                            'restaurant':
                                                                                column1RestaurantsRecord,
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.search_rounded,
                                                                              color: Color(0xFF95A1AC),
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '4uic4x0b' /* Search menu... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: Color(0xFFA4A4A4),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    MenuCourseRecord>>(
                                                              stream:
                                                                  queryMenuCourseRecord(
                                                                queryBuilder: (menuCourseRecord) =>
                                                                    menuCourseRecord.where(
                                                                        'restRef',
                                                                        isEqualTo:
                                                                            column1RestaurantsRecord.reference),
                                                              ),
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
                                                                List<MenuCourseRecord>
                                                                    listViewMenuCourseRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                if (listViewMenuCourseRecordList
                                                                    .isEmpty) {
                                                                  return Center(
                                                                    child:
                                                                        NoMenuWidget(),
                                                                  );
                                                                }
                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      listViewMenuCourseRecordList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          listViewIndex) {
                                                                    final listViewMenuCourseRecord =
                                                                        listViewMenuCourseRecordList[
                                                                            listViewIndex];
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              10.0,
                                                                              10.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('RESTAURANT_DETAILS_Container_bo8wjmi9_ON');
                                                                              logFirebaseEvent('Container_navigate_to');

                                                                              context.pushNamed(
                                                                                'menuItemsPage',
                                                                                queryParams: {
                                                                                  'restaurant': serializeParam(
                                                                                    column1RestaurantsRecord,
                                                                                    ParamType.Document,
                                                                                  ),
                                                                                  'menuCourse': serializeParam(
                                                                                    listViewMenuCourseRecord,
                                                                                    ParamType.Document,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  'restaurant': column1RestaurantsRecord,
                                                                                  'menuCourse': listViewMenuCourseRecord,
                                                                                },
                                                                              );
                                                                            },
                                                                            onDoubleTap:
                                                                                () async {
                                                                              logFirebaseEvent('RESTAURANT_DETAILS_Container_bo8wjmi9_ON');
                                                                              logFirebaseEvent('Container_bottom_sheet');
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: EditMenuCourseWidget(
                                                                                      menuCourse: listViewMenuCourseRecord,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            },
                                                                            onLongPress:
                                                                                () async {
                                                                              logFirebaseEvent('RESTAURANT_DETAILS_Container_bo8wjmi9_ON');
                                                                              if (currentUserReference == column1RestaurantsRecord.userConnection) {
                                                                                logFirebaseEvent('Container_backend_call');
                                                                                await listViewMenuCourseRecord.reference.delete();
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.of(context).size.width * 0.9,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 3.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(0.0, 1.0),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 5.0),
                                                                                        child: InkWell(
                                                                                          onTap: () async {
                                                                                            logFirebaseEvent('RESTAURANT_DETAILS_CircleImage_2y9kn0pc_');
                                                                                            logFirebaseEvent('CircleImage_expand_image');
                                                                                            await Navigator.push(
                                                                                              context,
                                                                                              PageTransition(
                                                                                                type: PageTransitionType.fade,
                                                                                                child: FlutterFlowExpandedImageView(
                                                                                                  image: CachedNetworkImage(
                                                                                                    imageUrl: valueOrDefault<String>(
                                                                                                      listViewMenuCourseRecord.courseImage,
                                                                                                      'https://cdn.dnaindia.com/sites/default/files/styles/full/public/2018/06/22/695936-restaurant-thinkstock-062218.jpg',
                                                                                                    ),
                                                                                                    fit: BoxFit.contain,
                                                                                                  ),
                                                                                                  allowRotation: false,
                                                                                                  tag: valueOrDefault<String>(
                                                                                                    listViewMenuCourseRecord.courseImage,
                                                                                                    'https://cdn.dnaindia.com/sites/default/files/styles/full/public/2018/06/22/695936-restaurant-thinkstock-062218.jpg' + '$listViewIndex',
                                                                                                  ),
                                                                                                  useHeroAnimation: true,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                          child: Hero(
                                                                                            tag: valueOrDefault<String>(
                                                                                              listViewMenuCourseRecord.courseImage,
                                                                                              'https://cdn.dnaindia.com/sites/default/files/styles/full/public/2018/06/22/695936-restaurant-thinkstock-062218.jpg' + '$listViewIndex',
                                                                                            ),
                                                                                            transitionOnUserGestures: true,
                                                                                            child: Container(
                                                                                              width: 80.0,
                                                                                              height: 80.0,
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              decoration: BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                              child: CachedNetworkImage(
                                                                                                imageUrl: valueOrDefault<String>(
                                                                                                  listViewMenuCourseRecord.courseImage,
                                                                                                  'https://cdn.dnaindia.com/sites/default/files/styles/full/public/2018/06/22/695936-restaurant-thinkstock-062218.jpg',
                                                                                                ),
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 30.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: MediaQuery.of(context).size.width * 0.4,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  listViewMenuCourseRecord.courseName!,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Lexend Deca',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 18.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: MediaQuery.of(context).size.width * 0.4,
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                child: Text(
                                                                                                  listViewMenuCourseRecord.courseDescription!,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Lexend Deca',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 12.0,
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        if (currentUserReference == column1RestaurantsRecord.userConnection)
                                                                                          FlutterFlowIconButton(
                                                                                            borderColor: Colors.transparent,
                                                                                            borderRadius: 30.0,
                                                                                            borderWidth: 1.0,
                                                                                            buttonSize: 60.0,
                                                                                            icon: Icon(
                                                                                              Icons.add_box_outlined,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 30.0,
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              logFirebaseEvent('RESTAURANT_DETAILS_add_box_outlined_ICN_');
                                                                                              logFirebaseEvent('IconButton_navigate_to');

                                                                                              context.pushNamed(
                                                                                                'addMenuItem',
                                                                                                queryParams: {
                                                                                                  'restaurant': serializeParam(
                                                                                                    column1RestaurantsRecord,
                                                                                                    ParamType.Document,
                                                                                                  ),
                                                                                                  'menuCourse': serializeParam(
                                                                                                    listViewMenuCourseRecord,
                                                                                                    ParamType.Document,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                                extra: <String, dynamic>{
                                                                                                  'restaurant': column1RestaurantsRecord,
                                                                                                  'menuCourse': listViewMenuCourseRecord,
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
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (currentUserReference ==
                                                              column1RestaurantsRecord
                                                                  .userConnection)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          30.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Row(
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
                                                                            10.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('RESTAURANT_DETAILS_ADD_DEAL_BTN_ON_TAP');
                                                                            logFirebaseEvent('Button_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: FlutterFlowTheme.of(context).primaryDark,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return Padding(
                                                                                  padding: MediaQuery.of(context).viewInsets,
                                                                                  child: Container(
                                                                                    height: 500.0,
                                                                                    child: AddDealWidget(
                                                                                      restaurant: column1RestaurantsRecord,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'ck7rh365' /* Add Deal */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                130.0,
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: Colors.white,
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          30.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'ys3x1g8m' /* Deals & Discounts */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              DealsRecord>>(
                                                                        stream:
                                                                            queryDealsRecord(
                                                                          queryBuilder: (dealsRecord) => dealsRecord
                                                                              .where('restRef', isEqualTo: column1RestaurantsRecord.reference)
                                                                              .where('active', isEqualTo: true)
                                                                              .where('expiry', isGreaterThanOrEqualTo: getCurrentTimestamp)
                                                                              .orderBy('expiry'),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<DealsRecord>
                                                                              listViewDealsRecordList =
                                                                              snapshot.data!;
                                                                          if (listViewDealsRecordList
                                                                              .isEmpty) {
                                                                            return NoDealsCopyWidget();
                                                                          }
                                                                          return ListView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                listViewDealsRecordList.length,
                                                                            itemBuilder:
                                                                                (context, listViewIndex) {
                                                                              final listViewDealsRecord = listViewDealsRecordList[listViewIndex];
                                                                              return Visibility(
                                                                                visible: !(currentUserDocument?.usedDeals?.toList() ?? []).contains(listViewDealsRecord.reference),
                                                                                child: AuthUserStreamWidget(
                                                                                  builder: (context) => InkWell(
                                                                                    onLongPress: () async {
                                                                                      logFirebaseEvent('RESTAURANT_DETAILS_Stack_i6t6feb1_ON_LON');
                                                                                      if ((currentUserDocument?.restConnections?.toList() ?? []).contains(column1RestaurantsRecord.reference)) {
                                                                                        logFirebaseEvent('Stack_bottom_sheet');
                                                                                        await showModalBottomSheet(
                                                                                          isScrollControlled: true,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          context: context,
                                                                                          builder: (context) {
                                                                                            return Padding(
                                                                                              padding: MediaQuery.of(context).viewInsets,
                                                                                              child: Container(
                                                                                                height: 470.0,
                                                                                                child: EditDealWidget(),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => setState(() {}));
                                                                                      }
                                                                                    },
                                                                                    child: Stack(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                                                                                          child: InkWell(
                                                                                            onLongPress: () async {
                                                                                              logFirebaseEvent('RESTAURANT_DETAILS_Container_1f0gq9rp_ON');
                                                                                              logFirebaseEvent('Container_bottom_sheet');
                                                                                              await showModalBottomSheet(
                                                                                                isScrollControlled: true,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return Padding(
                                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                                    child: Container(
                                                                                                      height: 470.0,
                                                                                                      child: EditDealWidget(
                                                                                                        restaurant: column1RestaurantsRecord,
                                                                                                        deal: listViewDealsRecord,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ).then((value) => setState(() {}));
                                                                                            },
                                                                                            child: Container(
                                                                                              width: MediaQuery.of(context).size.width * 0.86,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Colors.white,
                                                                                                boxShadow: [
                                                                                                  BoxShadow(
                                                                                                    blurRadius: 3.0,
                                                                                                    color: Color(0x25000000),
                                                                                                    offset: Offset(0.0, 2.0),
                                                                                                  )
                                                                                                ],
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              child: InkWell(
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('RESTAURANT_DETAILS_Row_oc209mgr_ON_TAP');
                                                                                                  logFirebaseEvent('Row_bottom_sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return Padding(
                                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                                        child: Container(
                                                                                                          height: 800.0,
                                                                                                          child: DealPopupWidget(
                                                                                                            deal: listViewDealsRecord,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => setState(() {}));
                                                                                                },
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                                      child: Container(
                                                                                                        width: 4.0,
                                                                                                        height: 90.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                          borderRadius: BorderRadius.circular(4.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 200.0,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 12.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              listViewDealsRecord.title!,
                                                                                                              style: FlutterFlowTheme.of(context).title2.override(
                                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                                    color: Color(0xFF090F13),
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
                                                                                                                      color: Color(0xFF090F13),
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
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 5.0,
                                                                                                          height: 10.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFEEEEEE),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 5.0,
                                                                                                          height: 5.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 5.0,
                                                                                                          height: 10.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFEEEEEE),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 5.0,
                                                                                                          height: 5.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 5.0,
                                                                                                          height: 10.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFEEEEEE),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 5.0,
                                                                                                          height: 5.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 5.0,
                                                                                                          height: 10.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFEEEEEE),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 5.0,
                                                                                                          height: 5.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 5.0,
                                                                                                          height: 10.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFEEEEEE),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 5.0,
                                                                                                          height: 5.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 5.0,
                                                                                                          height: 10.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFEEEEEE),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 5.0,
                                                                                                          height: 5.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 5.0,
                                                                                                          height: 10.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFEEEEEE),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
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
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 50.0,
                                                                                              height: 50.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                boxShadow: [
                                                                                                  BoxShadow(
                                                                                                    blurRadius: 3.0,
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    offset: Offset(0.0, 1.0),
                                                                                                  )
                                                                                                ],
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.6, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                            child: StreamBuilder<RestaurantsRecord>(
                                                                                              stream: RestaurantsRecord.getDocument(listViewDealsRecord.restRef!),
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
                                                                                                final circleImageRestaurantsRecord = snapshot.data!;
                                                                                                return Container(
                                                                                                  width: 60.0,
                                                                                                  height: 60.0,
                                                                                                  clipBehavior: Clip.antiAlias,
                                                                                                  decoration: BoxDecoration(
                                                                                                    shape: BoxShape.circle,
                                                                                                  ),
                                                                                                  child: Image.network(
                                                                                                    column1RestaurantsRecord.logo!,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (listViewDealsRecord.userSaved!.toList().contains(currentUserReference))
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.75, -0.65),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 55.0),
                                                                                              child: Icon(
                                                                                                Icons.favorite_rounded,
                                                                                                color: Color(0xFFB20000),
                                                                                                size: 24.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
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
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ));
      },
    );
  }
}
