import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_find_search_model.dart';
export 'video_find_search_model.dart';

class VideoFindSearchWidget extends StatefulWidget {
  const VideoFindSearchWidget({
    Key? key,
    this.posts,
  }) : super(key: key);

  final PostsRecord? posts;

  @override
  _VideoFindSearchWidgetState createState() => _VideoFindSearchWidgetState();
}

class _VideoFindSearchWidgetState extends State<VideoFindSearchWidget> {
  late VideoFindSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoFindSearchModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'videoFindSearch'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.textController ??= TextEditingController();
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
        title: 'videoFindSearch',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.asset(
                          'assets/images/2b9dd548d942db180979cf95e3d11ea1.jpg',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Colors.transparent,
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x001E2429),
                            FlutterFlowTheme.of(context).secondaryBackground
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 56.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'VIDEO_FIND_SEARCH_arrow_back_rounded_ICN');
                                    logFirebaseEvent(
                                        'IconButton_navigate_back');
                                    context.pop();
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '5md8lscs' /* Hey */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      currentUserDisplayName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFFEE8B60),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ic7m8qy9' /* Discover Foodies */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 12.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.96,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0x9AFFFFFF),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          onFieldSubmitted: (_) async {
                                            logFirebaseEvent(
                                                'VIDEO_FIND_SEARCH_TextField_gazr18ly_ON_');
                                            logFirebaseEvent(
                                                'TextField_algolia_search');
                                            setState(() => _model
                                                .algoliaSearchResults1 = null);
                                            await PostsRecord.search(
                                              term: _model.textController.text,
                                            )
                                                .then((r) => _model
                                                    .algoliaSearchResults1 = r)
                                                .onError((_, __) => _model
                                                    .algoliaSearchResults1 = [])
                                                .whenComplete(
                                                    () => setState(() {}));
                                          },
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'dydhi5e7' /* Search for reviews... */,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF1A1F24),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0xFF1E2429),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        buttonSize: 46.0,
                                        icon: Icon(
                                          Icons.search_outlined,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'VIDEO_FIND_SEARCH_search_outlined_ICN_ON');
                                          logFirebaseEvent(
                                              'IconButton_algolia_search');
                                          setState(() => _model
                                              .algoliaSearchResults2 = null);
                                          await PostsRecord.search(
                                            term: _model.textController.text,
                                          )
                                              .then((r) => _model
                                                  .algoliaSearchResults2 = r)
                                              .onError((_, __) => _model
                                                  .algoliaSearchResults2 = [])
                                              .whenComplete(
                                                  () => setState(() {}));
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
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '4t9te03n' /* Nearby */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'VIDEO_FIND_SEARCH_Text_6c6cfl7l_ON_TAP');
                            logFirebaseEvent('Text_navigate_to');

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
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'v6fomt17' /* see all... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                    child: FutureBuilder<List<PostsRecord>>(
                      future: PostsRecord.search(
                        term: valueOrDefault<String>(
                          _model.textController.text,
                          '*',
                        ),
                        location: getCurrentUserLocation(
                            defaultLocation: LatLng(37.4298229, -122.1735655)),
                        maxResults: 20,
                        searchRadiusMeters: 8046.72,
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
                        List<PostsRecord> eventsListPostsRecordList =
                            snapshot.data!;
                        // Customize what your widget looks like with no search results.
                        if (snapshot.data!.isEmpty) {
                          return Container(
                            height: 100,
                            child: Center(
                              child: Text('No results.'),
                            ),
                          );
                        }
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:
                                List.generate(eventsListPostsRecordList.length,
                                    (eventsListIndex) {
                              final eventsListPostsRecord =
                                  eventsListPostsRecordList[eventsListIndex];
                              return Visibility(
                                visible: functions.showSearchResult(
                                    _model.textController.text,
                                    eventsListPostsRecord.description),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 16.0, 8.0),
                                  child: StreamBuilder<PostsRecord>(
                                    stream: PostsRecord.getDocument(
                                        eventsListPostsRecord.reference),
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
                                      final eventCardPostsRecord =
                                          snapshot.data!;
                                      return InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'VIDEO_FIND_SEARCH_PAGE_eventCard_ON_TAP');
                                          logFirebaseEvent(
                                              'eventCard_navigate_to');

                                          context.pushNamed(
                                            'singleVideoPage',
                                            queryParams: {
                                              'post': serializeParam(
                                                eventCardPostsRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'post': eventCardPostsRecord,
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 95.63,
                                          height: 170.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryDark,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3.0,
                                                color: Color(0x64000000),
                                                offset: Offset(0.0, 2.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Stack(
                                            children: [
                                              FlutterFlowMediaDisplay(
                                                path: valueOrDefault<String>(
                                                  eventsListPostsRecord
                                                      .videoThumbnail,
                                                  'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                                ),
                                                imageBuilder: (path) =>
                                                    ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: CachedNetworkImage(
                                                    imageUrl: path,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                videoPlayerBuilder: (path) =>
                                                    FlutterFlowVideoPlayer(
                                                  path: path,
                                                  width: 300.0,
                                                  autoPlay: false,
                                                  looping: true,
                                                  showControls: false,
                                                  allowFullScreen: false,
                                                  allowPlaybackSpeedMenu: false,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 130.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      () {
                                                        if (eventCardPostsRecord
                                                                .userRating ==
                                                            5.0) {
                                                          return Color(
                                                              0xFF3FDF86);
                                                        } else if (eventCardPostsRecord
                                                                .userRating ==
                                                            4.0) {
                                                          return Color(
                                                              0xFFC3DF3F);
                                                        } else if (eventCardPostsRecord
                                                                .userRating ==
                                                            3.0) {
                                                          return Color(
                                                              0xFFDFCB3F);
                                                        } else if (eventCardPostsRecord
                                                                .userRating ==
                                                            2.0) {
                                                          return Color(
                                                              0xFFDF993F);
                                                        } else if (eventCardPostsRecord
                                                                .userRating ==
                                                            1.0) {
                                                          return Color(
                                                              0xFFDF5A3F);
                                                        } else {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground;
                                                        }
                                                      }(),
                                                      Color(0x8E95A1AC),
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        eventCardPostsRecord
                                                            .userRating,
                                                        formatType:
                                                            FormatType.custom,
                                                        format: '0',
                                                        locale: 'en-us',
                                                      ),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          fontSize: 22.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '5dqzmrjc' /* Search Results */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 344.0,
                            height: MediaQuery.of(context).size.height * 1.0,
                            decoration: BoxDecoration(),
                            child: FutureBuilder<List<PostsRecord>>(
                              future: PostsRecord.search(
                                term: _model.textController.text,
                                maxResults: 30,
                              ),
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
                                List<PostsRecord> gridViewPostsRecordList =
                                    snapshot.data!;
                                // Customize what your widget looks like with no search results.
                                if (snapshot.data!.isEmpty) {
                                  return Container(
                                    height: 100,
                                    child: Center(
                                      child: Text('No results.'),
                                    ),
                                  );
                                }
                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 1.0,
                                    mainAxisSpacing: 10.0,
                                    childAspectRatio: 0.58,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: gridViewPostsRecordList.length,
                                  itemBuilder: (context, gridViewIndex) {
                                    final gridViewPostsRecord =
                                        gridViewPostsRecordList[gridViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 16.0, 8.0),
                                      child: StreamBuilder<PostsRecord>(
                                        stream: PostsRecord.getDocument(
                                            gridViewPostsRecord.reference),
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
                                          final eventCardPostsRecord =
                                              snapshot.data!;
                                          return InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'VIDEO_FIND_SEARCH_PAGE_eventCard_ON_TAP');
                                              logFirebaseEvent(
                                                  'eventCard_navigate_to');

                                              context.pushNamed(
                                                'singleVideoPage',
                                                queryParams: {
                                                  'post': serializeParam(
                                                    eventCardPostsRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'post': eventCardPostsRecord,
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 95.63,
                                              height: 170.0,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 3.0,
                                                    color: Color(0x64000000),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    1.0,
                                                height: 170.0,
                                                child: Stack(
                                                  children: [
                                                    FlutterFlowMediaDisplay(
                                                      path: valueOrDefault<
                                                          String>(
                                                        gridViewPostsRecord
                                                            .videoThumbnail,
                                                        'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                                      ),
                                                      imageBuilder: (path) =>
                                                          ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: path,
                                                          width: 95.63,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              1.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      videoPlayerBuilder: (path) =>
                                                          FlutterFlowVideoPlayer(
                                                        path: path,
                                                        width: 95.63,
                                                        height: 170.0,
                                                        autoPlay: false,
                                                        looping: true,
                                                        showControls: false,
                                                        allowFullScreen: false,
                                                        allowPlaybackSpeedMenu:
                                                            false,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  130.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            () {
                                                              if (eventCardPostsRecord
                                                                      .userRating ==
                                                                  5.0) {
                                                                return Color(
                                                                    0xFF3FDF86);
                                                              } else if (eventCardPostsRecord
                                                                      .userRating ==
                                                                  4.0) {
                                                                return Color(
                                                                    0xFFC3DF3F);
                                                              } else if (eventCardPostsRecord
                                                                      .userRating ==
                                                                  3.0) {
                                                                return Color(
                                                                    0xFFDFCB3F);
                                                              } else if (eventCardPostsRecord
                                                                      .userRating ==
                                                                  2.0) {
                                                                return Color(
                                                                    0xFFDF993F);
                                                              } else if (eventCardPostsRecord
                                                                      .userRating ==
                                                                  1.0) {
                                                                return Color(
                                                                    0xFFDF5A3F);
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground;
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
                                                          valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              eventCardPostsRecord
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
                                                                fontSize: 22.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
