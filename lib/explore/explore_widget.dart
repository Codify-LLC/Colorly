import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/deal_popup_widget.dart';
import '../components/delivery_sheet_widget.dart';
import '../components/empty_reviews_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';

class ExploreWidget extends StatefulWidget {
  const ExploreWidget({
    Key? key,
    this.restaurants,
    this.posts,
    this.addNumber,
    this.addNumberRef,
  }) : super(key: key);

  final RestaurantsRecord? restaurants;
  final PostsRecord? posts;
  final AddNumberRecord? addNumber;
  final DocumentReference? addNumberRef;

  @override
  _ExploreWidgetState createState() => _ExploreWidgetState();
}

class _ExploreWidgetState extends State<ExploreWidget>
    with TickerProviderStateMixin {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PagingController<DocumentSnapshot?, StoriesRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  String? cuisineChoiceChipsValue;
  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 960,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0.9,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
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
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 690,
      hideBeforeAnimating: false,
      fadeIn: true,
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
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(60, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
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
    'containerOnPageLoadAnimation4': AnimationInfo(
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
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'explore'});
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
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
    return AuthUserStreamWidget(
      child: StreamBuilder<AddNumberRecord>(
        stream: AddNumberRecord.getDocument(currentUserDocument!.addNumberRef!),
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
          final exploreAddNumberRecord = snapshot.data!;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryDark,
              automaticallyImplyLeading: false,
              title: Text(
                FFLocalizations.of(context).getText(
                  'rbd97x1i' /* Explore */,
                ),
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 22,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 4,
            ),
            backgroundColor: FlutterFlowTheme.of(context).primaryDark,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                logFirebaseEvent('EXPLORE_FloatingActionButton_ahvt8hth_ON');
                logFirebaseEvent('FloatingActionButton_Navigate-To');

                context.pushNamed('mapResultsPage');
              },
              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
              elevation: 8,
              child: FaIcon(
                FontAwesomeIcons.mapMarked,
                color: FlutterFlowTheme.of(context).tertiaryColor,
                size: 24,
              ),
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryDark,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                            child: PagedListView<DocumentSnapshot<Object?>?,
                                StoriesRecord>(
                              pagingController: () {
                                final Query<Object?> Function(Query<Object?>)
                                    queryBuilder = (storiesRecord) =>
                                        storiesRecord.orderBy('created_time',
                                            descending: true);
                                if (_pagingController != null) {
                                  final query =
                                      queryBuilder(StoriesRecord.collection);
                                  if (query != _pagingQuery) {
                                    // The query has changed
                                    _pagingQuery = query;
                                    _streamSubscriptions
                                        .forEach((s) => s?.cancel());
                                    _streamSubscriptions.clear();
                                    _pagingController!.refresh();
                                  }
                                  return _pagingController!;
                                }

                                _pagingController =
                                    PagingController(firstPageKey: null);
                                _pagingQuery =
                                    queryBuilder(StoriesRecord.collection);
                                _pagingController!
                                    .addPageRequestListener((nextPageMarker) {
                                  queryStoriesRecordPage(
                                    queryBuilder: (storiesRecord) =>
                                        storiesRecord.orderBy('created_time',
                                            descending: true),
                                    nextPageMarker: nextPageMarker,
                                    pageSize: 4,
                                    isStream: true,
                                  ).then((page) {
                                    _pagingController!.appendPage(
                                      page.data,
                                      page.nextPageMarker,
                                    );
                                    final streamSubscription =
                                        page.dataStream?.listen((data) {
                                      final itemIndexes = _pagingController!
                                          .itemList!
                                          .asMap()
                                          .map((k, v) =>
                                              MapEntry(v.reference.id, k));
                                      data.forEach((item) {
                                        final index =
                                            itemIndexes[item.reference.id];
                                        final items =
                                            _pagingController!.itemList!;
                                        if (index != null) {
                                          items.replaceRange(
                                              index, index + 1, [item]);
                                          _pagingController!.itemList = {
                                            for (var item in items)
                                              item.reference: item
                                          }.values.toList();
                                        }
                                      });
                                      setState(() {});
                                    });
                                    _streamSubscriptions
                                        .add(streamSubscription);
                                  });
                                });
                                return _pagingController!;
                              }(),
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              builderDelegate:
                                  PagedChildBuilderDelegate<StoriesRecord>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: SpinKitThreeBounce(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                noItemsFoundIndicatorBuilder: (_) => Center(
                                  child: Image.asset(
                                    'assets/images/no_stories.png',
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                                itemBuilder: (context, _, listViewIndex) {
                                  final listViewStoriesRecord =
                                      _pagingController!
                                          .itemList![listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 8, 0),
                                    child: StreamBuilder<RestaurantsRecord>(
                                      stream: RestaurantsRecord.getDocument(
                                          listViewStoriesRecord.restRef!),
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
                                        final columnRestaurantsRecord =
                                            snapshot.data!;
                                        return InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'EXPLORE_PAGE_Column_1mfwp4p9_ON_TAP');
                                            logFirebaseEvent(
                                                'Column_Navigate-To');

                                            context.pushNamed(
                                              'storyDetails',
                                              queryParams: {
                                                'initialStoryIndex':
                                                    serializeParam(
                                                        listViewIndex,
                                                        ParamType.int),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .bottomToTop,
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                ),
                                              },
                                            );

                                            logFirebaseEvent(
                                                'Column_Backend-Call');

                                            final restaurantsUpdateData = {
                                              'storyClicks':
                                                  FieldValue.increment(1),
                                            };
                                            await columnRestaurantsRecord
                                                .reference
                                                .update(restaurantsUpdateData);
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Stack(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Container(
                                                      width: 70,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor
                                                          ],
                                                          stops: [0, 1],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0, -1),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1),
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 60,
                                                    height: 60,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: CachedNetworkImage(
                                                      imageUrl: valueOrDefault<
                                                          String>(
                                                        columnRestaurantsRecord
                                                            .logo,
                                                        'https://picsum.photos/seed/784/600',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              AutoSizeText(
                                                columnRestaurantsRecord
                                                    .restaurantName!
                                                    .maybeHandleOverflow(
                                                  maxChars: 12,
                                                  replacement: '…',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
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
                              ),
                            ).animated([
                              animationsMap['listViewOnPageLoadAnimation']!
                            ]),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryDark,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Color(0xFFEEEEEE),
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 8, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'EXPLORE_PAGE_Row_a71idz3c_ON_TAP');
                                        logFirebaseEvent('Row_Navigate-To');

                                        context.pushNamed('searchResults');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 4, 0),
                                            child: Icon(
                                              Icons.search_rounded,
                                              color: Color(0xFF95A1AC),
                                              size: 24,
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'xxvno4qr' /* Search for restaurants... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
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
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.62,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryDark,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: FlutterFlowChoiceChips(
                                        initiallySelected:
                                            cuisineChoiceChipsValue != null
                                                ? [cuisineChoiceChipsValue!]
                                                : [
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'd3ssey2a' /* American */,
                                                    )
                                                  ],
                                        options: [
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'j65kdlwh' /* American */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'qa7gthbw' /* Mexican */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'b5o4m8y2' /* Asian */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'dximdfj3' /* Italian */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '5wjgqr9n' /* Jamaican */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'qtr5p0ok' /* Indian */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'wa1pkysa' /* Greek */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'emodptq1' /* Japanese */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'q6ck8y7k' /* Pizza */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '87sbiwtz' /* Burger */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '84puncok' /* Barbeque */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'xqjhvxth' /* Breakfast */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'ojllc3c6' /* Thai */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '0rotqp72' /* Canadian */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '10twe1q0' /* French */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '7j89pi0d' /* Middle Eastern */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '2jfa89f4' /* Latin */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'a3d7qq0v' /* Noodle */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'gl7xpcmz' /* Seafood */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'b4p2cp8y' /* Street Food */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'ffeoj8fl' /* Vegetarian */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'm7q27ipq' /* Soul Food */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'fl95jtxy' /* Kebab */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'lwnsccdk' /* Brunch */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'by7a5dcu' /* German */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '8qznyg9i' /* African */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '0u9ok5qe' /* Cajun */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'dgiwa4li' /* Irish */,
                                          ))
                                        ],
                                        onChanged: (val) => setState(() =>
                                            cuisineChoiceChipsValue =
                                                val?.first),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Colors.white,
                                                  ),
                                          iconColor: Colors.white,
                                          iconSize: 18,
                                          elevation: 2,
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor: Colors.white,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF262D34),
                                                  ),
                                          iconColor: Color(0xFF262D34),
                                          iconSize: 18,
                                          elevation: 4,
                                        ),
                                        chipSpacing: 10,
                                        multiselect: false,
                                        initialized:
                                            cuisineChoiceChipsValue != null,
                                        alignment: WrapAlignment.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 10, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'nzm6gt47' /* Nerarby Restaurants */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 20,
                                          ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'EXPLORE_PAGE_Row_uhmul165_ON_TAP');
                                        logFirebaseEvent('Row_Navigate-To');

                                        context.pushNamed('nearbyRestaurants');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '615djvxq' /* more */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: FutureBuilder<List<RestaurantsRecord>>(
                                  future: RestaurantsRecord.search(
                                    term: cuisineChoiceChipsValue,
                                    location: getCurrentUserLocation(
                                        defaultLocation:
                                            LatLng(37.4298229, -122.1735655)),
                                    searchRadiusMeters: 8000,
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
                                    List<RestaurantsRecord>
                                        rowRestaurantsRecordList =
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: List.generate(
                                            rowRestaurantsRecordList.length,
                                            (rowIndex) {
                                          final rowRestaurantsRecord =
                                              rowRestaurantsRecordList[
                                                  rowIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryDark,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 2, 10, 0),
                                                child: StreamBuilder<
                                                    RestaurantsRecord>(
                                                  stream: RestaurantsRecord
                                                      .getDocument(
                                                          rowRestaurantsRecord
                                                              .reference),
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
                                                    final storeListViewRestaurantsRecord =
                                                        snapshot.data!;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 10),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 4,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.9,
                                                              height: 290,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFEEEEEE),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryDark,
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'EXPLORE_PAGE_Container_rwe7bbxq_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Container_Navigate-To');

                                                                      context
                                                                          .pushNamed(
                                                                        'restaurantDetails',
                                                                        queryParams:
                                                                            {
                                                                          'restaurant': serializeParam(
                                                                              storeListViewRestaurantsRecord.reference,
                                                                              ParamType.DocumentReference),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      elevation:
                                                                          1,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        height:
                                                                            120,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                            logFirebaseEvent('EXPLORE_PAGE_Image_9mijcnlr_ON_TAP');
                                                                                            logFirebaseEvent('Image_Navigate-To');

                                                                                            context.pushNamed(
                                                                                              'restaurantDetails',
                                                                                              queryParams: {
                                                                                                'restaurant': serializeParam(storeListViewRestaurantsRecord.reference, ParamType.DocumentReference),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          },
                                                                                          child: Hero(
                                                                                            tag: valueOrDefault<String>(
                                                                                              storeListViewRestaurantsRecord.featuredImage,
                                                                                              'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg' + '$rowIndex',
                                                                                            ),
                                                                                            transitionOnUserGestures: true,
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8),
                                                                                              child: CachedNetworkImage(
                                                                                                imageUrl: valueOrDefault<String>(
                                                                                                  storeListViewRestaurantsRecord.featuredImage,
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
                                                                                      stream: RestaurantsRecord.getDocument(storeListViewRestaurantsRecord.reference),
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
                                                                                                  storeListViewRestaurantsRecord.logo,
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
                                                                                        queryBuilder: (postsRecord) => postsRecord.where('rest_ref', isEqualTo: storeListViewRestaurantsRecord.reference),
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
                                                                                            storeListViewRestaurantsRecord.restaurantName!.maybeHandleOverflow(
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
                                                                                            storeListViewRestaurantsRecord.restAddress!.maybeHandleOverflow(
                                                                                              maxChars: 20,
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
                                                                                              storeListViewRestaurantsRecord.categories,
                                                                                              '-',
                                                                                            ).maybeHandleOverflow(
                                                                                              maxChars: 16,
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
                                                                                              storeListViewRestaurantsRecord.priceRange,
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
                                                                                                '${storeListViewRestaurantsRecord.reviews?.toString()} reviews',
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
                                                                                              '${functions.getDistance(currentUserLocationValue, storeListViewRestaurantsRecord.restLatLong)} miles away',
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
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30,
                                                                            borderWidth:
                                                                                1,
                                                                            buttonSize:
                                                                                60,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.phone,
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 30,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('EXPLORE_PAGE_phone_ICN_ON_TAP');
                                                                              logFirebaseEvent('IconButton_Backend-Call');

                                                                              final restaurantsUpdateData = {
                                                                                'phoneClicks': FieldValue.increment(1),
                                                                              };
                                                                              await storeListViewRestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                              logFirebaseEvent('IconButton_Launch-U-R-L');
                                                                              await launchURL('tel:${storeListViewRestaurantsRecord.phoneNumber}');
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30,
                                                                            borderWidth:
                                                                                1,
                                                                            buttonSize:
                                                                                60,
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.mapMarkedAlt,
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 30,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('EXPLORE_PAGE_mapMarkedAlt_ICN_ON_TAP');
                                                                              logFirebaseEvent('IconButton_Backend-Call');

                                                                              final restaurantsUpdateData = {
                                                                                'mapClicks': FieldValue.increment(1),
                                                                              };
                                                                              await storeListViewRestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                              logFirebaseEvent('IconButton_Launch-U-R-L');
                                                                              await launchURL(functions.getMapUrl(storeListViewRestaurantsRecord.restLatLong));
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30,
                                                                            borderWidth:
                                                                                1,
                                                                            buttonSize:
                                                                                60,
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.globe,
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 30,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('EXPLORE_PAGE_globe_ICN_ON_TAP');
                                                                              logFirebaseEvent('IconButton_Backend-Call');

                                                                              final restaurantsUpdateData = {
                                                                                'websiteClicks': FieldValue.increment(1),
                                                                              };
                                                                              await storeListViewRestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                              logFirebaseEvent('IconButton_Launch-U-R-L');
                                                                              await launchURL(storeListViewRestaurantsRecord.website!);
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      if (storeListViewRestaurantsRecord
                                                                              .isSubscribed ??
                                                                          true)
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
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
                                                                                logFirebaseEvent('EXPLORE_PAGE_fastfood_rounded_ICN_ON_TAP');
                                                                                logFirebaseEvent('IconButton_Backend-Call');

                                                                                final restaurantsUpdateData = {
                                                                                  'orderNowClicks': FieldValue.increment(1),
                                                                                };
                                                                                await storeListViewRestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                logFirebaseEvent('IconButton_Bottom-Sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: Container(
                                                                                        height: 400,
                                                                                        child: DeliverySheetWidget(
                                                                                          restaurant: storeListViewRestaurantsRecord,
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
                                                                  StreamBuilder<
                                                                      List<
                                                                          PostsRecord>>(
                                                                    stream:
                                                                        queryPostsRecord(
                                                                      queryBuilder: (postsRecord) => postsRecord.where(
                                                                          'rest_ref',
                                                                          isEqualTo:
                                                                              storeListViewRestaurantsRecord.reference),
                                                                      limit: 5,
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
                                                                      List<PostsRecord>
                                                                          rowPostsRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      if (rowPostsRecordList
                                                                          .isEmpty) {
                                                                        return EmptyReviewsWidget(
                                                                          restaurant:
                                                                              storeListViewRestaurantsRecord,
                                                                        );
                                                                      }
                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            rowPostsRecordList.length,
                                                                            (rowIndex) {
                                                                          final rowPostsRecord =
                                                                              rowPostsRecordList[rowIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                9,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: 56.25,
                                                                              height: 100,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFEEEEEE),
                                                                                borderRadius: BorderRadius.circular(8),
                                                                              ),
                                                                              child: InkWell(
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('EXPLORE_PAGE_Image_22dfg9lh_ON_TAP');
                                                                                  logFirebaseEvent('Image_Navigate-To');

                                                                                  context.pushNamed(
                                                                                    'restaurantReviewsList',
                                                                                    queryParams: {
                                                                                      'initialStoryIndex': serializeParam(rowIndex, ParamType.int),
                                                                                      'restaurant': serializeParam(storeListViewRestaurantsRecord, ParamType.Document),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'restaurant': storeListViewRestaurantsRecord,
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                  child: CachedNetworkImage(
                                                                                    imageUrl: valueOrDefault<String>(
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
                                                                      ).animated([
                                                                        animationsMap[
                                                                            'rowOnPageLoadAnimation']!
                                                                      ]);
                                                                    },
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
                                              animationsMap[
                                                  'containerOnPageLoadAnimation1']!
                                            ]),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '0ucitqat' /* Curated For Foodies */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFFEEEEEE),
                                          ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'EXPLORE_PAGE_Row_gl8d6712_ON_TAP');
                                        logFirebaseEvent('Row_Navigate-To');

                                        context.pushNamed('curatedListPage');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '3mijylyc' /* more */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 210,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryDark,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: 210,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryDark,
                                        ),
                                        child: StreamBuilder<
                                            List<CuratedListsRecord>>(
                                          stream: queryCuratedListsRecord(
                                            limit: 10,
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
                                            List<CuratedListsRecord>
                                                listViewCuratedListsRecordList =
                                                snapshot.data!;
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewCuratedListsRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewCuratedListsRecord =
                                                    listViewCuratedListsRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 8, 0, 12),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'EXPLORE_PAGE_Container_ogu0kkqe_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_Navigate-To');

                                                      context.pushNamed(
                                                        'curatedListSwipe',
                                                        queryParams: {
                                                          'curatedList':
                                                              serializeParam(
                                                                  listViewCuratedListsRecord,
                                                                  ParamType
                                                                      .Document),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'curatedList':
                                                              listViewCuratedListsRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 270,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 8,
                                                            color: Color(
                                                                0x230F1113),
                                                            offset:
                                                                Offset(0, 4),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFF1F4F8),
                                                          width: 1,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0),
                                                              topLeft: Radius
                                                                  .circular(12),
                                                              topRight: Radius
                                                                  .circular(12),
                                                            ),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  valueOrDefault<
                                                                      String>(
                                                                listViewCuratedListsRecord
                                                                    .image,
                                                                'https://media.istockphoto.com/photos/romantic-pizza-evening-at-home-picture-id1042399076?k=20&m=1042399076&s=612x612&w=0&h=_U52JZHrtUm8_eus6mBsBXbKcQRaurkaVBkFQhm6lqs=',
                                                              ),
                                                              width: double
                                                                  .infinity,
                                                              height: 110,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16,
                                                                        12,
                                                                        16,
                                                                        12),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      listViewCuratedListsRecord
                                                                          .title!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                Color(0xFF090F13),
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              8,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              '${listViewCuratedListsRecord.followers!.toList().length.toString()} Following',
                                                                              '0 Following',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: Color(0xFF57636C),
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height: 32,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF090F13),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        listViewCuratedListsRecord
                                                                            .range,
                                                                        '\$\$ - \$\$\$\$',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
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
                                                  ).animated([
                                                    animationsMap[
                                                        'containerOnPageLoadAnimation2']!
                                                  ]),
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'lq72ftp7' /* Deals */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 20,
                                          ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'EXPLORE_PAGE_Row_yvau1lv8_ON_TAP');
                                        logFirebaseEvent('Row_Navigate-To');

                                        context.pushNamed('dealPage');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'ku24yuwk' /* more */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              StreamBuilder<List<DealsRecord>>(
                                stream: queryDealsRecord(
                                  queryBuilder: (dealsRecord) => dealsRecord
                                      .where('active', isEqualTo: true)
                                      .where('promoted', isEqualTo: true)
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 30,
                                        ),
                                      ),
                                    );
                                  }
                                  List<DealsRecord> rowDealsRecordList =
                                      snapshot.data!;
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: List.generate(
                                          rowDealsRecordList.length,
                                          (rowIndex) {
                                        final rowDealsRecord =
                                            rowDealsRecordList[rowIndex];
                                        return Visibility(
                                          visible: !(currentUserDocument
                                                      ?.usedDeals
                                                      ?.toList() ??
                                                  [])
                                              .contains(
                                                  rowDealsRecord.reference),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 20),
                                            child: Stack(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 12, 16, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'EXPLORE_PAGE_Container_w8rbwezc_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_Bottom-Sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child: Container(
                                                              height: 800,
                                                              child:
                                                                  DealPopupWidget(
                                                                deal:
                                                                    rowDealsRecord,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    child: Container(
                                                      width: 350,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 3,
                                                            color: Color(
                                                                0x25000000),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        4,
                                                                        4,
                                                                        4),
                                                            child: Container(
                                                              width: 4,
                                                              height: 90,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 200,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          12,
                                                                          16,
                                                                          12),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    rowDealsRecord
                                                                        .title!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .title2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFF090F13),
                                                                          fontSize:
                                                                              22,
                                                                          fontWeight:
                                                                              FontWeight.w800,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      rowDealsRecord
                                                                          .details!
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            21,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                Color(0xFF090F13),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Until ${dateTimeFormat('MMMEd', rowDealsRecord.expiry)}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                Color(0xFF874E00),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
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
                                                                height: 10,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 5,
                                                                height: 5,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 5,
                                                                height: 10,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 5,
                                                                height: 5,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 5,
                                                                height: 10,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 5,
                                                                height: 5,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 5,
                                                                height: 10,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 5,
                                                                height: 5,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 5,
                                                                height: 10,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 5,
                                                                height: 5,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 5,
                                                                height: 10,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 5,
                                                                height: 5,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 5,
                                                                height: 10,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEEEEEE),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(350, 10, 0, 0),
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryDark,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Color(0x4E6E6E6E),
                                                          offset: Offset(-1, 0),
                                                        )
                                                      ],
                                                      shape: BoxShape.circle,
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
                                                            .fromSTEB(
                                                                170, 10, 0, 0),
                                                    child: StreamBuilder<
                                                        RestaurantsRecord>(
                                                      stream: RestaurantsRecord
                                                          .getDocument(
                                                              rowDealsRecord
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
                                                        final circleImageRestaurantsRecord =
                                                            snapshot.data!;
                                                        return Container(
                                                          width: 60,
                                                          height: 60,
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
                                                                circleImageRestaurantsRecord
                                                                    .logo!,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                if (rowDealsRecord.userSaved!
                                                    .toList()
                                                    .contains(
                                                        currentUserReference))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                250, 0, 0, 55),
                                                    child: Icon(
                                                      Icons.favorite_rounded,
                                                      color: Color(0xFFB20000),
                                                      size: 24,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'vnva9ir6' /* Popular */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 20,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              StreamBuilder<List<RestaurantsRecord>>(
                                stream: queryRestaurantsRecord(
                                  queryBuilder: (restaurantsRecord) =>
                                      restaurantsRecord
                                          .where('cardClicks', isGreaterThan: 5)
                                          .orderBy('cardClicks',
                                              descending: true),
                                  limit: 15,
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
                                  List<RestaurantsRecord>
                                      rowRestaurantsRecordList = snapshot.data!;
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: List.generate(
                                          rowRestaurantsRecordList.length,
                                          (rowIndex) {
                                        final rowRestaurantsRecord =
                                            rowRestaurantsRecordList[rowIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: 300,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryDark,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 2, 10, 0),
                                              child: StreamBuilder<
                                                  RestaurantsRecord>(
                                                stream: RestaurantsRecord
                                                    .getDocument(
                                                        rowRestaurantsRecord
                                                            .reference),
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
                                                  final storeListView2RestaurantsRecord =
                                                      snapshot.data!;
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 10,
                                                                    0, 0),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 4,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.9,
                                                            height: 300,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryDark,
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'EXPLORE_PAGE_Container_xdkwyslh_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Container_Backend-Call');

                                                                    final restaurantsUpdateData =
                                                                        {
                                                                      'cardClicks':
                                                                          FieldValue.increment(
                                                                              1),
                                                                    };
                                                                    await storeListView2RestaurantsRecord
                                                                        .reference
                                                                        .update(
                                                                            restaurantsUpdateData);
                                                                    logFirebaseEvent(
                                                                        'Container_Navigate-To');

                                                                    context
                                                                        .pushNamed(
                                                                      'restaurantDetails',
                                                                      queryParams:
                                                                          {
                                                                        'restaurant': serializeParam(
                                                                            storeListView2RestaurantsRecord.reference,
                                                                            ParamType.DocumentReference),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        1,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      height:
                                                                          120,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
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
                                                                                          logFirebaseEvent('EXPLORE_PAGE_Image_otn2i6rb_ON_TAP');
                                                                                          logFirebaseEvent('Image_Expand-Image');
                                                                                          await Navigator.push(
                                                                                            context,
                                                                                            PageTransition(
                                                                                              type: PageTransitionType.fade,
                                                                                              child: FlutterFlowExpandedImageView(
                                                                                                image: CachedNetworkImage(
                                                                                                  imageUrl: valueOrDefault<String>(
                                                                                                    storeListView2RestaurantsRecord.featuredImage,
                                                                                                    'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                                                                                  ),
                                                                                                  fit: BoxFit.contain,
                                                                                                ),
                                                                                                allowRotation: false,
                                                                                                tag: valueOrDefault<String>(
                                                                                                  storeListView2RestaurantsRecord.featuredImage,
                                                                                                  'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg' + '$rowIndex',
                                                                                                ),
                                                                                                useHeroAnimation: true,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                        child: Hero(
                                                                                          tag: valueOrDefault<String>(
                                                                                            storeListView2RestaurantsRecord.featuredImage,
                                                                                            'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg' + '$rowIndex',
                                                                                          ),
                                                                                          transitionOnUserGestures: true,
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                            child: CachedNetworkImage(
                                                                                              imageUrl: valueOrDefault<String>(
                                                                                                storeListView2RestaurantsRecord.featuredImage,
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
                                                                                    stream: RestaurantsRecord.getDocument(storeListView2RestaurantsRecord.reference),
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
                                                                                                storeListView2RestaurantsRecord.logo,
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
                                                                                      queryBuilder: (postsRecord) => postsRecord.where('rest_ref', isEqualTo: storeListView2RestaurantsRecord.reference),
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
                                                                                          storeListView2RestaurantsRecord.restaurantName!.maybeHandleOverflow(
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
                                                                                          storeListView2RestaurantsRecord.restAddress!.maybeHandleOverflow(
                                                                                            maxChars: 20,
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
                                                                                            storeListView2RestaurantsRecord.categories,
                                                                                            '-',
                                                                                          ).maybeHandleOverflow(
                                                                                            maxChars: 16,
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
                                                                                            storeListView2RestaurantsRecord.priceRange,
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
                                                                                                storeListView2RestaurantsRecord.reviews,
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
                                                                                            '${functions.getDistance(currentUserLocationValue, storeListView2RestaurantsRecord.restLatLong)} miles away',
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
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
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
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30,
                                                                          borderWidth:
                                                                              1,
                                                                          buttonSize:
                                                                              60,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.phone,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('EXPLORE_PAGE_phone_ICN_ON_TAP');
                                                                            logFirebaseEvent('IconButton_Backend-Call');

                                                                            final restaurantsUpdateData =
                                                                                {
                                                                              'phoneClicks': FieldValue.increment(1),
                                                                            };
                                                                            await storeListView2RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                            logFirebaseEvent('IconButton_Launch-U-R-L');
                                                                            await launchURL('tel:${storeListView2RestaurantsRecord.phoneNumber}');
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
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30,
                                                                          borderWidth:
                                                                              1,
                                                                          buttonSize:
                                                                              60,
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.mapMarkedAlt,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('EXPLORE_PAGE_mapMarkedAlt_ICN_ON_TAP');
                                                                            logFirebaseEvent('IconButton_Backend-Call');

                                                                            final restaurantsUpdateData =
                                                                                {
                                                                              'mapClicks': FieldValue.increment(1),
                                                                            };
                                                                            await storeListView2RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                            logFirebaseEvent('IconButton_Launch-U-R-L');
                                                                            await launchURL(functions.getMapUrl(storeListView2RestaurantsRecord.restLatLong));
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30,
                                                                          borderWidth:
                                                                              1,
                                                                          buttonSize:
                                                                              60,
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.globe,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('EXPLORE_PAGE_globe_ICN_ON_TAP');
                                                                            logFirebaseEvent('IconButton_Backend-Call');

                                                                            final restaurantsUpdateData =
                                                                                {
                                                                              'websiteClicks': FieldValue.increment(1),
                                                                            };
                                                                            await storeListView2RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                            logFirebaseEvent('IconButton_Launch-U-R-L');
                                                                            await launchURL(storeListView2RestaurantsRecord.website!);
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    if (storeListView2RestaurantsRecord
                                                                            .isSubscribed ??
                                                                        true)
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30,
                                                                            borderWidth:
                                                                                1,
                                                                            buttonSize:
                                                                                60,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.fastfood_rounded,
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 34,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              logFirebaseEvent('EXPLORE_PAGE_fastfood_rounded_ICN_ON_TAP');
                                                                              logFirebaseEvent('IconButton_Backend-Call');

                                                                              final restaurantsUpdateData = {
                                                                                'orderNowClicks': FieldValue.increment(1),
                                                                              };
                                                                              await storeListView2RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                              logFirebaseEvent('IconButton_Bottom-Sheet');
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: Container(
                                                                                      height: 400,
                                                                                      child: DeliverySheetWidget(
                                                                                        restaurant: storeListView2RestaurantsRecord,
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
                                                                StreamBuilder<
                                                                    List<
                                                                        PostsRecord>>(
                                                                  stream:
                                                                      queryPostsRecord(
                                                                    queryBuilder: (postsRecord) => postsRecord.where(
                                                                        'rest_ref',
                                                                        isEqualTo:
                                                                            storeListView2RestaurantsRecord.reference),
                                                                    limit: 5,
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
                                                                    List<PostsRecord>
                                                                        rowPostsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    if (rowPostsRecordList
                                                                        .isEmpty) {
                                                                      return EmptyReviewsWidget(
                                                                        restaurant:
                                                                            storeListView2RestaurantsRecord,
                                                                      );
                                                                    }
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: List.generate(
                                                                          rowPostsRecordList
                                                                              .length,
                                                                          (rowIndex) {
                                                                        final rowPostsRecord =
                                                                            rowPostsRecordList[rowIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              9,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                56.25,
                                                                            height:
                                                                                100,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFEEEEEE),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('EXPLORE_PAGE_Image_ah9aaydg_ON_TAP');
                                                                                logFirebaseEvent('Image_Navigate-To');

                                                                                context.pushNamed(
                                                                                  'restaurantReviewsList',
                                                                                  queryParams: {
                                                                                    'initialStoryIndex': serializeParam(rowIndex, ParamType.int),
                                                                                    'restaurant': serializeParam(storeListView2RestaurantsRecord, ParamType.Document),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    'restaurant': storeListView2RestaurantsRecord,
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                child: CachedNetworkImage(
                                                                                  imageUrl: valueOrDefault<String>(
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
                                            animationsMap[
                                                'containerOnPageLoadAnimation3']!
                                          ]),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 10, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'iegcudt9' /* Top Foodies */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 20,
                                          ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'EXPLORE_PAGE_Row_82yynop9_ON_TAP');
                                        logFirebaseEvent('Row_Navigate-To');

                                        context.pushNamed('searchUsers');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '86crvntw' /* more */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 10, 16, 0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.orderBy(
                                                  'fizzzMonthly',
                                                  descending: true),
                                          limit: 10,
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
                                          List<UsersRecord> rowUsersRecordList =
                                              snapshot.data!
                                                  .where((u) =>
                                                      u.uid != currentUserUid)
                                                  .toList();
                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List.generate(
                                                  rowUsersRecordList.length,
                                                  (rowIndex) {
                                                final rowUsersRecord =
                                                    rowUsersRecordList[
                                                        rowIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 12, 12),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'EXPLORE_PAGE_Container_8pgobz31_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_Navigate-To');

                                                      context.pushNamed(
                                                        'viewProfileOther',
                                                        queryParams: {
                                                          'otherUser':
                                                              serializeParam(
                                                                  rowUsersRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 160,
                                                      height: 136,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x34090F13),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12,
                                                                    12, 12, 12),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  rowUsersRecord
                                                                      .photoUrl,
                                                                  'https://p1.pxfuel.com/preview/828/149/229/indistinct-blurred-pineapple-rough.jpg',
                                                                ),
                                                                width: 60,
                                                                height: 60,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            8,
                                                                            5,
                                                                            0),
                                                                child:
                                                                    AutoSizeText(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    rowUsersRecord
                                                                        .username,
                                                                    '--',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0xFF101213),
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  '${rowUsersRecord.reviews?.toString()} reviews',
                                                                  '0 reviews',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
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
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'q0wenwtb' /* Recommended */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 20,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryDark,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: StreamBuilder<List<RestaurantsRecord>>(
                                    stream: queryRestaurantsRecord(
                                      queryBuilder: (restaurantsRecord) =>
                                          restaurantsRecord
                                              .where('hasAdNumber',
                                                  isEqualTo: true)
                                              .where('adNumber',
                                                  isEqualTo:
                                                      exploreAddNumberRecord
                                                          .count),
                                      limit: 3,
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 30,
                                            ),
                                          ),
                                        );
                                      }
                                      List<RestaurantsRecord>
                                          rowRestaurantsRecordList =
                                          snapshot.data!;
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: List.generate(
                                              rowRestaurantsRecordList.length,
                                              (rowIndex) {
                                            final rowRestaurantsRecord =
                                                rowRestaurantsRecordList[
                                                    rowIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: StreamBuilder<
                                                  AddNumberRecord>(
                                                stream:
                                                    AddNumberRecord.getDocument(
                                                        exploreAddNumberRecord
                                                            .reference),
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
                                                  final containerAddNumberRecord =
                                                      snapshot.data!;
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    height: 300,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryDark,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 2, 0, 0),
                                                      child: StreamBuilder<
                                                          RestaurantsRecord>(
                                                        stream: RestaurantsRecord
                                                            .getDocument(
                                                                rowRestaurantsRecord
                                                                    .reference),
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
                                                          final storeListView3RestaurantsRecord =
                                                              snapshot.data!;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
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
                                                                    height: 350,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFEEEEEE),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryDark,
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('EXPLORE_PAGE_Container_8vpuek94_ON_TAP');
                                                                            logFirebaseEvent('Container_Backend-Call');

                                                                            final restaurantsUpdateData =
                                                                                {
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
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                1,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(16),
                                                                            ),
                                                                            child:
                                                                                Container(
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
                                                                                                  logFirebaseEvent('EXPLORE_PAGE_Image_v4uhdfpd_ON_TAP');
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
                                                                                                    maxChars: 20,
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
                                                                                                    maxChars: 16,
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
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
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
                                                                                    logFirebaseEvent('EXPLORE_PAGE_phone_ICN_ON_TAP');
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
                                                                                    logFirebaseEvent('EXPLORE_PAGE_mapMarkedAlt_ICN_ON_TAP');
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
                                                                                    logFirebaseEvent('EXPLORE_PAGE_globe_ICN_ON_TAP');
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
                                                                            if (storeListView3RestaurantsRecord.isSubscribed ??
                                                                                true)
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
                                                                                      logFirebaseEvent('EXPLORE_PAGE_fastfood_rounded_ICN_ON_TAP');
                                                                                      logFirebaseEvent('IconButton_Backend-Call');

                                                                                      final restaurantsUpdateData = {
                                                                                        'orderNowClicks': FieldValue.increment(1),
                                                                                      };
                                                                                      await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                      logFirebaseEvent('IconButton_Bottom-Sheet');
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return Padding(
                                                                                            padding: MediaQuery.of(context).viewInsets,
                                                                                            child: Container(
                                                                                              height: 400,
                                                                                              child: DeliverySheetWidget(
                                                                                                restaurant: storeListView3RestaurantsRecord,
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
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              10),
                                                                          child:
                                                                              StreamBuilder<List<PostsRecord>>(
                                                                            stream:
                                                                                queryPostsRecord(
                                                                              queryBuilder: (postsRecord) => postsRecord.where('rest_ref', isEqualTo: storeListView3RestaurantsRecord.reference),
                                                                              limit: 5,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                                mainAxisAlignment: MainAxisAlignment.start,
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
                                                                                          logFirebaseEvent('EXPLORE_PAGE_Image_0fwdvpnx_ON_TAP');
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
                                                                                          child: CachedNetworkImage(
                                                                                            imageUrl: valueOrDefault<String>(
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
                                                    animationsMap[
                                                        'containerOnPageLoadAnimation4']!
                                                  ]);
                                                },
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '3p318qod' /* Nearby Video Reviews */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'EXPLORE_PAGE_Text_rz5skmoo_ON_TAP');
                                        logFirebaseEvent('Text_Navigate-To');

                                        context.pushNamed(
                                          'nearbyVideoPage',
                                          queryParams: {
                                            'initialStoryIndex': serializeParam(
                                                0, ParamType.int),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'fpczrisn' /* see all... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 4, 0, 100),
                                child: FutureBuilder<List<PostsRecord>>(
                                  future: PostsRecord.search(
                                    location: getCurrentUserLocation(
                                        defaultLocation:
                                            LatLng(37.4298229, -122.1735655)),
                                    maxResults: 30,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 30,
                                          ),
                                        ),
                                      );
                                    }
                                    List<PostsRecord>
                                        eventsListPostsRecordList =
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: List.generate(
                                            eventsListPostsRecordList.length,
                                            (eventsListIndex) {
                                          final eventsListPostsRecord =
                                              eventsListPostsRecordList[
                                                  eventsListIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 8),
                                            child: StreamBuilder<PostsRecord>(
                                              stream: PostsRecord.getDocument(
                                                  eventsListPostsRecord
                                                      .reference),
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
                                                final eventCardPostsRecord =
                                                    snapshot.data!;
                                                return InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'EXPLORE_PAGE_eventCard_ON_TAP');
                                                    logFirebaseEvent(
                                                        'eventCard_Navigate-To');

                                                    context.pushNamed(
                                                      'nearbyVideoPage',
                                                      queryParams: {
                                                        'post': serializeParam(
                                                            eventsListPostsRecord,
                                                            ParamType.Document),
                                                        'initialStoryIndex':
                                                            serializeParam(
                                                                eventsListIndex,
                                                                ParamType.int),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'post':
                                                            eventsListPostsRecord,
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 95.63,
                                                    height: 170,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryDark,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 3,
                                                          color:
                                                              Color(0x64000000),
                                                          offset: Offset(0, 2),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        FlutterFlowMediaDisplay(
                                                          path: valueOrDefault<
                                                              String>(
                                                            eventsListPostsRecord
                                                                .videoThumbnail,
                                                            'https://st3.depositphotos.com/28733360/36872/i/450/depositphotos_368728138-stock-photo-abstract-grunge-dark-orange-gradient.jpg',
                                                          ),
                                                          imageBuilder:
                                                              (path) =>
                                                                  ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: path,
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          videoPlayerBuilder:
                                                              (path) =>
                                                                  FlutterFlowVideoPlayer(
                                                            path: path,
                                                            width: 300,
                                                            autoPlay: false,
                                                            looping: true,
                                                            showControls: false,
                                                            allowFullScreen:
                                                                false,
                                                            allowPlaybackSpeedMenu:
                                                                false,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10,
                                                                      130,
                                                                      0,
                                                                      0),
                                                          child: Container(
                                                            width: 30,
                                                            height: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEEEEEE),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
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
                                                                  locale:
                                                                      'en_US',
                                                                ),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    fontSize:
                                                                        22,
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
