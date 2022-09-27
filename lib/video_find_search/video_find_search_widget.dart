import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

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
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<PostsRecord>? algoliaSearchResults1 = [];
  TextEditingController? textController;
  List<PostsRecord>? algoliaSearchResults2 = [];

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'videoFindSearch'});
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: Image.asset(
                      'assets/images/2b9dd548d942db180979cf95e3d11ea1.jpg',
                    ).image,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.transparent,
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1E2429), Color(0xB60F0F0F)],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 56, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'VIDEO_FIND_SEARCH_arrow_back_rounded_ICN');
                                logFirebaseEvent('IconButton_Navigate-Back');
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
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                              child: AuthUserStreamWidget(
                                child: Text(
                                  currentUserDisplayName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFFEE8B60),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ic7m8qy9' /* Discover Foodies */,
                            ),
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.96,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0x9AFFFFFF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 0),
                                    child: TextFormField(
                                      controller: textController,
                                      onFieldSubmitted: (_) async {
                                        logFirebaseEvent(
                                            'VIDEO_FIND_SEARCH_TextField_gazr18ly_ON_');
                                        logFirebaseEvent(
                                            'TextField_Algolia-Search');
                                        setState(
                                            () => algoliaSearchResults1 = null);
                                        await PostsRecord.search(
                                          term: textController!.text,
                                        )
                                            .then((r) =>
                                                algoliaSearchResults1 = r)
                                            .onError((_, __) =>
                                                algoliaSearchResults1 = [])
                                            .whenComplete(
                                                () => setState(() {}));
                                      },
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'dydhi5e7' /* Search for reviews... */,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
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
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFF1E2429),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    buttonSize: 46,
                                    icon: Icon(
                                      Icons.search_outlined,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'VIDEO_FIND_SEARCH_search_outlined_ICN_ON');
                                      logFirebaseEvent(
                                          'IconButton_Algolia-Search');
                                      setState(
                                          () => algoliaSearchResults2 = null);
                                      await PostsRecord.search(
                                        term: textController!.text,
                                      )
                                          .then(
                                              (r) => algoliaSearchResults2 = r)
                                          .onError((_, __) =>
                                              algoliaSearchResults2 = [])
                                          .whenComplete(() => setState(() {}));
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
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '4t9te03n' /* Nearby */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'VIDEO_FIND_SEARCH_Text_6c6cfl7l_ON_TAP');
                        logFirebaseEvent('Text_Navigate-To');

                        context.pushNamed(
                          'nearbyVideoPage',
                          queryParams: {
                            'initialStoryIndex':
                                serializeParam(0, ParamType.int),
                          }.withoutNulls,
                        );
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'v6fomt17' /* see all... */,
                        ),
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                child: FutureBuilder<List<PostsRecord>>(
                  future: PostsRecord.search(
                    term: valueOrDefault<String>(
                      textController!.text,
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
                          width: 30,
                          height: 30,
                          child: SpinKitThreeBounce(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 30,
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
                                textController!.text,
                                eventsListPostsRecord.description),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                              child: StreamBuilder<PostsRecord>(
                                stream: PostsRecord.getDocument(
                                    eventsListPostsRecord.reference),
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
                                  final eventCardPostsRecord = snapshot.data!;
                                  return InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'VIDEO_FIND_SEARCH_PAGE_eventCard_ON_TAP');
                                      logFirebaseEvent('eventCard_Navigate-To');

                                      context.pushNamed(
                                        'singleVideoPage',
                                        queryParams: {
                                          'post': serializeParam(
                                              eventCardPostsRecord,
                                              ParamType.Document),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'post': eventCardPostsRecord,
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 95.63,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryDark,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            color: Color(0x64000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Stack(
                                        children: [
                                          FlutterFlowMediaDisplay(
                                            path: valueOrDefault<String>(
                                              eventsListPostsRecord
                                                  .videoThumbnail,
                                              'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                            ),
                                            imageBuilder: (path) => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                                              width: 300,
                                              autoPlay: false,
                                              looping: true,
                                              showControls: false,
                                              allowFullScreen: false,
                                              allowPlaybackSpeedMenu: false,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 130, 0, 0),
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                                shape: BoxShape.circle,
                                              ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
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
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          fontSize: 22,
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
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '5dqzmrjc' /* Search Results */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 344,
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryDark,
                        ),
                        child: FutureBuilder<List<PostsRecord>>(
                          future: PostsRecord.search(
                            term: textController!.text,
                            maxResults: 30,
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
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.58,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: gridViewPostsRecordList.length,
                              itemBuilder: (context, gridViewIndex) {
                                final gridViewPostsRecord =
                                    gridViewPostsRecordList[gridViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 16, 8),
                                  child: StreamBuilder<PostsRecord>(
                                    stream: PostsRecord.getDocument(
                                        gridViewPostsRecord.reference),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: SpinKitThreeBounce(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 30,
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
                                              'eventCard_Navigate-To');

                                          context.pushNamed(
                                            'singleVideoPage',
                                            queryParams: {
                                              'post': serializeParam(
                                                  eventCardPostsRecord,
                                                  ParamType.Document),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'post': eventCardPostsRecord,
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 95.63,
                                          height: 170,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryDark,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3,
                                                color: Color(0x64000000),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 170,
                                            child: Stack(
                                              children: [
                                                FlutterFlowMediaDisplay(
                                                  path: valueOrDefault<String>(
                                                    gridViewPostsRecord
                                                        .videoThumbnail,
                                                    'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                                  ),
                                                  imageBuilder: (path) =>
                                                      ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: CachedNetworkImage(
                                                      imageUrl: path,
                                                      width: 95.63,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              1,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  videoPlayerBuilder: (path) =>
                                                      FlutterFlowVideoPlayer(
                                                    path: path,
                                                    width: 95.63,
                                                    height: 170,
                                                    autoPlay: false,
                                                    looping: true,
                                                    showControls: false,
                                                    allowFullScreen: false,
                                                    allowPlaybackSpeedMenu:
                                                        false,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 130, 0, 0),
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEEEEEE),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          eventCardPostsRecord
                                                              .userRating,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '0',
                                                          locale: '',
                                                        ),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                fontSize: 22,
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
    );
  }
}
