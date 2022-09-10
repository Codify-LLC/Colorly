import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/add_deal_widget.dart';
import '../components/add_menu_course_widget.dart';
import '../components/deal_popup_widget.dart';
import '../components/delivery_sheet_widget.dart';
import '../components/edit_deal_widget.dart';
import '../components/edit_menu_course_widget.dart';
import '../components/empty_reviews_widget.dart';
import '../components/no_deals_copy_widget.dart';
import '../components/no_menu_widget.dart';
import '../components/no_reviews_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

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
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  PageController? pageViewController;
  String uploadedFileUrl = '';
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      curve: Curves.easeIn,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(100, 0),
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

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'restaurantDetails'});
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
              width: 30,
              height: 30,
              child: SpinKitThreeBounce(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 30,
              ),
            ),
          );
        }
        List<PostsRecord> restaurantDetailsPostsRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: FlutterFlowTheme.of(context).primaryDark,
          body: SafeArea(
            child: StreamBuilder<RestaurantsRecord>(
              stream: RestaurantsRecord.getDocument(widget.restaurant!),
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
                final column1RestaurantsRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(currentUserReference!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: SpinKitThreeBounce(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 30,
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
                                  alignment: AlignmentDirectional(-0.99, -1),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    buttonSize: 48,
                                    icon: Icon(
                                      Icons.arrow_back_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'RESTAURANT_DETAILS_arrow_back_rounded_IC');
                                      logFirebaseEvent(
                                          'IconButton_Navigate-Back');
                                      context.pop();
                                    },
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(1, -0.98),
                                      child: Container(
                                        width: 40,
                                        height: 40,
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
                                                    ? FieldValue.arrayRemove(
                                                        [whoBookmarkedElement])
                                                    : FieldValue.arrayUnion(
                                                        [whoBookmarkedElement]);
                                            final restaurantsUpdateData = {
                                              'whoBookmarked':
                                                  whoBookmarkedUpdate,
                                            };
                                            await column1RestaurantsRecord
                                                .reference
                                                .update(restaurantsUpdateData);
                                          },
                                          value: column1RestaurantsRecord
                                              .whoBookmarked!
                                              .toList()
                                              .contains(currentUserReference),
                                          onIcon: Icon(
                                            Icons.book,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 25,
                                          ),
                                          offIcon: Icon(
                                            Icons.book,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 800, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
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
                                          unselectedLabelColor: Colors.white,
                                          labelStyle: GoogleFonts.getFont(
                                            'Roboto',
                                          ),
                                          indicatorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                          indicatorWeight: 4,
                                          tabs: [
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '4y3mz4hi' /* About */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'ef9g5yx2' /* Reviews */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '4g2xfy63' /* Menu */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                's3ptpx9y' /* Deals */,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            children: [
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 350,
                                                          child: Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1, -1),
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: 350,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxHeight:
                                                                      350,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            20),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            20),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0),
                                                                  ),
                                                                ),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final gallery =
                                                                        column1RestaurantsRecord
                                                                            .gallery!
                                                                            .toList();
                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          500,
                                                                      child: PageView
                                                                          .builder(
                                                                        controller:
                                                                            pageViewController ??=
                                                                                PageController(initialPage: min(0, gallery.length - 1)),
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        itemCount:
                                                                            gallery.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                galleryIndex) {
                                                                          final galleryItem =
                                                                              gallery[galleryIndex];
                                                                          return FlutterFlowMediaDisplay(
                                                                            path:
                                                                                galleryItem,
                                                                            imageBuilder: (path) =>
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(20),
                                                                                bottomRight: Radius.circular(20),
                                                                                topLeft: Radius.circular(0),
                                                                                topRight: Radius.circular(0),
                                                                              ),
                                                                              child: CachedNetworkImage(
                                                                                imageUrl: path,
                                                                                width: 300,
                                                                                height: 300,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                            videoPlayerBuilder: (path) =>
                                                                                FlutterFlowVideoPlayer(
                                                                              path: path,
                                                                              width: 300,
                                                                              autoPlay: true,
                                                                              looping: true,
                                                                              showControls: false,
                                                                              allowFullScreen: false,
                                                                              allowPlaybackSpeedMenu: false,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            250,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00EEEEEE),
                                                                  ),
                                                                  child: Align(
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
                                                                              .start,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                    child: Container(
                                                                                      width: 60,
                                                                                      height: 60,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFF46C632),
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 5,
                                                                                            color: Color(0xFF292929),
                                                                                            offset: Offset(2, 2),
                                                                                            spreadRadius: 2,
                                                                                          )
                                                                                        ],
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0, 0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                          child: Text(
                                                                                            functions.getAverageRating(restaurantDetailsPostsRecordList.toList()),
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                  fontSize: 30,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 4, 0, 0),
                                                                                    child: AutoSizeText(
                                                                                      valueOrDefault<String>(
                                                                                        '${column1RestaurantsRecord.reviews?.toString()} reviews',
                                                                                        '0 reviews',
                                                                                      ),
                                                                                      textAlign: TextAlign.end,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Lexend Deca',
                                                                                            color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        if (column1RestaurantsRecord.isSubscribed ==
                                                                            true)
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    if (column1RestaurantsRecord.highlight1 == column1RestaurantsRecord.highlight1)
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(50, 20, 10, 0),
                                                                                        child: Container(
                                                                                          width: MediaQuery.of(context).size.width * 0.3,
                                                                                          height: 40,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Colors.orange,
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 5,
                                                                                                color: Color(0xFF292929),
                                                                                                offset: Offset(1, 1),
                                                                                                spreadRadius: 1,
                                                                                              )
                                                                                            ],
                                                                                            borderRadius: BorderRadius.circular(99),
                                                                                            shape: BoxShape.rectangle,
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0, 0),
                                                                                            child: Text(
                                                                                              column1RestaurantsRecord.highlight1!,
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 10, 0),
                                                                                      child: Container(
                                                                                        width: MediaQuery.of(context).size.width * 0.3,
                                                                                        height: 40,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.orange,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 5,
                                                                                              color: Color(0xFF292929),
                                                                                              offset: Offset(1, 1),
                                                                                              spreadRadius: 1,
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(99),
                                                                                          shape: BoxShape.rectangle,
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(0, 0),
                                                                                          child: Text(
                                                                                            column1RestaurantsRecord.highlight2!,
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Lexend Deca',
                                                                                                  fontWeight: FontWeight.bold,
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (column1RestaurantsRecord
                                                                      .isSubscribed ??
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          10,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              2,
                                                                              2,
                                                                              2,
                                                                              2),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/Colory_Fire_Badge-No_Lines.png',
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            100,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (stackUsersRecord
                                                                      .superAdmin ??
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          70,
                                                                          10,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 30,
                                                                    height: 30,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      shape: BoxShape
                                                                          .circle,
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
                                                                              .center,
                                                                      children: [
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30,
                                                                          borderWidth:
                                                                              1,
                                                                          buttonSize:
                                                                              30,
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.pencilAlt,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            size:
                                                                                13,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('RESTAURANT_DETAILS_pencilAlt_ICN_ON_TAP');
                                                                            logFirebaseEvent('IconButton_Navigate-To');

                                                                            context.pushNamed(
                                                                              'editRestaurant',
                                                                              queryParams: {
                                                                                'restaurant': serializeParam(column1RestaurantsRecord, ParamType.Document),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'restaurant': column1RestaurantsRecord,
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (stackUsersRecord
                                                                      .superAdmin ??
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          110,
                                                                          10,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 30,
                                                                    height: 30,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      shape: BoxShape
                                                                          .circle,
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
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              5,
                                                                              0),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30,
                                                                            borderWidth:
                                                                                1,
                                                                            buttonSize:
                                                                                30,
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidImages,
                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                              size: 13,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('RESTAURANT_DETAILS_solidImages_ICN_ON_TA');
                                                                              logFirebaseEvent('IconButton_Upload-Photo-Video');
                                                                              final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                context: context,
                                                                                allowPhoto: true,
                                                                                allowVideo: true,
                                                                              );
                                                                              if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
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

                                                                              logFirebaseEvent('IconButton_Backend-Call');

                                                                              final restaurantsUpdateData = {
                                                                                'gallery': FieldValue.arrayUnion([
                                                                                  uploadedFileUrl
                                                                                ]),
                                                                              };
                                                                              await column1RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                            },
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        20,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                column1RestaurantsRecord
                                                                    .restaurantName,
                                                                'No Restaurant Name',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 5, 0, 10),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            20,
                                                                            0),
                                                                child:
                                                                    AutoSizeText(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    column1RestaurantsRecord
                                                                        .priceRange,
                                                                    '\$\$',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: Color(
                                                                            0xFF39D23D),
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
                                                              Container(
                                                                width: 300,
                                                                height: 20,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryDark,
                                                                ),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    column1RestaurantsRecord
                                                                        .categories,
                                                                    '-',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: Color(
                                                                            0xFFA4A4A4),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.95,
                                                                    height: 30,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        column1RestaurantsRecord
                                                                            .restAddress,
                                                                        'No Address',
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
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 10),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                buttonSize: 48,
                                                                icon: Icon(
                                                                  Icons
                                                                      .phone_enabled,
                                                                  color: Colors
                                                                      .orange,
                                                                  size: 30,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'RESTAURANT_DETAILS_phone_enabled_ICN_ON_');
                                                                  logFirebaseEvent(
                                                                      'IconButton_Backend-Call');

                                                                  final restaurantsUpdateData =
                                                                      {
                                                                    'phoneClicks':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  };
                                                                  await column1RestaurantsRecord
                                                                      .reference
                                                                      .update(
                                                                          restaurantsUpdateData);
                                                                  logFirebaseEvent(
                                                                      'IconButton_Launch-U-R-L');
                                                                  await launchURL(
                                                                      'tel:${column1RestaurantsRecord.phoneNumber}');
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                buttonSize: 48,
                                                                icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .mapMarkedAlt,
                                                                  color: Colors
                                                                      .orange,
                                                                  size: 30,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'RESTAURANT_DETAILS_mapMarkedAlt_ICN_ON_T');
                                                                  logFirebaseEvent(
                                                                      'IconButton_Backend-Call');

                                                                  final restaurantsUpdateData =
                                                                      {
                                                                    'mapClicks':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  };
                                                                  await column1RestaurantsRecord
                                                                      .reference
                                                                      .update(
                                                                          restaurantsUpdateData);
                                                                  logFirebaseEvent(
                                                                      'IconButton_Launch-U-R-L');
                                                                  await launchURL(
                                                                      functions.getMapUrl(
                                                                          column1RestaurantsRecord
                                                                              .restLatLong));
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                buttonSize: 48,
                                                                icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .globe,
                                                                  color: Colors
                                                                      .orange,
                                                                  size: 30,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'RESTAURANT_DETAILS_PAGE_globe_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_Backend-Call');

                                                                  final restaurantsUpdateData =
                                                                      {
                                                                    'websiteClicks':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  };
                                                                  await column1RestaurantsRecord
                                                                      .reference
                                                                      .update(
                                                                          restaurantsUpdateData);
                                                                  logFirebaseEvent(
                                                                      'IconButton_Launch-U-R-L');
                                                                  await launchURL(
                                                                      column1RestaurantsRecord
                                                                          .website!);
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          if (column1RestaurantsRecord
                                                                  .isSubscribed ??
                                                              true)
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30,
                                                                  buttonSize:
                                                                      48,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .ondemand_video_rounded,
                                                                    color: Colors
                                                                        .orange,
                                                                    size: 30,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'RESTAURANT_DETAILS_ondemand_video_rounde');
                                                                    logFirebaseEvent(
                                                                        'IconButton_Navigate-To');

                                                                    context
                                                                        .pushNamed(
                                                                      'videoTour',
                                                                      queryParams:
                                                                          {
                                                                        'restaurant': serializeParam(
                                                                            column1RestaurantsRecord,
                                                                            ParamType.Document),
                                                                      }.withoutNulls,
                                                                      extra: <
                                                                          String,
                                                                          dynamic>{
                                                                        'restaurant':
                                                                            column1RestaurantsRecord,
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          if (column1RestaurantsRecord
                                                                  .isSubscribed ??
                                                              true)
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30,
                                                                  borderWidth:
                                                                      1,
                                                                  buttonSize:
                                                                      60,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .fastfood_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    size: 34,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'RESTAURANT_DETAILS_fastfood_rounded_ICN_');
                                                                    logFirebaseEvent(
                                                                        'IconButton_Backend-Call');

                                                                    final restaurantsUpdateData =
                                                                        {
                                                                      'orderNowClicks':
                                                                          FieldValue.increment(
                                                                              1),
                                                                    };
                                                                    await column1RestaurantsRecord
                                                                        .reference
                                                                        .update(
                                                                            restaurantsUpdateData);
                                                                    logFirebaseEvent(
                                                                        'IconButton_Bottom-Sheet');
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
                                                                          padding:
                                                                              MediaQuery.of(context).viewInsets,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                400,
                                                                            child:
                                                                                DeliverySheetWidget(
                                                                              restaurant: column1RestaurantsRecord,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (column1RestaurantsRecord
                                                            .isSubscribed ==
                                                        true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 20),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            20,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryDark,
                                                                  ),
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          StoriesRecord>>(
                                                                    stream:
                                                                        queryStoriesRecord(
                                                                      queryBuilder: (storiesRecord) => storiesRecord
                                                                          .where(
                                                                              'rest_ref',
                                                                              isEqualTo: column1RestaurantsRecord
                                                                                  .reference)
                                                                          .orderBy(
                                                                              'created_time',
                                                                              descending: true),
                                                                    ),
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
                                                                      List<StoriesRecord>
                                                                          listViewStoriesRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      return ListView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        itemCount:
                                                                            listViewStoriesRecordList.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                listViewIndex) {
                                                                          final listViewStoriesRecord =
                                                                              listViewStoriesRecordList[listViewIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8,
                                                                                0,
                                                                                8,
                                                                                0),
                                                                            child:
                                                                                StreamBuilder<RestaurantsRecord>(
                                                                              stream: RestaurantsRecord.getDocument(column1RestaurantsRecord.reference),
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
                                                                                final columnRestaurantsRecord = snapshot.data!;
                                                                                return InkWell(
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('RESTAURANT_DETAILS_Column_ubdczavb_ON_TA');
                                                                                    logFirebaseEvent('Column_Navigate-To');

                                                                                    context.pushNamed(
                                                                                      'storyDetailsCopy',
                                                                                      queryParams: {
                                                                                        'initialStoryIndex': serializeParam(listViewIndex, ParamType.int),
                                                                                        'restaurant': serializeParam(column1RestaurantsRecord, ParamType.Document),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'restaurant': column1RestaurantsRecord,
                                                                                        kTransitionInfoKey: TransitionInfo(
                                                                                          hasTransition: true,
                                                                                          transitionType: PageTransitionType.bottomToTop,
                                                                                          duration: Duration(milliseconds: 200),
                                                                                        ),
                                                                                      },
                                                                                    );

                                                                                    logFirebaseEvent('Column_Backend-Call');

                                                                                    final restaurantsUpdateData = {
                                                                                      'storyClicks': FieldValue.increment(1),
                                                                                    };
                                                                                    await columnRestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                  },
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 80,
                                                                                        height: 80,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: CachedNetworkImage(
                                                                                          imageUrl: valueOrDefault<String>(
                                                                                            column1RestaurantsRecord.logo,
                                                                                            'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFBcVFBUYGBcaGyEdGxobGxwkGx0dHR4eHSAYIBohICwkGx0pIB0aJTYlKS4wMzMzGyI5PjkyPSwyMzABCwsLEA4QHhISHjApJCkyPTIyMjAyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMv/AABEIAMIBAwMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAAEBQIDBgABB//EAEwQAAIBAgMEBQgGBwcCBQUAAAECEQADBBIhBTFBURMiYXGBBjJSkaGxwdEjM0JysvAUYnOCksLhFUNTk6LS8QdjFiQ0g7MXNUTD0//EABoBAAMBAQEBAAAAAAAAAAAAAAECAwAEBQb/xAAqEQACAgEEAQMDBQEBAAAAAAAAAQIRIQMSMUFREyIyBGFxFIGhsfCRUv/aAAwDAQACEQMRAD8A+j4BhcFxXAI0BB46GsvtLCdEyiQbbCRmnqqTqjc0kiD9kkHSa02BX6zvH4TVaIj2/pFViqgAkDTMsGOU6Us9NTQ2nqODMm+hMzxmd87zMfaGhMb4DjUEEHFoQCRvHdu7t27TlHZGZ9tjZTWCCOtbOitO7iEZuEfZfhu3UtIkR4aiJ13RwIOhHAkRoVI4pJp0zujJNWjLYnGXLegydmh3cONG7MxVxrYdjz0A/Wio7VwnVkbgfYd357uEVfsBJtoP1m/EafUS2polCT3NNjBHY8D6/wClX2Q07+A+PZ2UStmoYQEsZEGBPrb5VOijaL7Ybn+fVXWVeJmf+e6ikSvcInUHj7zTVkRlF0tlOvu591SFs8TVuJTqnw99X9HWrJgG4hkCSN/juqQQ86vdOuo7D8K9CUNoUwMocx15c+XfU1Q8zVyLq3f8BU8tCg3gCXPvJn1VLPAk8N9EW00qFxPhRrBilXBqROgPIj5V5ctxqNK8uBogRv1+dDgIQlBY7EFj0VvVjox4RxX3yewjWGAKs3OG4wKjhsKlvNkHnewaaDs0Hs4AAUg0sk5pvB7gsMLYyjU7yeZ+A1PrJMkkkmopuqxaDdhSo8YVNVr1LcmiUs60rY1FaWuFErZomzh+NVYzH27SliRpxJ0HzPYKFWByL1tKgltBSfbXlFbtCJg8FHnn/aO2s5tbyouXJFqQP8Q7/wB0fZHt7qzbtBJJljvJ30bS4Mot8hu09r3b2h6qeiDp3txY/nSl0Kup1P59VG4TZ1y7qoyr6TfDnTnC7Ht2+GZvSb4DhU56qiWhptmdWxdOottHDQ11bPJ3V7Uf1D8FvSXk0+EGl3vH4apZPoz3L7qvwx6t3vH4BVZ+rbw9wr3DwwzaJHRMHEjKdDXz9rR6NXHmkD90xoDPDgCeeU6Vv9rD6Ju73kVltkJNrLvBWOz1Go6mmpotpajgxK9vPK+kPaNx58xz57iaF2PbIVQBrnb3tp40zxmz2tAcVP2gNzevnu110G8A0LYSNd0vMjtzGuSTajtfTOnDluXY1t6io5D0k8Mgn1tHurkuGSf4v93z7e+rx5/KUH4mpUxpIIQVLBr1fFvxGqMFcOobzlMH4HuIonCr1f3m/E1USyIzzGp9GfD3iiMlV4wfRt+eIogmj2KB3F+kT7rfy1dlqF4DpLfc38tXEUAoW3bZcOqlIJGYOhYEHhEivcMkAoLfRqo6pGTKe5QZHiK9e1NzNAOVhvZh9mdAND41aMICv0hzwwIJABHqighrwRsI2XUg6mIEaToDqZPbXt4aeIq7Dr1R+eNRxK6ePxrVg1lTJVJgHU793frpRN58qloJjgKHw1tiQ1wanUD0RuAjh/XXWa1Ys27NHNa4ivFfWOO+ixboV7Ws+HhJpZOuBkrZao0FE27dV4ZZMHf+dabWMPGp3Ut2Z4KLFiiyFQS3q40t2pty1YETLcANWPhwHafbWK2pti5ekMcqeiDv+8fte6jhcgScuDQ7a8q1WUtQ57D1B3t9ruGnbWOxmLa4c1xyx4DgOwDctTw2CuXDFtdPSOijx+VPcFsG3bg3PpG7fNHcvHxqU9VItDSEGGwN275ohfSOi/NvCnuB2Jbt6sOkbmdw7l3eumrb+4VwFc8tSUi0dNI8O6qstWmolaSh7K4NdU9a6jRrNFYP0d38/YFcPNbvA91RtfV3vz9gVK35p++P5a+iR8+GbX+rPh76yuw3HRjQ7hwPKtVtj6tvCszsZTkWPzpSjheIMypBKka6GPdSe5gyLZygx0kg7z1Q8rHEwunx4u73GobOb6v9t/8A0qOrBOikJtCRDuiJHtB4dxom3GYROqceHXfTdV209n9E+UGVIlTxiYg8z28Z51Q29D/2/wCd65JJp0dialVE7d5ozQgExJZuca9WisKlwhoCxneJJnz27KFwdxSpQ82B/iNG4G7545XH/GT400MizwQulzbuyFhSV0J3iDy7a8bCm5cuSFlWAOp1lQfjVtz6u/8AeJ/0rROHP0l37y/gWnRMXrhytxUWBGY8SNQvbVxS5ny5l82dx5xzq1/rl7j7hVk/Sj9mfxChQyYucOLhC5SSdZJA0XU7jVrXWWA6ESY01Ex2a9u6rD9cfH2rV+KGtr7x/wDjY0KwayjBuCuhGhIPrNdj2ATNwGp8K57Cm2p805wMw0IBeDry76hdDZNRmU6hojdzHDv3HsrZrJiWGLkZmGWdQOMcJ7a5l669xo0aiqHt/SL3H41pGR6qV5hrWYkRuPzo9LGknSkmO2x0Jdba5i3WDfZAkiSfA/0pGhk/ATictppZlAGup3dnjrFIdq+U1y51LXVXnx8Bw7z7KCa8bl5S/wBIx1080ASTpxgTVaYO3nYuSiZroLLvDA51EQZ6i3W3R1I4wZuSisDqNtJgiWWYnexJEnfqxgEnvPv5Ux2HYSFuMMzFQwVgIGYcV5jceRoa2jK6l1C3gbIVF83KUfMd5E9fFcfsLv8AtV4e4yAXEA6TIWvg7lPTMXA13AnE7p8xeyZSbfB1KKRqkG6vTz/PCo2nzAEbv+QfbV2Td3fKpKJrKsvx+FRYVeF1Hj8K8ZK201lFcRVwt1Lo6JrBINdRXQHgPbXVgWNV+qveP4BU7Xm/+4PetQb6q74/hFTw+4ftB7xX0J4QVtj6s/ngaz+yHHRjw91aHavmfnkazGxUItrqI/PbSjhuJc6ivNljW3+19/SV2I40Kt8W7eczpcG4Sd7jTjx4VLU4Q0TTX0EkMoZCoBHi9ZzG4UJcCqSVCDXsZ3gGOO/1UVZ2oH80XTOm5ucDh+Z7a69igCSbbHqjMews0A6cwT41OaUkUhJxZl9oC4hLW2jrtO70m502sz0lzLqQ76DfAYk6Rw+NMhdUz9GTry4+Iod8eidIejIys2YjsaC0xrJpIx2saU3IpOIBW8v6pb/Qu7nVt/FrauN0jZekyld5nq9nYKk2LUq30TFVUsdZXzQYJEgSIFCYnalrIXa2xCxzJ3kCNOw+FNQNzL8biktuju0AmAQCZzLIECTrXXNo2xcVi2hUgHKdTmXdz460Pdx1sW1udGSsjidJHnaAwOBNBDbdttFtsxDFQAxOoyyAYjjw5Glz4MpDDE4opdzBC8ZSYKgxDcCeyjBiRcW2RI6+4jXzWEd9DOBkNyJIgFQTmB3w0jSAZ8aT2Nt22vmz0bJ1c3SMYQ6gb+9hSOVPbX8lIwlJWujRgFraj7AuQ07yekiO7tFE7XT6FxGkEew0j2XcS/a6RdB0nRkTJkuFzGDGsz/zTLE7IyozlpAExB19ta5Vx15M1Tp+S6yhR+jO4+aT+E9o9tSx19LToza6EQN8mYFLr+BVZhswA5EbvGl2NJS2lzJOZgIk6Bgxnv09tK78Dclu0tqvcOUnKsxlXunrHl3UnxLsxtDdOHkjWNC53dwI74oixii4kWyPH+tXXwyxKr5oJzMQ0ywyxx3e2lakxlJR6BcKktYK9SLZzduRmzD94KR+9V2ZUZ3dM9vPeBSAZOR2za/qJcT/AN3toVdpHNHRzBA3847e2jCzJczWwGug3gF4FYzE7x/eLZXfuc94lKLSyPGW6SKb1pluKjnPcJskXI3AK0rO/XJd/wA7tNCLalSBoUtnpDH1sXTm78xS5v8A8btNXoAAEtnNaLWSzneCFGUcN+Sxw+2fCtHXKofRFQiyR9qLgyz/AA2uXnHwmdNjjYpnpIAA6RsqxqODetgW/epuqyfX8KztraVq09y7euLbMkMCeEIFMCSTAX10NjP+oOGVS1tXuwQugyiWkjVtY6h4UYxk+EJJo13R6ju+Vc9scTXzLGf9QsQ6MbaJbhlXWWMMHPGBPUHCs/jdsYm6SLl+4w5A5R6lgVT0W+cC7kfWsbtvDWfrLqL2FhPq3+ykGM8v8ONLavcPYsD1tw8K+bCyo3kD1TXtoKWCgyTTx+nj2ZzNy3l7fO60I4dc/wC2urM9FHL1V1P6UfAls+4Xfqbv54CrMLuX9p8ahiPqrn3vlUsFuT9ofjXpnkhu0vN9f4WrObEH0a1otpbvX+Bqz+xT1F7qUcIxBGtLcQT0DEbxcn1M9M8RAkClmJeMPcPK4d/e4qWpwNDkL2fiVABIMgKTHY8kd+nsq7F3VJufrIkeD3KW7MuyCDrmWAJ5ax2bqIxRhvN+wNeX0lz3/ClvBSsjSzBzfeNLbIJN0QCM76HcT0h3+qKMwLkiTEfGqcCRnuiP7x//AJGrPlGQJYt3baXlyoEe1oARCsqEmF4gxS3auyLrJkULwkZgAdWJ9+7dwFPtpxlICj6t47Jtv8vbSTamz7mUWwEPUUtlnm5HLmPGhTMmNNoMHC5ZUdVW83dlcMvENwieQrPrsoIRk6yiSc4QljA00OmoOu8RTXZWHuKiStrMXmGByqDbJ4RB4eJpb5aKVtl26M3H1HR5p3FdxJiZ4eiaO1s26snqrikD5LgYOZyMgy6ADzlObhHgKCxGzGZ2eCDqFgKAFJUkRHWMqNSf667yewoNi07g5kBABkFTqp057xRe1H0Hj8Kk/p1d2dEfqJVaSX7GY2dcazaFsWyQHDsSSASrh92bKkwBoO2jcXto3FZWlTuCiCPEyKfYl5Uj87xS7adtit3IQGK9UkaBiuhI4iaPptKkxZSzbEuJ2naBAe60ncCEG/dpn0HbR21UAsoOTJ+G5S7ZHkfYsLmZRdvHV7twSzMSJIBkINTu15k0w2rbiyoAgDowBwAyXBoOAoKCjbA5uVWAYB+rlHHefbVeOBe5aInL0ZOve49dW4Bfh7m+VTxEK1oExKwPFm+dFIz5AEsjTTiPZFE4lWNzLbOW4WvFX5LopX+Nrbbv7v1yaAB3j3xUNpIrMUc5bZuXZbkcpAHirOf3ajqoppv3IBS6rQ9sZbQNrMnMkCD4ZrfH+79ddlhKEjMrj6NfQm4sD1Nb/gqbsWZXcRcHRZE9IQ0n/Xc/hqOEfJcFz7Rlrg9EC5Jj1tz3VzpHS2KPKK19FeVlzOIbN2ZrenqIHhWew2ybjYV2W3czdJbgFSBlCXJMkbhm1PdW5tbWS1mUqzW2fzkAJBIDHQkaaR4iqcdt225Nu3h7mViCuYoN/VH2mMcfGqR1JRVJCOKbyzIbP2Bde1cLG2h6S3EuDplugzlzRvFFrsfLo91QdNVVjMgGdcumvGntq+6C4tuysEliGbMQVkagAadY1RYx11SYNkRu6rGTlWAJnkKWerPnCKQhG6WQNPJqz1mPSs0E+coEweGUmPGtRa8lcPbDkW4y8d/PfmkcKz2EuYi+ouBgCVBhQFGoGnVQCOtzq7D3sXcu9EWgtJYu1xkEAwcocTwG7jUpTk37pD7FXtQ0/QuSW/8AKt/7a8oHF4HEo5XpLWkfY5gHlXVLH/r+xs+D6bi/qn++B7VqWzt1v77e9q7HD6PvuL+NK92cNLf3mPtNfRHzwXtHd4H8JrPbKHUWtFjhoe4+6s5su1KiaA4ZiKT7RP8A5W99/wDmNNr6wPGlGM/9Le++fxGpavA0OQfAP1VjcVO/lDUwxZ+kUc0//Y3zoLZKghQeK+0hhR2LAzg8l0/jb5UnRV8jXBjQ/nhQeC+su/tH/GaLwx84d/smhcF5939pc94ovlCk9poYYx/dvP8Al3P6VRjMKzvFu66noxBItySDuPV5Tu5UVtLzG1PmPpz+jakeMv2+kG4qLfpKQ0XCDEkAzv7u6t2H8BGGtXOjINx5W4ZZRbmApWNVIjdwnTvpLiLLLi1dg7hZfM5TdaUtIVANcxUCY1NN2Nq3a1NoqLh3wUnI8Ak7jpS7ZmHsP0622U3WWD0bqCMyqxA1MDMGECNARVYcENR02xudsrbwy3evDuxEDXrszDTOI9frpfb24t7RelkEDUDjP/cPKvMfgm/Q0UsVyPBJ1MjMI37zSvZSRoDPWWTEb8w19ddSgtloh6j3VZo9mYprpY/SgI5QhiIzDeDDH401xyQH4/8AFZryew9y0i283VNzNGm7KeR03VqsWNH7/hXNrJptHRoStciwG+wYlbdpeAYl3iRq2UqqHsDN31VtQzaWSp1t6ruIy3NRqfea829Z/SkuYNGZdFNxxIAVnB6ORqWYAyBuU6kSJrxtsJZCyCE6MSNxARh+dTUWsF08oBwzgRPGpYxA1y0W3wY8HavEUZl7zU9pW2zWivD3FmpRnyUtaAk93vFe7RKhibgm2LlwMo3kkGDw4Bxv4+r24d/h767GkrcLKMzC5cATmCNT4QPXUdQrD5IWOCMoczcYW+jYblExr45uB31Q6E5lXR1V+kPBhOoH/A31eluRkSXDhM5GpTrbtPH1VB7eb6MyFU3MhG9yDqsfxfw1A6AdkUnOB9FnAyccxTf7V41G1Zy5Q2rOqG2fQ62k+tee6jFDZxcKxdzqBb5jJqfCW/hqsW4Ujg6L0h/w+uZ7ozPv9CtYGiq7m6ypHSKLmdjubUae0ct1XWtj4kZrgt2rYGhViM0ZZ0glR9n1GqcYBlKnRF6XI3pHiD63/hq25tjFlGBXrMFlYjqwJYGRrqdx4UaTXALaeGLLC3BZw5i0/SIiqcrQsAQGIbU68p6pou9tfFYS5awoFpC4OUqsqFlokMQfs1n7PlGiW7dvJKJlk5X0dYG8EAnztN0xRC7cS/eFw27bNaXMjEXdymYChwrHVzB35Yrei79ywZ6iqkz6B/Z2OaGW7bKkAgiypB03g59a9r50PLzGYYLh1W0RbVVBZXmAoifpOVdR/Sx8IX1ZeT7di1lFHO4PYw+VS2cnVt9xPtpdirlzLq+UhtJyjTnrr7aETHKoAa4WgbgSR7dK9F6n2PNUGaTFkSQSNx40gwVtwACrDT0T8qExm30tozrbnKsxIExrRGE2vaZQSoBA9IcfGl9RDenIIuo3onfyNLb1s9BdBVozkwFMkZjuFEYfa1u5cZDbiIIOaZB7tx07aKL2/QoP3rBqcXkSYa0wKnIyjMBEGQMxEeAIorGA5hodx4frN86Jv4pUg5RBOteYm/Nm4Ry/mmleMDqWQrDHT1/GqcJ5939o9AbPx+Y5BpodSRxFF4a6oe6CdTcaK15Q1UG7Q8xvuP8AgasvtJTbyKgOi6b2PnNBlpM9s0TgsV09/E3ATkS21tJ7VMkDhOX2ijr1xZIkeYACI/W7e2lll4Hg6AccgXBy8gm4pMk+dkbjOg31862rhr9wq1hnWS0spubgJ3KDOk6xwOtfU8VeQ2A0iM4O8bzbfTfWWw734m1hmuAHRswXz+plgnWdfXTQvclbFnW1ulyHbBwl/orWGZSQB9KzodSJiC0Gc0jTXU7orQYvBhLdtFQDKwJgDnqdN2+Z76ATEXQA9xOiuMpLp1SfPcxImd9WHK9t1LdRjlKkIVYQJBXLrvqy1mvbkg9NN2W2rr9KqNuKXDBykAqEYQ2WRlDEQN+enWJnrgkEz4wBHypM11ZUhjp3bojQ5dOHqry7dUtmLE98TpqNY5wfCllqX0NGDQRjE6a1cts5UOGQskAgMp1B59tB4+2FQqPNXowO4KY140Rh7Vy6xFt9wk6+G+K8u3ASQxJ1G/XcI981NzxQ6WRRmACntHwq7HgHou4/iNFXb1pAM5AkwJjfE+4V61+0QOsDHaOfCp+oim1voWud/dXY+7kuqRlDG84BYwIykkeMAeNMBirJOUMCYmARMbq8xXRuTmUETMHXhr4mklLdwPG08ozF7HsPpbdu2EULnlnDrJygqMxDCfu6RvqVjazp9Ilpeqd3TPBLaTlysIJPb7Kb3bVr0QPDlVDm1yPdRX3Vhcn0I8F5XlroRbdyVBb6wFQBJMk5TwOnHkarbyqS2zu4uZWOsph2XeSNVBaNTBbnzrTbLwK33yJAMFiWmABGvrIqrFqLdx7bb1IHZIUaj3+NB1eULvaRnsV5V2b+oMCft23Zd0Hhx148TXr+WiqgR2S4DyBWANwgg8DWl8pFT9Bu3AqZ0UFWCrM5lG/xNfIMdjWuIVdU0GbMAZkRpv7TVlpxfFirUlVsY/pWFgdVCYXNLXOsw1LkBgJJ13UauNw6iVDBdTl6UkTqwgZdBPAcKydggACNZjtnWpNcWdA2vdyGm+hLTd8spCcWrdG2/ta0d7D3+0oJrqw+Zebfwj/dXUno/dj74n2Z7zMZZiT2moTUr2GvLusXGM+bBU9upU+6icNisQBlt4G6hO9hcE+trfup4xb5IOSXAh2zffMiK1pUaQ/SOFEd8z6pNW2tn4cDpHxd24uhK27iLbWdILswYjQ7oOlabDYnFoDnwt25P+Jft6dg6ggUg2zhbl68C+BxDFQG+juSmm7rqsBhG6Zqm1InvbDrWNwKEG3irK7pzOjEgbxmYkjvqvZ23LQz9LjMOQWlQtxMwEDq6vBEzHGqsb5SXLaAtg7toaDOxt9wlnXf2ml2E8qemQlS0TB6TJm7lyqFUbtYJocIHeR1idv2XQi2wYLHBGJ7it0he9gKJsXWNi6WI1UwBuAldJ+0e3TupA/lCqiBZtQB7u3jRy4u4LhS4FSQhIMRDAMAPEqPWKlOaWWUjpuTVHWXKq75iCAAAN8nTfw0os3v/MMJ+1u8BS68zXJuM65HfieP2ix4aMvrovogbxudJbyyI6+u7fFLCW7nyPOKX/BT5GSbl3M5kByFAEGUuakk9Ub4C67p0rUYPQ9YXAMoiGJ4sSCdOY9tA+Tezrdi3cDPbNwlyCrToVMcN+reuniNa0Idd3p08YIkntOFtWtOmd1BKgkgneHECqdmYZLYypcYiQTIO8GQZ76YobZUgMp1G7x7O2pWwByq0NPtMWWpigDbFzroJ3gSTyGf5z4Upd4A0MFzEdy+3f6qb7YMuoAklRHjnHxpfcwzBMjCfHTX3Usl7smiWpYAt9I5KgkgCNdOO/8AMVV0lrm3sqy5hVt4G2iggBm3szHVj9piSfE0nzjnQk6GirG1vHLbnIzgkRIjvqr9Kt/rUvRMxiVB7WA99diLYQSblo/qi4hb+GZPhSPI6DRjLQZWhjlnfHER+e6meAwzYhWZFAAMSSBJiYGnd66ybXl5im2yfKI2LbquUywIBJkscqZRHgfDtpHVZGp9Eb6oHObOGEqRppB1G7mKi2LtKQrOQTMSRw38O0euhWxHSOWZ0DMc2rAAljOknXfReEt20uZrlywVKkEG4kg7wQpMk6RpzpNvgZyrkmDabix7iPlULlqyPOdh+8vyoK7tjD70tuw4EWHjwlRSzE+VGHtnKyuh4A2iPVI1oNzWEhkovk0OBFr6y3cucRIaOwjzQarfZtsklnuljvJZZnnOXfS/Y+OS6me2ermI3Rrx0pk+IVYzMBJgSQJPIczS7m+Q7V0WX8Pbaw9g58j6EyM2hDaGI4cqzj+R2E/7vLzx2fq9lPmxCekPWKrS9bdsouWweALqJ7pOtMpyXDBsiuhB/wCEcGCTF3Wft8/3agfJjBz5lz/MNaW/g2AnPbj9og97ClL4lPSHrpvUn5Nsj0hX/wCGMJ6L/wAZ+VdR/wClJ6Q9deUd78m2/YMxh2jiEuWlyKAVgqWQxB0z5ZbXfuAIrWbD2ibdq2mKuWluoMrRcU7hEksQcxiTpx476yl/y+caNs26Mus52gab83RaadtL38p7Vx+vs0sx4tezQN0mU3V2yddnElfR9KxWKtXLZZLpKGZZNVHPrwQO8HSvnm2Nr4e3cAt3bt24NQWuXCg4TkmH14kRSnG4tsrQqou8W7Yi2DoN29j2msviL0XmZifM/mFT3b+CuzZyPNvYy81wgv5sHSBrE7uVLPJ+/fylLAYiSWAUHkNSRpoKhiy15jcW1dZd2ZUJAgbpGk1u/I3DlLCBlAIEwFjXjmMks06HdqKXU1FCGUaEN8sMu2fZZbii7bCOBDZwJzdXhEDViNN+WvMbfW5dYdG3UBbpATlboxOU9SCDljzuNUYm/duXyzFQFlxvkqGdVzdp1bTgBR/9oXlS7bFu2LRBLnXMrOgbKBm0WSOHOuF8ts7FhJIGxuKXILaILYS8yE780hSHgDTcFjXzaMwzI1wvn3ldOjf7Jc8uOb2Uovn6Egkkpegk8esdfUKPwwVSTA10E+/89tMptCSgmOMB0du265yxZR/d3BqLSW95Ea5J8aZWMbaUKrMQQB9h+A+7QCWiwVSgy6Ft00yRXOuUeB7Iq8JNkJQXkusYy08ojMSCD5jjQCN7AA7xRVtB+R/WhcMhzZiIo4GumEnRGUFYux9oq4umAltdZ46tPdvpGbeKvzdQIlskwSd+saATp3xWj2g4yGdRxHOpYFALYt7wAI7qSSuQyxGxNjEdcFaV2DMGaSPvEj2EUlbFW1Um4ypH2mIAPDeeNaPafR5cjnSZiSPdSO/s7CuCrKGU7wzMR6i1LKngaEnHJPZeHw161cuuUu20IXKrAjNEkEjdoR66EtWcIrZreEtKeeXX102wuBs2cHcWyiorXJIXdMKJ9VIQYmhJVVBUnJthwvWxus2hz6grjiLf+Fa03fRr8qBzV5mpQhrX7ZmbVrX/ALafKqRbsTmGGsZufRW59cUPNeF6wbDhiEEnorU8+jT5V4+IRhDWrRHIopHuoDNUWehQykxhaxKIIS1aUTMLbUa89BUMReS4AHtW3A1AZEYA84IoEPU1ahwHnkOt3lAAW3bAHAIse6rOmB0yJ/Avyo7ye2H04Z2YqimNIkmJ47hqKK2x5Oi0he2xZR5waJA5yN/qpJOjJq6EwS3M9Fann0aT7quDr6CfwL8qz2Oa411VW4yiYhSADIEEmNY+NM7WFvAda4vq+QFLKTXkdJDDMPQT+FflXUJ0Fz00/hPzrqX1PyHaY3yj8sr+JudE0ok/ViQo0kTxcxG/TkKc4jArbXq69sHU89fjXz/Fsf0kk75H4RW22rtUAEtu4Ab67NZWl9yGk6b8IAxDFjABoPA4O3+lxeVroyBggHndbcdRIEbuM+FW2rN68QXZrVsnQLo5nd3eO7ka1uycBbttmRSXiM7sWeOWY+aOwRUXNafeSri9TrA2xflElhktKMoCL1VUAKSNVAGg1pLg9qx1JjqgkwT17hLAaa8R66Hxez8Vde5csGTnyocwGUABW3/vHtmjsPslrdy0hEPC66dYW1HWgHiQ1T1PdFNjadRbSQQm2LH6N0DR+kAH7BmAxPnxHmk6TzqNpHZcUbihSFVso3AFdOPJfZQIVGt3OqpZGbK0DNEgnXfEE0c2Kym4Br0uHt+wMCf9VT3Xz4H21wD/AKIWS7bAJJuqZA3A2y0nlq1M7eFYtGkTqdKC2feZVzjUXEtGJ3EW4Jnt09VOcDdzMARB376McmlgY4ey0bu6jLFtgokR41B7mVauFyUXtE+uu2GEcUsstsoYr26DPhUUvBRE9tct6WiBl5zr6oqiYtC/HrKHQHsMQaH2VtDqMYgoN36p3eoj20wvgarwMistiBo6B2QnqllMMBIkeyubUm4yTLQgpRaMtj9pF7jMW3sTv5mhGxvI+2tjgvJKw7S7u/EghBPLULPt4UXifJrCIOrYTxk+81oxk1YJOKdA3k8+bZzn/un3JS01orOHRMG6W1VV6QmFgCYXWs25qsuicez01FnoXB2bly4LaqzXPRBOv6w7PdVmOwVy22W5bKNyLfESDUXKui8YJ9lhuV6stuBPcCaDFzq5WUb5BBOYc+HWHYT6uPv9vXLJA6JbqAaMCQ0cBu9hE0HPwN6Vchb2bg1Nt/4W+VD9KOdWr/1HFv8A/EuD94fKq7/leuN6owyo41zMZYjlmAEDvnupraVsVQbdI8V6tR6BLAtl6wMSZiB2Tx8KtW12n11N6hZaL8m58ktq20RrbsFOfMCSADIGnfp7aY7Y2pbFpwXXrKVABGpIOlYDBobdy27Bt4Kqfta74OmXmd3eYBEOMzvcZkClmIQjTdpBIGhMTEEQdNZqUvc+TLTSZbtJHLAorEwDoCdQeyir23xaXr2r5MbltNp4kBfbQR2xftRltrcUcHBzDuZTr4zpwFXL5eum/Ct4OPjVk75/snKDvAtb/qFa/wAG561rqaf/AFJHHBuf3h8q6n2x8fyJU/8AI+bYn/1B7x+EVstnqoDXLmZivHKSFHMxxrMYrYGNV87YW9PNbbEaCN6yK0L4q6llkuIEUiNUZTv7TvmujU03KP4RLT1Em15Y1t4m3ce2LZzQSToRuGm8UbhdpoVuNIVUMZydDOgPiaT4m10NtGUKCUy6Eznb7Rkn2R3VLYCMLtm3lki4pI7LYJJ7gJPz3VwT0mpVI7YTTjgf+S217Fm2VxN1Lb5pAadeqoJkDmDRG09q271222EuK5AKZoMBmDDiNYDUN5PYGzcOJS6gcBhlB7S+sdkA61w2RbwmJsdEDkd5ysZgqyr6utRd7F+Rcbn5KdiYc9FjbbefbZgT4N/sr3DLneyMp61kr/Dkk+0iidnu36Xj0IjpACY5FZ/novZqW3sWmPnqHRWBII6xB3dwpdqsa2sg9nDgHKqNlQBQCDEDQRO+n2zsMNTu4UJsrDdZYuZhMnMBMjtEE1oM2usdlV049ktWfQDj7fVIHj3GrnGijiAKqxaZiCGKwdRwPYai9wlzoI4ETXQQLsSNR3VEXCuleX3ByxwFUXbvmx+fzNGwJBVwyTpyIPAzWc2vZVLmfQZ43nSeQ7TWjR5tzxAPspDjuuIbrAe+o6vBXTdMK2YxCBu2D7x8fVTDFrmWRxpHs+7qbciSJAnivw3ineCu5kj1U+i7jRPVVSsVOWS3cSJDcJGh5j88qzF/pZP0bew+41sMWlKbhppMCO8ilJvOzIylUgEiN7LMfw1r9qbPTFW8jwHAlW49/wAxSLydfrv3D30/cneDBG48j+ffWVNUxJNqVo+Y4+09m4bdxAGHaYI5jTdVC3+YX/VX0baV61dAW8izz8eDcjEcDSW7snCnVcw7nPxJrmnDwdcPqVXuRkbllWXN0akeNdhLImEQT2E/OtUuAsLIDtrv6wPsIIryzgMOjBlJB1+1Oh0iDMiOdI4FF9THIoTC3DuC+Jq3+zr28Wwe4g+yZp4hsgyI9Z+dWrjLY3EeugtPyK/qfBkMaXtC5ca25bJlAJK5TMBhM6anQd9BtdTMxO6ACOBI/IHq5Vvb+0EZSjhGU7wwpN/ZWDmcvb9Y3zrPT8Bj9THtGfS8TJeFJJ0WcoHCJk+s1F7g/wCf+K0f9nYXt/zG+deHZ2E7f8xvnS7GP+ph9zMSOz1D5V1aX+zsJ2/5jfOuremzfqYfcfJj5oy1eJ51m8HtfCz9fbJ5An5U0sbbwgMG+k8tfdFd6m3lnI4VwhucIlyM9tGHJlU+8VivJuxa6TEtcAhEzZtQVGuaCNRPtitJe8rMCiycQkD0czE9kAVjcA6Xbt4HMbbiYmJGYETB3dk1HVl7kV0oOnYT5M43PirxQE55IzQGjMNdNJGamHlPiQ1/CQICsw9ts/y0h2Sot4+4E0UjQdhtqfeDTTyluSbDcnPtX+lRlKouJZRW5MMwihdqMBDB7GvLQqP5ajti1lY27ShbQBBVeZJJOpiNeVRx6MmJtX0HVRGQ+kZBiBx1M+FSTFA7jNI5dBUcpk9luysDwA5fKm/6SjEMSJXQGDI7AYqhbeVFEatqfh76gw3Ac/608LQk6k7CblzzjVNl+3frVfSA6cdDqNfV4VdAirW7J0qB8U54EjSqbBM8SO0/nlUsSDp6q8seY3cKdSFoOS+TbIkb9ee+PgaX9JqCdx3+NdekLAO+dePZ7/bQGvn8AY7hHKpzkMol11lDhiozI2h4iKdWLgFzTzWAYdx/rNZ7aF9QUJHnjlxXQ/A+NH7OxGa122z/AKW5+NbSdSBqxuNh23cQLSg+lurLXNoTxqvyh2kS2XgKzz4unnK3glCNI33klis1y4OSj31qM9YLyAuzcu/dX8RrcFqMeCWp8hLtS5DiDBnnE8+w6ePW40ld37frOSHSO/0de/10z2o3XHeOMTqOB0brRu4IaVMdDoT1/RHwPpdWeXqpWZHju8PM7/RXdB7fRg958asBbMJnzTPVXsnjw09Z8anHn6Tr6J11PvaV8KkvnLAnq6dXfpp69T+7WMeqDCyNcxnqrz1/1QO71UdswfSNpwbgOR4jtn1DwXJ5q6cfR7Drv9GWphs1fpGO6OyN4gDt0g+NYwHij9I/3xwHoLz/AFZ8Y76sct1/O8AO2Y8MvjRocAv3/IVzYgyYndQQwIEbN5p1XXQb+Pw9tRVHhJU79dBzHx9k0Yt06andUemMbzv/AD7KOBRVeS8GOVdPur48Oc11F4nEQx19n9a6tgcs8jB/5JDx6+vHz240Av8A90ufsT+JK6uq8/iisflL9xJ5W2lF9SFAJmTA11486K8nvrD9z4iva6uLU+SOmHxLU/8AXD7o/C9GeUHm2/2n8jV5XVKff+6Hjyh3j+Hj8KRYT6w/e+Arq6l7Gh8TW4rzx9340PxHefdXV1XXJz9Hi7z3irm80d9dXVTsVg+N83xqrD+ePut8K6uooHRK5w7viKoX6tvGurqWXIehftL6u3+0PuFW7C+sxH3D7lrq6guTP4szO2/rW7/hSha6uoidGw/6ffW3fur+Kt0a6uqseDm1PkINp/WxwkGO2G1pI/8AOPwCurqV8mR43953/OpL5y/d+Arq6sYrXzU+8fjTnZG6598/Curqxiq95zd591eDzm7q6uoIx1vev3fgK84Dv+VdXUTC3aB+kb88BXtdXUTH/9k=',
                                                                                          ),
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                      AutoSizeText(
                                                                                        column1RestaurantsRecord.restaurantName!.maybeHandleOverflow(
                                                                                          maxChars: 12,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Lexend Deca',
                                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                              fontSize: 12,
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
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(10, 10,
                                                                  10, 10),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset:
                                                                  Offset(0, 2),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(2,
                                                                      2, 2, 2),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            20,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          column1RestaurantsRecord
                                                                              .restSlogan!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .title1
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: FlutterFlowTheme.of(context).primaryDark,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          4,
                                                                          16,
                                                                          12),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          column1RestaurantsRecord
                                                                              .restDescription!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: Color(0xFF8B97A2),
                                                                                fontSize: 14,
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20,
                                                                        20,
                                                                        20,
                                                                        20),
                                                            child: Container(
                                                              height: 200,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryDark,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16),
                                                              ),
                                                              child:
                                                                  FlutterFlowGoogleMap(
                                                                controller:
                                                                    googleMapsController,
                                                                onCameraIdle:
                                                                    (latLng) =>
                                                                        googleMapsCenter =
                                                                            latLng,
                                                                initialLocation:
                                                                    googleMapsCenter ??=
                                                                        column1RestaurantsRecord
                                                                            .restLatLong!,
                                                                markers: [
                                                                  if (column1RestaurantsRecord !=
                                                                      null)
                                                                    FlutterFlowMarker(
                                                                      column1RestaurantsRecord
                                                                          .reference
                                                                          .path,
                                                                      column1RestaurantsRecord
                                                                          .restLatLong!,
                                                                    ),
                                                                ],
                                                                markerColor:
                                                                    GoogleMarkerColor
                                                                        .orange,
                                                                mapType: MapType
                                                                    .normal,
                                                                style:
                                                                    GoogleMapStyle
                                                                        .dark,
                                                                initialZoom: 16,
                                                                allowInteraction:
                                                                    true,
                                                                allowZoom: true,
                                                                showZoomControls:
                                                                    true,
                                                                showLocation:
                                                                    false,
                                                                showCompass:
                                                                    false,
                                                                showMapToolbar:
                                                                    false,
                                                                showTraffic:
                                                                    true,
                                                                centerMapOnMarkerTap:
                                                                    true,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(10, 10,
                                                                  10, 10),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            10,
                                                                            10,
                                                                            10),
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation: 4,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.9,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryDark,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              10,
                                                                              10,
                                                                              10),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        color: Colors
                                                                            .white,
                                                                        child:
                                                                            ExpandableNotifier(
                                                                          initialExpanded:
                                                                              false,
                                                                          child:
                                                                              ExpandablePanel(
                                                                            header:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'iszr0yxx' /* Hours */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).title1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: Colors.black,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            collapsed:
                                                                                Container(),
                                                                            expanded:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'zjgvzv9h' /* Monday */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: Color(0x8A000000),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(74, 0, 0, 0),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0xFFEEEEEE),
                                                                                                ),
                                                                                                child: Text(
                                                                                                  column1RestaurantsRecord.mondayHours!,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '8yruo0a7' /* Tuesday */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: Color(0x8A000000),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(74, 0, 0, 0),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0xFFEEEEEE),
                                                                                                ),
                                                                                                child: Text(
                                                                                                  column1RestaurantsRecord.tuesdayHours!,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'evyha2z5' /* Wednesday */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: Color(0x8A000000),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0xFFEEEEEE),
                                                                                                ),
                                                                                                child: Text(
                                                                                                  column1RestaurantsRecord.wednesdayHours!,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'x89kprj2' /* Thursday */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Lexend Deca',
                                                                                                        color: Color(0x8A000000),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(67, 0, 0, 0),
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFEEEEEE),
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    column1RestaurantsRecord.thursdayHours!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
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
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'pkupf5as' /* Friday */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: Color(0x8A000000),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(85, 0, 0, 0),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0xFFEEEEEE),
                                                                                                ),
                                                                                                child: Text(
                                                                                                  column1RestaurantsRecord.fridayHours!,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '097ue4qn' /* Saturday */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: Color(0x8A000000),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(66, 0, 0, 0),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0xFFEEEEEE),
                                                                                                ),
                                                                                                child: Text(
                                                                                                  column1RestaurantsRecord.saturdayHours!,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'b5bt1w2o' /* Sunday */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Lexend Deca',
                                                                                                        color: Color(0x8A000000),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(77, 0, 0, 0),
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFEEEEEE),
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    column1RestaurantsRecord.sundayHours!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
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
                                                                              ],
                                                                            ),
                                                                            theme:
                                                                                ExpandableThemeData(
                                                                              tapHeaderToExpand: true,
                                                                              tapBodyToExpand: false,
                                                                              tapBodyToCollapse: false,
                                                                              headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                              hasIcon: true,
                                                                            ),
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
                                                    if (!column1RestaurantsRecord
                                                        .isSubscribed!)
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16,
                                                                        8,
                                                                        16,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ap7ymnq3' /* Recommended */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          AuthUserStreamWidget(
                                                            child: StreamBuilder<
                                                                AddNumberRecord>(
                                                              stream: AddNumberRecord
                                                                  .getDocument(
                                                                      currentUserDocument!
                                                                          .addNumberRef!),
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
                                                                final rowAddNumberRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    StreamBuilder<
                                                                        List<
                                                                            RestaurantsRecord>>(
                                                                      stream:
                                                                          queryRestaurantsRecord(
                                                                        queryBuilder: (restaurantsRecord) => restaurantsRecord.where('hasAdNumber', isEqualTo: true).where(
                                                                            'adNumber',
                                                                            isEqualTo:
                                                                                rowAddNumberRecord.count),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 30,
                                                                              height: 30,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 30,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<RestaurantsRecord>
                                                                            rowRestaurantsRecordList =
                                                                            snapshot.data!;
                                                                        return SingleChildScrollView(
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children:
                                                                                List.generate(rowRestaurantsRecordList.length, (rowIndex) {
                                                                              final rowRestaurantsRecord = rowRestaurantsRecordList[rowIndex];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 10),
                                                                                child: StreamBuilder<AddNumberRecord>(
                                                                                  stream: AddNumberRecord.getDocument(rowAddNumberRecord.reference),
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
                                                                                    final containerAddNumberRecord = snapshot.data!;
                                                                                    return Container(
                                                                                      width: MediaQuery.of(context).size.width * 0.9,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryDark,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 2, 10, 0),
                                                                                        child: StreamBuilder<RestaurantsRecord>(
                                                                                          stream: RestaurantsRecord.getDocument(rowRestaurantsRecord.reference),
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
                                                                                            final storeListView3RestaurantsRecord = snapshot.data!;
                                                                                            return Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                                                                  child: Material(
                                                                                                    color: Colors.transparent,
                                                                                                    elevation: 4,
                                                                                                    shape: RoundedRectangleBorder(
                                                                                                      borderRadius: BorderRadius.circular(16),
                                                                                                    ),
                                                                                                    child: Container(
                                                                                                      width: MediaQuery.of(context).size.width * 0.9,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: Color(0xFFEEEEEE),
                                                                                                        boxShadow: [
                                                                                                          BoxShadow(
                                                                                                            color: FlutterFlowTheme.of(context).primaryDark,
                                                                                                          )
                                                                                                        ],
                                                                                                        borderRadius: BorderRadius.circular(16),
                                                                                                      ),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          InkWell(
                                                                                                            onTap: () async {
                                                                                                              logFirebaseEvent('RESTAURANT_DETAILS_Container_m157vxqv_ON');
                                                                                                              logFirebaseEvent('Container_Backend-Call');

                                                                                                              final restaurantsUpdateData = {
                                                                                                                'cardClicks': FieldValue.increment(1),
                                                                                                              };
                                                                                                              await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                              logFirebaseEvent('Container_Navigate-To');

                                                                                                              context.pushNamed(
                                                                                                                'restaurantDetails',
                                                                                                                queryParams: {
                                                                                                                  'restaurant': serializeParam(storeListView3RestaurantsRecord.reference, ParamType.DocumentReference),
                                                                                                                }.withoutNulls,
                                                                                                              );
                                                                                                            },
                                                                                                            child: Material(
                                                                                                              color: Colors.transparent,
                                                                                                              elevation: 1,
                                                                                                              shape: RoundedRectangleBorder(
                                                                                                                borderRadius: BorderRadius.circular(16),
                                                                                                              ),
                                                                                                              child: Container(
                                                                                                                width: MediaQuery.of(context).size.width,
                                                                                                                height: 120,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: Colors.white,
                                                                                                                  borderRadius: BorderRadius.circular(16),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Stack(
                                                                                                                        children: [
                                                                                                                          Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 8, 8, 8),
                                                                                                                                child: InkWell(
                                                                                                                                  onTap: () async {
                                                                                                                                    logFirebaseEvent('RESTAURANT_DETAILS_Image_2lme8k7g_ON_TAP');
                                                                                                                                    logFirebaseEvent('Image_Expand-Image');
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
                                                                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                                                                      child: CachedNetworkImage(
                                                                                                                                        imageUrl: valueOrDefault<String>(
                                                                                                                                          storeListView3RestaurantsRecord.featuredImage,
                                                                                                                                          'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                                                                                                                        ),
                                                                                                                                        width: 74,
                                                                                                                                        height: 74,
                                                                                                                                        fit: BoxFit.cover,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                                                            child: StreamBuilder<RestaurantsRecord>(
                                                                                                                              stream: RestaurantsRecord.getDocument(storeListView3RestaurantsRecord.reference),
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
                                                                                                                                final containerRestaurantsRecord = snapshot.data!;
                                                                                                                                return Material(
                                                                                                                                  color: Colors.transparent,
                                                                                                                                  elevation: 4,
                                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                                    borderRadius: BorderRadius.circular(99),
                                                                                                                                  ),
                                                                                                                                  child: Container(
                                                                                                                                    width: 35,
                                                                                                                                    height: 35,
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      color: Color(0xFFEEEEEE),
                                                                                                                                      borderRadius: BorderRadius.circular(99),
                                                                                                                                    ),
                                                                                                                                    child: Container(
                                                                                                                                      width: 120,
                                                                                                                                      height: 120,
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
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5, 55, 0, 0),
                                                                                                                            child: StreamBuilder<List<PostsRecord>>(
                                                                                                                              stream: queryPostsRecord(
                                                                                                                                queryBuilder: (postsRecord) => postsRecord.where('rest_ref', isEqualTo: storeListView3RestaurantsRecord.reference),
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
                                                                                                                                List<PostsRecord> containerPostsRecordList = snapshot.data!;
                                                                                                                                return Material(
                                                                                                                                  color: Colors.transparent,
                                                                                                                                  elevation: 4,
                                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                                    borderRadius: BorderRadius.circular(99),
                                                                                                                                  ),
                                                                                                                                  child: Container(
                                                                                                                                    width: 35,
                                                                                                                                    height: 35,
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      color: Color(0xFFEEEEEE),
                                                                                                                                      borderRadius: BorderRadius.circular(99),
                                                                                                                                    ),
                                                                                                                                    alignment: AlignmentDirectional(0, 0),
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
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8, 1, 0, 0),
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
                                                                                                                                          color: Color(0xFF15212B),
                                                                                                                                          fontSize: 18,
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
                                                                                                                                          fontSize: 14,
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
                                                                                                                                          fontSize: 14,
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
                                                                                                                                          fontSize: 14,
                                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                                                                    child: Text(
                                                                                                                                      valueOrDefault<String>(
                                                                                                                                        '${formatNumber(
                                                                                                                                          storeListView3RestaurantsRecord.reviews,
                                                                                                                                          formatType: FormatType.compact,
                                                                                                                                        )} reviews',
                                                                                                                                        '0 reviews',
                                                                                                                                      ),
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
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
                                                                                                                                          color: FlutterFlowTheme.of(context).primaryDark,
                                                                                                                                          fontSize: 14,
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
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                                                              child: Icon(
                                                                                                                                Icons.chevron_right_outlined,
                                                                                                                                color: Color(0xFF95A1AC),
                                                                                                                                size: 24,
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
                                                                                                                    borderRadius: 30,
                                                                                                                    borderWidth: 1,
                                                                                                                    buttonSize: 60,
                                                                                                                    icon: Icon(
                                                                                                                      Icons.phone,
                                                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                      size: 30,
                                                                                                                    ),
                                                                                                                    onPressed: () async {
                                                                                                                      logFirebaseEvent('RESTAURANT_DETAILS_PAGE_phone_ICN_ON_TAP');
                                                                                                                      logFirebaseEvent('IconButton_Backend-Call');

                                                                                                                      final restaurantsUpdateData = {
                                                                                                                        'phoneClicks': FieldValue.increment(1),
                                                                                                                      };
                                                                                                                      await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                                      logFirebaseEvent('IconButton_Launch-U-R-L');
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
                                                                                                                    borderRadius: 30,
                                                                                                                    borderWidth: 1,
                                                                                                                    buttonSize: 60,
                                                                                                                    icon: FaIcon(
                                                                                                                      FontAwesomeIcons.mapMarkedAlt,
                                                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                      size: 30,
                                                                                                                    ),
                                                                                                                    onPressed: () async {
                                                                                                                      logFirebaseEvent('RESTAURANT_DETAILS_mapMarkedAlt_ICN_ON_T');
                                                                                                                      logFirebaseEvent('IconButton_Backend-Call');

                                                                                                                      final restaurantsUpdateData = {
                                                                                                                        'mapClicks': FieldValue.increment(1),
                                                                                                                      };
                                                                                                                      await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                                      logFirebaseEvent('IconButton_Launch-U-R-L');
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
                                                                                                                    borderRadius: 30,
                                                                                                                    borderWidth: 1,
                                                                                                                    buttonSize: 60,
                                                                                                                    icon: FaIcon(
                                                                                                                      FontAwesomeIcons.globe,
                                                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                      size: 30,
                                                                                                                    ),
                                                                                                                    onPressed: () async {
                                                                                                                      logFirebaseEvent('RESTAURANT_DETAILS_PAGE_globe_ICN_ON_TAP');
                                                                                                                      logFirebaseEvent('IconButton_Backend-Call');

                                                                                                                      final restaurantsUpdateData = {
                                                                                                                        'websiteClicks': FieldValue.increment(1),
                                                                                                                      };
                                                                                                                      await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                                      logFirebaseEvent('IconButton_Launch-U-R-L');
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
                                                                                                                      borderRadius: 30,
                                                                                                                      borderWidth: 1,
                                                                                                                      buttonSize: 60,
                                                                                                                      icon: Icon(
                                                                                                                        Icons.fastfood_rounded,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                        size: 34,
                                                                                                                      ),
                                                                                                                      onPressed: () async {
                                                                                                                        logFirebaseEvent('RESTAURANT_DETAILS_fastfood_rounded_ICN_');
                                                                                                                        logFirebaseEvent('IconButton_Backend-Call');

                                                                                                                        final restaurantsUpdateData = {
                                                                                                                          'orderNowClicks': FieldValue.increment(1),
                                                                                                                        };
                                                                                                                        await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                                        logFirebaseEvent('IconButton_Navigate-To');

                                                                                                                        context.pushNamed(
                                                                                                                          'order',
                                                                                                                          queryParams: {
                                                                                                                            'restaurant': serializeParam(storeListView3RestaurantsRecord, ParamType.Document),
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
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
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
                                                                                                                      width: 30,
                                                                                                                      height: 30,
                                                                                                                      child: SpinKitThreeBounce(
                                                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                        size: 30,
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
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(9, 0, 0, 0),
                                                                                                                      child: Container(
                                                                                                                        width: 56.25,
                                                                                                                        height: 100,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: Color(0xFFEEEEEE),
                                                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                                                        ),
                                                                                                                        child: InkWell(
                                                                                                                          onTap: () async {
                                                                                                                            logFirebaseEvent('RESTAURANT_DETAILS_Image_aueb78x0_ON_TAP');
                                                                                                                            logFirebaseEvent('Image_Navigate-To');

                                                                                                                            context.pushNamed(
                                                                                                                              'restaurantReviewsList',
                                                                                                                              queryParams: {
                                                                                                                                'initialStoryIndex': serializeParam(rowIndex, ParamType.int),
                                                                                                                                'restaurant': serializeParam(storeListView3RestaurantsRecord, ParamType.Document),
                                                                                                                              }.withoutNulls,
                                                                                                                              extra: <String, dynamic>{
                                                                                                                                'restaurant': storeListView3RestaurantsRecord,
                                                                                                                              },
                                                                                                                            );
                                                                                                                          },
                                                                                                                          child: ClipRRect(
                                                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                                                            child: Image.network(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                rowPostsRecord.videoThumbnail,
                                                                                                                                'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                                                                                                              ),
                                                                                                                              width: 100,
                                                                                                                              height: 100,
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
                                                                                    ).animated([
                                                                                      animationsMap['containerOnPageLoadAnimation']!
                                                                                    ]);
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      20, 0, 0),
                                                          child: Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryDark,
                                                            ),
                                                            child: ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              children: [
                                                                if (column1RestaurantsRecord
                                                                        .mobileRewards ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              80,
                                                                          height:
                                                                              80,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                10,
                                                                                10,
                                                                                10),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/Asset_1mdpi.png',
                                                                              width: 50,
                                                                              height: 50,
                                                                              fit: BoxFit.scaleDown,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'nc07hntw' /* Mobile Rewards */,
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
                                                                if (column1RestaurantsRecord
                                                                        .takeout ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              80,
                                                                          height:
                                                                              80,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                10,
                                                                                10,
                                                                                10),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/Asset_5mdpi.png',
                                                                              width: 50,
                                                                              height: 50,
                                                                              fit: BoxFit.scaleDown,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'b6nhxkwn' /* Takeout */,
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
                                                                if (column1RestaurantsRecord
                                                                        .delivery ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              80,
                                                                          height:
                                                                              80,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                10,
                                                                                10,
                                                                                10),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/Asset_3mdpi.png',
                                                                              width: 50,
                                                                              height: 50,
                                                                              fit: BoxFit.scaleDown,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'q7qmxgiq' /* Delivery */,
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
                                                                if (column1RestaurantsRecord
                                                                        .wifi ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              80,
                                                                          height:
                                                                              80,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                10,
                                                                                10,
                                                                                10),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/Asset_11mdpi.png',
                                                                              width: 50,
                                                                              height: 50,
                                                                              fit: BoxFit.scaleDown,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '10ndmhzb' /* Wifi */,
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
                                                                if (column1RestaurantsRecord
                                                                        .reservations ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              80,
                                                                          height:
                                                                              80,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                10,
                                                                                10,
                                                                                10),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/Asset_8mdpi.png',
                                                                              width: 50,
                                                                              height: 50,
                                                                              fit: BoxFit.scaleDown,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'fq77p7sg' /* Reservations */,
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
                                                                if (column1RestaurantsRecord
                                                                        .standalone ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              80,
                                                                          height:
                                                                              80,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                10,
                                                                                10,
                                                                                10),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/Asset_6mdpi.png',
                                                                              width: 50,
                                                                              height: 50,
                                                                              fit: BoxFit.scaleDown,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'hmx32kgz' /* Standalone */,
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
                                                                if (column1RestaurantsRecord
                                                                        .tableService ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              80,
                                                                          height:
                                                                              80,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                10,
                                                                                10,
                                                                                10),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/Asset_9mdpi.png',
                                                                              width: 50,
                                                                              height: 50,
                                                                              fit: BoxFit.scaleDown,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'a1l1f7ra' /* Table Service */,
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
                                                                if (column1RestaurantsRecord
                                                                        .happyHour ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              80,
                                                                          height:
                                                                              80,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                10,
                                                                                10,
                                                                                10),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/Asset_12mdpi.png',
                                                                              width: 50,
                                                                              height: 50,
                                                                              fit: BoxFit.scaleDown,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '0jhaxrqr' /* Happy Hour */,
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
                                                                if (column1RestaurantsRecord
                                                                        .birthdayFreebies ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              80,
                                                                          height:
                                                                              80,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                10,
                                                                                10,
                                                                                10),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/Asset_4mdpi.png',
                                                                              width: 50,
                                                                              height: 50,
                                                                              fit: BoxFit.scaleDown,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        AutoSizeText(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'ht5wk5hh' /* Birthday Freebies */,
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
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 16,
                                                                  16, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '36ku01rm' /* Featured Menu Items */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 270,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryDark,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    MenuItemRecord>>(
                                                              stream:
                                                                  queryMenuItemRecord(
                                                                queryBuilder: (menuItemRecord) => menuItemRecord
                                                                    .where(
                                                                        'restRef',
                                                                        isEqualTo:
                                                                            column1RestaurantsRecord
                                                                                .reference)
                                                                    .where(
                                                                        'featuredItem',
                                                                        isEqualTo:
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
                                                                List<MenuItemRecord>
                                                                    eventsListMenuItemRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                if (eventsListMenuItemRecordList
                                                                    .isEmpty) {
                                                                  return Image
                                                                      .asset(
                                                                    'assets/images/Asset_7mdpi.png',
                                                                    width: 50,
                                                                    height: 100,
                                                                  );
                                                                }
                                                                return SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        eventsListMenuItemRecordList
                                                                            .length,
                                                                        (eventsListIndex) {
                                                                      final eventsListMenuItemRecord =
                                                                          eventsListMenuItemRecordList[
                                                                              eventsListIndex];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16,
                                                                            20,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('RESTAURANT_DETAILS_Container_0o0z5k5c_ON');
                                                                            logFirebaseEvent('Container_Navigate-To');

                                                                            context.pushNamed(
                                                                              'singleItem',
                                                                              queryParams: {
                                                                                'menuItem': serializeParam(eventsListMenuItemRecord, ParamType.Document),
                                                                                'restaurant': serializeParam(column1RestaurantsRecord, ParamType.Document),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'menuItem': eventsListMenuItemRecord,
                                                                                'restaurant': column1RestaurantsRecord,
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                4,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(16),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 250,
                                                                              height: 210,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFEEEEEE),
                                                                                borderRadius: BorderRadius.circular(16),
                                                                              ),
                                                                              alignment: AlignmentDirectional(0, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(6, 6, 0, 0),
                                                                                        child: Material(
                                                                                          color: Colors.transparent,
                                                                                          elevation: 2,
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(16),
                                                                                          ),
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFFEEEEEE),
                                                                                              borderRadius: BorderRadius.circular(16),
                                                                                            ),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(16),
                                                                                              child: Image.network(
                                                                                                valueOrDefault<String>(
                                                                                                  eventsListMenuItemRecord.itemImage,
                                                                                                  'https://cdn.vox-cdn.com/thumbor/9qN-DmdwZE__GqwuoJIinjUXzmk=/0x0:960x646/1200x900/filters:focal(404x247:556x399)/cdn.vox-cdn.com/uploads/chorus_image/image/63084260/foodlife_2.0.jpg',
                                                                                                ),
                                                                                                width: 238,
                                                                                                height: 125,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(6, 6, 0, 0),
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
                                                                                                fontSize: 18,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
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
                                                                                                color: Color(0xFF414141),
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
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
                                                                                                fontSize: 17,
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
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ).animated([
                                                animationsMap[
                                                    'columnOnPageLoadAnimation']!
                                              ]),
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 40, 0, 0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryDark,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 3,
                                                              color: Color(
                                                                  0x39000000),
                                                              offset:
                                                                  Offset(0, 1),
                                                            )
                                                          ],
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12,
                                                                      16,
                                                                      12,
                                                                      24),
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            12),
                                                                    child: Text(
                                                                      column1RestaurantsRecord
                                                                          .reviews!
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .title1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            fontSize:
                                                                                28,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ffgc305k' /* # of Reviews */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Color(0xFF95A1AC),
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            12),
                                                                        child:
                                                                            Text(
                                                                          functions
                                                                              .getAverageRating(restaurantDetailsPostsRecordList.toList()),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .title1
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                fontSize: 28,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4,
                                                                            0,
                                                                            0,
                                                                            12),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .star_rounded,
                                                                          color:
                                                                              Color(0xFFFFA130),
                                                                          size:
                                                                              24,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'jkszesic' /* Avg. Rating */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Color(0xFF8B97A2),
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                        List<PostsRecord>>(
                                                      stream: queryPostsRecord(
                                                        queryBuilder: (postsRecord) =>
                                                            postsRecord
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
                                                        List<PostsRecord>
                                                            columnPostsRecordList =
                                                            snapshot.data!;
                                                        if (columnPostsRecordList
                                                            .isEmpty) {
                                                          return Center(
                                                            child:
                                                                NoReviewsWidget(),
                                                          );
                                                        }
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
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
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          2,
                                                                          2,
                                                                          2),
                                                              child: StreamBuilder<
                                                                  PostsRecord>(
                                                                stream: PostsRecord
                                                                    .getDocument(
                                                                        columnPostsRecord
                                                                            .reference),
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
                                                                  final reviewRowPostsRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            10,
                                                                            10,
                                                                            10),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.8,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(0, 2),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(16),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2,
                                                                                2,
                                                                                2,
                                                                                2),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('RESTAURANT_DETAILS_Column_nucc0nsy_ON_TA');
                                                                                logFirebaseEvent('Column_Navigate-To');

                                                                                context.pushNamed(
                                                                                  'restaurantReviewsList',
                                                                                  queryParams: {
                                                                                    'initialStoryIndex': serializeParam(columnIndex, ParamType.int),
                                                                                    'post': serializeParam(columnPostsRecord.reference, ParamType.DocumentReference),
                                                                                    'restaurant': serializeParam(column1RestaurantsRecord, ParamType.Document),
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
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
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
                                                                                                    width: 40,
                                                                                                    height: 40,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xFFEEEEEE),
                                                                                                      shape: BoxShape.circle,
                                                                                                    ),
                                                                                                    alignment: AlignmentDirectional(0, 0),
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
                                                                                                            fontSize: 28,
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
                                                                                                    itemSize: 30,
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
                                                                                                    width: 30,
                                                                                                    height: 30,
                                                                                                    child: SpinKitThreeBounce(
                                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                      size: 30,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              final cardUsersRecord = snapshot.data!;
                                                                                              return Card(
                                                                                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                color: Color(0xFFDBE2E7),
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(40),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                                                  child: Container(
                                                                                                    width: 50,
                                                                                                    height: 50,
                                                                                                    clipBehavior: Clip.antiAlias,
                                                                                                    decoration: BoxDecoration(
                                                                                                      shape: BoxShape.circle,
                                                                                                    ),
                                                                                                    child: CachedNetworkImage(
                                                                                                      imageUrl: valueOrDefault<String>(
                                                                                                        cardUsersRecord.photoUrl,
                                                                                                        'https://p1.pxfuel.com/preview/828/149/229/indistinct-blurred-pineapple-rough.jpg',
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
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
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
                                                                                                    fontSize: 14,
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
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (currentUserReference ==
                                                      column1RestaurantsRecord
                                                          .userConnection)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 30, 0, 10),
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
                                                                        10,
                                                                        10,
                                                                        0,
                                                                        10),
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
                                                                        'Button_Bottom-Sheet');
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
                                                                                385,
                                                                            child:
                                                                                AddMenuCourseWidget(
                                                                              restaurant: column1RestaurantsRecord,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '41gi3khj' /* Add Course */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 130,
                                                                    height: 40,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
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
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                                  .fromSTEB(0,
                                                                      16, 0, 0),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.95,
                                                            height: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFEEEEEE),
                                                                width: 2,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          8,
                                                                          0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'RESTAURANT_DETAILS_Row_mi8me1q5_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Row_Navigate-To');

                                                                  context
                                                                      .pushNamed(
                                                                    'searchMenuItems',
                                                                    queryParams:
                                                                        {
                                                                      'restaurant': serializeParam(
                                                                          column1RestaurantsRecord,
                                                                          ParamType
                                                                              .Document),
                                                                    }.withoutNulls,
                                                                    extra: <
                                                                        String,
                                                                        dynamic>{
                                                                      'restaurant':
                                                                          column1RestaurantsRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              0,
                                                                              4,
                                                                              0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .search_rounded,
                                                                        color: Color(
                                                                            0xFF95A1AC),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '4f6bwbrf' /* Search menu... */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                Color(0xFFA4A4A4),
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
                                                                  0, 10, 0, 0),
                                                      child: StreamBuilder<
                                                          List<
                                                              MenuCourseRecord>>(
                                                        stream:
                                                            queryMenuCourseRecord(
                                                          queryBuilder: (menuCourseRecord) =>
                                                              menuCourseRecord.where(
                                                                  'restRef',
                                                                  isEqualTo:
                                                                      column1RestaurantsRecord
                                                                          .reference),
                                                        ),
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
                                                          List<MenuCourseRecord>
                                                              listViewMenuCourseRecordList =
                                                              snapshot.data!;
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
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewMenuCourseRecordList
                                                                    .length,
                                                            itemBuilder: (context,
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            10),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'RESTAURANT_DETAILS_Container_9qjwxkhk_ON');
                                                                        logFirebaseEvent(
                                                                            'Container_Navigate-To');

                                                                        context
                                                                            .pushNamed(
                                                                          'menuItemsPage',
                                                                          queryParams:
                                                                              {
                                                                            'restaurant':
                                                                                serializeParam(column1RestaurantsRecord, ParamType.Document),
                                                                            'menuCourse':
                                                                                serializeParam(listViewMenuCourseRecord, ParamType.Document),
                                                                          }.withoutNulls,
                                                                          extra: <
                                                                              String,
                                                                              dynamic>{
                                                                            'restaurant':
                                                                                column1RestaurantsRecord,
                                                                            'menuCourse':
                                                                                listViewMenuCourseRecord,
                                                                          },
                                                                        );
                                                                      },
                                                                      onDoubleTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'RESTAURANT_DETAILS_Container_9qjwxkhk_ON');
                                                                        logFirebaseEvent(
                                                                            'Container_Bottom-Sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return Padding(
                                                                              padding: MediaQuery.of(context).viewInsets,
                                                                              child: EditMenuCourseWidget(
                                                                                menuCourse: listViewMenuCourseRecord,
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      onLongPress:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'RESTAURANT_DETAILS_Container_9qjwxkhk_ON');
                                                                        if (currentUserReference ==
                                                                            column1RestaurantsRecord.userConnection) {
                                                                          logFirebaseEvent(
                                                                              'Container_Backend-Call');
                                                                          await listViewMenuCourseRecord
                                                                              .reference
                                                                              .delete();
                                                                        }
                                                                      },
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            4,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(16),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.9,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFEEEEEE),
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 10,
                                                                                color: Color(0xCA606060),
                                                                                offset: Offset(0, 4),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(16),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                                                                                    child: InkWell(
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('RESTAURANT_DETAILS_CircleImage_5jc2x05x_');
                                                                                        logFirebaseEvent('CircleImage_Expand-Image');
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
                                                                                          width: 80,
                                                                                          height: 80,
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 30, 0),
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
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFFEEEEEE),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                            child: Text(
                                                                                              listViewMenuCourseRecord.courseName!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                    fontSize: 18,
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
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFFEEEEEE),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                            child: Text(
                                                                                              listViewMenuCourseRecord.courseDescription!,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                    fontSize: 12,
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    if (currentUserReference == column1RestaurantsRecord.userConnection)
                                                                                      FlutterFlowIconButton(
                                                                                        borderColor: Colors.transparent,
                                                                                        borderRadius: 30,
                                                                                        borderWidth: 1,
                                                                                        buttonSize: 60,
                                                                                        icon: Icon(
                                                                                          Icons.add_box_outlined,
                                                                                          color: Colors.black,
                                                                                          size: 30,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('RESTAURANT_DETAILS_add_box_outlined_ICN_');
                                                                                          logFirebaseEvent('IconButton_Navigate-To');

                                                                                          context.pushNamed(
                                                                                            'addMenuItem',
                                                                                            queryParams: {
                                                                                              'restaurant': serializeParam(column1RestaurantsRecord, ParamType.Document),
                                                                                              'menuCourse': serializeParam(listViewMenuCourseRecord, ParamType.Document),
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
                                                                .fromSTEB(0, 30,
                                                                    0, 10),
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
                                                                          10,
                                                                          10,
                                                                          0,
                                                                          10),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'RESTAURANT_DETAILS_ADD_DEAL_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_Bottom-Sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primaryDark,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(context).viewInsets,
                                                                            child:
                                                                                Container(
                                                                              height: 500,
                                                                              child: AddDealWidget(
                                                                                restaurant: column1RestaurantsRecord,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ays8iw2y' /* Add Deal */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          130,
                                                                      height:
                                                                          40,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
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
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        30,
                                                                        0,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          10,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      't3jc4ik7' /* Deals & Discounts */,
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
                                                                        .where(
                                                                            'restRef',
                                                                            isEqualTo: column1RestaurantsRecord
                                                                                .reference)
                                                                        .where(
                                                                            'active',
                                                                            isEqualTo:
                                                                                true)
                                                                        .where(
                                                                            'expiry',
                                                                            isGreaterThanOrEqualTo:
                                                                                getCurrentTimestamp)
                                                                        .orderBy(
                                                                            'expiry'),
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
                                                                    List<DealsRecord>
                                                                        listViewDealsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    if (listViewDealsRecordList
                                                                        .isEmpty) {
                                                                      return NoDealsCopyWidget();
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
                                                                          listViewDealsRecordList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              listViewIndex) {
                                                                        final listViewDealsRecord =
                                                                            listViewDealsRecordList[listViewIndex];
                                                                        return Visibility(
                                                                          visible:
                                                                              !(currentUserDocument?.usedDeals?.toList() ?? []).contains(listViewDealsRecord.reference),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            child:
                                                                                InkWell(
                                                                              onLongPress: () async {
                                                                                logFirebaseEvent('RESTAURANT_DETAILS_Stack_bh4fpoq0_ON_LON');
                                                                                if ((currentUserDocument?.restConnections?.toList() ?? []).contains(column1RestaurantsRecord.reference)) {
                                                                                  logFirebaseEvent('Stack_Bottom-Sheet');
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return Padding(
                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                        child: Container(
                                                                                          height: 470,
                                                                                          child: EditDealWidget(),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                }
                                                                              },
                                                                              child: Stack(
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                                                                                    child: InkWell(
                                                                                      onLongPress: () async {
                                                                                        logFirebaseEvent('RESTAURANT_DETAILS_Container_186pby1w_ON');
                                                                                        logFirebaseEvent('Container_Bottom-Sheet');
                                                                                        await showModalBottomSheet(
                                                                                          isScrollControlled: true,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          context: context,
                                                                                          builder: (context) {
                                                                                            return Padding(
                                                                                              padding: MediaQuery.of(context).viewInsets,
                                                                                              child: Container(
                                                                                                height: 470,
                                                                                                child: EditDealWidget(
                                                                                                  restaurant: column1RestaurantsRecord,
                                                                                                  deal: listViewDealsRecord,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Container(
                                                                                        width: MediaQuery.of(context).size.width * 0.86,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.white,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 3,
                                                                                              color: Color(0x25000000),
                                                                                              offset: Offset(0, 2),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                        child: InkWell(
                                                                                          onTap: () async {
                                                                                            logFirebaseEvent('RESTAURANT_DETAILS_Row_tq78hxet_ON_TAP');
                                                                                            logFirebaseEvent('Row_Bottom-Sheet');
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
                                                                                                      deal: listViewDealsRecord,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                                                                                child: Container(
                                                                                                  width: 4,
                                                                                                  height: 90,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                    borderRadius: BorderRadius.circular(4),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: 200,
                                                                                                height: 100,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 16, 12),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        listViewDealsRecord.title!,
                                                                                                        style: FlutterFlowTheme.of(context).title2.override(
                                                                                                              fontFamily: 'Lexend Deca',
                                                                                                              color: Color(0xFF090F13),
                                                                                                              fontSize: 22,
                                                                                                              fontWeight: FontWeight.w800,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                                        child: Text(
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
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                                        child: Text(
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
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 5,
                                                                                                    height: 10,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xFFEEEEEE),
                                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 5,
                                                                                                    height: 5,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 5,
                                                                                                    height: 10,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xFFEEEEEE),
                                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 5,
                                                                                                    height: 5,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 5,
                                                                                                    height: 10,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xFFEEEEEE),
                                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 5,
                                                                                                    height: 5,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 5,
                                                                                                    height: 10,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xFFEEEEEE),
                                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 5,
                                                                                                    height: 5,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 5,
                                                                                                    height: 10,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xFFEEEEEE),
                                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 5,
                                                                                                    height: 5,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 5,
                                                                                                    height: 10,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xFFEEEEEE),
                                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 5,
                                                                                                    height: 5,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 5,
                                                                                                    height: 10,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xFFEEEEEE),
                                                                                                      borderRadius: BorderRadius.circular(8),
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
                                                                                    alignment: AlignmentDirectional(1, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                                                      child: Container(
                                                                                        width: 50,
                                                                                        height: 50,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryDark,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 1,
                                                                                              color: FlutterFlowTheme.of(context).primaryDark,
                                                                                            )
                                                                                          ],
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.6, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                                                      child: StreamBuilder<RestaurantsRecord>(
                                                                                        stream: RestaurantsRecord.getDocument(listViewDealsRecord.restRef!),
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
                                                                                          final circleImageRestaurantsRecord = snapshot.data!;
                                                                                          return Container(
                                                                                            width: 60,
                                                                                            height: 60,
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 55),
                                                                                        child: Icon(
                                                                                          Icons.favorite_rounded,
                                                                                          color: Color(0xFFB20000),
                                                                                          size: 24,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 20, 20, 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 50,
                                decoration: BoxDecoration(),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'RESTAURANT_DETAILS_SUBMIT_REVIEW_BTN_ON_');
                                    logFirebaseEvent('Button_Navigate-To');

                                    context.pushNamed(
                                      'submitReviewPage',
                                      queryParams: {
                                        'restaurant': serializeParam(
                                            column1RestaurantsRecord,
                                            ParamType.Document),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'restaurant': column1RestaurantsRecord,
                                      },
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'dt22dswx' /* Submit Review */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 50,
                                    height: 20,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
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
        );
      },
    );
  }
}
