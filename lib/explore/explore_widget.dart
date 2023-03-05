import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/deal_popup_widget.dart';
import '/components/delivery_sheet_widget.dart';
import '/components/empty_reviews_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'explore_model.dart';
export 'explore_model.dart';

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
  late ExploreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 960.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 960.ms,
          begin: 0.9,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
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
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 690.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
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
          begin: Offset(60.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
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
    'containerOnPageLoadAnimation4': AnimationInfo(
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
    _model = createModel(context, () => ExploreModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'explore'});
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

    return AuthUserStreamWidget(
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
          final exploreAddNumberRecord = snapshot.data!;
          return Title(
              title: 'explore',
              color: FlutterFlowTheme.of(context).primaryColor,
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    print('FloatingActionButton pressed ...');
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                  elevation: 8.0,
                  child: FaIcon(
                    FontAwesomeIcons.mapMarked,
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    size: 24.0,
                  ),
                ),
                appBar: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'rbd97x1i' /* Explore */,
                    ),
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22.0,
                        ),
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 4.0,
                ),
                body: GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_unfocusNode),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 1.0,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: Container(
                                height: 90.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 3.0, 0.0, 0.0),
                                  child: PagedListView<
                                      DocumentSnapshot<Object?>?,
                                      StoriesRecord>(
                                    pagingController: () {
                                      final Query<Object?> Function(
                                              Query<Object?>) queryBuilder =
                                          (storiesRecord) => storiesRecord
                                              .orderBy('created_time',
                                                  descending: true);
                                      if (_model.pagingController != null) {
                                        final query = queryBuilder(
                                            StoriesRecord.collection);
                                        if (query != _model.pagingQuery) {
                                          // The query has changed
                                          _model.pagingQuery = query;
                                          _model.streamSubscriptions
                                              .forEach((s) => s?.cancel());
                                          _model.streamSubscriptions.clear();
                                          _model.pagingController!.refresh();
                                        }
                                        return _model.pagingController!;
                                      }

                                      _model.pagingController =
                                          PagingController(firstPageKey: null);
                                      _model.pagingQuery = queryBuilder(
                                          StoriesRecord.collection);
                                      _model.pagingController!
                                          .addPageRequestListener(
                                              (nextPageMarker) {
                                        queryStoriesRecordPage(
                                          queryBuilder: (storiesRecord) =>
                                              storiesRecord.orderBy(
                                                  'created_time',
                                                  descending: true),
                                          nextPageMarker: nextPageMarker,
                                          pageSize: 4,
                                          isStream: true,
                                        ).then((page) {
                                          _model.pagingController!.appendPage(
                                            page.data,
                                            page.nextPageMarker,
                                          );
                                          final streamSubscription =
                                              page.dataStream?.listen((data) {
                                            data.forEach((item) {
                                              final itemIndexes = _model
                                                  .pagingController!.itemList!
                                                  .asMap()
                                                  .map((k, v) => MapEntry(
                                                      v.reference.id, k));
                                              final index = itemIndexes[
                                                  item.reference.id];
                                              final items = _model
                                                  .pagingController!.itemList!;
                                              if (index != null) {
                                                items.replaceRange(
                                                    index, index + 1, [item]);
                                                _model.pagingController!
                                                    .itemList = {
                                                  for (var item in items)
                                                    item.reference: item
                                                }.values.toList();
                                              }
                                            });
                                            setState(() {});
                                          });
                                          _model.streamSubscriptions
                                              .add(streamSubscription);
                                        });
                                      });
                                      return _model.pagingController!;
                                    }(),
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    builderDelegate: PagedChildBuilderDelegate<
                                        StoriesRecord>(
                                      // Customize what your widget looks like when it's loading the first page.
                                      firstPageProgressIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width: 30.0,
                                          height: 30.0,
                                          child: SpinKitThreeBounce(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 30.0,
                                          ),
                                        ),
                                      ),
                                      noItemsFoundIndicatorBuilder: (_) =>
                                          Center(
                                        child: Image.asset(
                                          'assets/images/no_stories.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                        ),
                                      ),
                                      itemBuilder: (context, _, listViewIndex) {
                                        final listViewStoriesRecord = _model
                                            .pagingController!
                                            .itemList![listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child:
                                              StreamBuilder<RestaurantsRecord>(
                                            stream:
                                                RestaurantsRecord.getDocument(
                                                    listViewStoriesRecord
                                                        .restRef!),
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
                                              final columnRestaurantsRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'EXPLORE_PAGE_Column_1mfwp4p9_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Column_navigate_to');

                                                  context.pushNamed(
                                                    'storyDetails',
                                                    queryParams: {
                                                      'initialStoryIndex':
                                                          serializeParam(
                                                        listViewIndex,
                                                        ParamType.int,
                                                      ),
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
                                                      'Column_backend_call');

                                                  final restaurantsUpdateData =
                                                      {
                                                    'storyClicks':
                                                        FieldValue.increment(1),
                                                  };
                                                  await columnRestaurantsRecord
                                                      .reference
                                                      .update(
                                                          restaurantsUpdateData);
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            width: 70.0,
                                                            height: 70.0,
                                                            decoration:
                                                                BoxDecoration(
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
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 60.0,
                                                          height: 60.0,
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
                                                                valueOrDefault<
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
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12.0,
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
                                  ).animateOnPageLoad(animationsMap[
                                      'listViewOnPageLoadAnimation']!),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: 80.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.95,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EXPLORE_PAGE_Row_a71idz3c_ON_TAP');
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context
                                                  .pushNamed('searchResults');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 4.0, 0.0),
                                                  child: Icon(
                                                    Icons.search_rounded,
                                                    color: Color(0xFF95A1AC),
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'xxvno4qr' /* Search for restaurants... */,
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
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: MediaQuery.of(context).size.height * 0.62,
                              decoration: BoxDecoration(),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: FlutterFlowChoiceChips(
                                              initiallySelected: [
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'd3ssey2a' /* American */,
                                                )
                                              ],
                                              options: [
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'j65kdlwh' /* American */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'qa7gthbw' /* Mexican */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'b5o4m8y2' /* Asian */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'dximdfj3' /* Italian */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '5wjgqr9n' /* Jamaican */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'qtr5p0ok' /* Indian */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'wa1pkysa' /* Greek */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'emodptq1' /* Japanese */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'q6ck8y7k' /* Pizza */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '87sbiwtz' /* Burger */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '84puncok' /* Barbeque */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'xqjhvxth' /* Breakfast */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'ojllc3c6' /* Thai */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0rotqp72' /* Canadian */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '10twe1q0' /* French */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '7j89pi0d' /* Middle Eastern */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '2jfa89f4' /* Latin */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'a3d7qq0v' /* Noodle */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'gl7xpcmz' /* Seafood */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'b4p2cp8y' /* Street Food */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'ffeoj8fl' /* Vegetarian */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'm7q27ipq' /* Soul Food */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'fl95jtxy' /* Kebab */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'lwnsccdk' /* Brunch */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'by7a5dcu' /* German */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '8qznyg9i' /* African */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0u9ok5qe' /* Cajun */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'dgiwa4li' /* Irish */,
                                                ))
                                              ],
                                              onChanged: (val) => setState(() =>
                                                  _model.cuisineChoiceChipsValue =
                                                      val?.first),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: Colors.white,
                                                        ),
                                                iconColor: Colors.white,
                                                iconSize: 18.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            5.0, 0.0, 5.0, 0.0),
                                                elevation: 2.0,
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                iconColor: Color(0xFF262D34),
                                                iconSize: 18.0,
                                                elevation: 4.0,
                                              ),
                                              chipSpacing: 10.0,
                                              multiselect: false,
                                              initialized: _model
                                                      .cuisineChoiceChipsValue !=
                                                  null,
                                              alignment: WrapAlignment.start,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 10.0, 16.0, 0.0),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EXPLORE_PAGE_Row_uhmul165_ON_TAP');
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context.pushNamed(
                                                  'nearbyRestaurants');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '615djvxq' /* more */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.arrow_right_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: FutureBuilder<
                                          List<RestaurantsRecord>>(
                                        future: RestaurantsRecord.search(
                                          term: _model.cuisineChoiceChipsValue,
                                          location: getCurrentUserLocation(
                                              defaultLocation: LatLng(
                                                  37.4298229, -122.1735655)),
                                          searchRadiusMeters: 8000.0,
                                        ),
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
                                                  rowRestaurantsRecordList
                                                      .length, (rowIndex) {
                                                final rowRestaurantsRecord =
                                                    rowRestaurantsRecordList[
                                                        rowIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: 340.0,
                                                    height: 300.0,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  10.0,
                                                                  0.0),
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
                                                          final storeListViewRestaurantsRecord =
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
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child:
                                                                    Container(
                                                                  width: 340.0,
                                                                  height: 290.0,
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
                                                                            0x33000000),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
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
                                                                              'Container_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'restaurantDetails',
                                                                            queryParams:
                                                                                {
                                                                              'restaurant': serializeParam(
                                                                                storeListViewRestaurantsRecord.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 1.0,
                                                                          height:
                                                                              120.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 3.0,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(0.0, 1.0),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
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
                                                                                              logFirebaseEvent('EXPLORE_PAGE_Image_9mijcnlr_ON_TAP');
                                                                                              logFirebaseEvent('Image_navigate_to');

                                                                                              context.pushNamed(
                                                                                                'restaurantDetails',
                                                                                                queryParams: {
                                                                                                  'restaurant': serializeParam(
                                                                                                    storeListViewRestaurantsRecord.reference,
                                                                                                    ParamType.DocumentReference,
                                                                                                  ),
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
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                child: CachedNetworkImage(
                                                                                                  imageUrl: valueOrDefault<String>(
                                                                                                    storeListViewRestaurantsRecord.featuredImage,
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
                                                                                        stream: RestaurantsRecord.getDocument(storeListViewRestaurantsRecord.reference),
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
                                                                                              child: Hero(
                                                                                                tag: valueOrDefault<String>(
                                                                                                  storeListViewRestaurantsRecord.logo,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test3-r71why/assets/ikoxy9icoqvd/icon%20google%20play.png' + '$rowIndex',
                                                                                                ),
                                                                                                transitionOnUserGestures: true,
                                                                                                child: Container(
                                                                                                  width: 120.0,
                                                                                                  height: 120.0,
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
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 55.0, 0.0, 0.0),
                                                                                      child: StreamBuilder<List<PostsRecord>>(
                                                                                        stream: queryPostsRecord(
                                                                                          queryBuilder: (postsRecord) => postsRecord.where('rest_ref', isEqualTo: storeListViewRestaurantsRecord.reference),
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
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
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
                                                                                              storeListViewRestaurantsRecord.restaurantName!.maybeHandleOverflow(
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
                                                                                              storeListViewRestaurantsRecord.restAddress!.maybeHandleOverflow(
                                                                                                maxChars: 20,
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
                                                                                                storeListViewRestaurantsRecord.categories,
                                                                                                '-',
                                                                                              ).maybeHandleOverflow(
                                                                                                maxChars: 16,
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
                                                                                                storeListViewRestaurantsRecord.priceRange,
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
                                                                                                  '${storeListViewRestaurantsRecord.reviews?.toString()} reviews',
                                                                                                  '0 reviews',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
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
                                                                                                '${functions.getDistance(currentUserLocationValue, storeListViewRestaurantsRecord.restLatLong)} miles away',
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
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                  logFirebaseEvent('EXPLORE_PAGE_phone_ICN_ON_TAP');
                                                                                  logFirebaseEvent('IconButton_backend_call');

                                                                                  final restaurantsUpdateData = {
                                                                                    'phoneClicks': FieldValue.increment(1),
                                                                                  };
                                                                                  await storeListViewRestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                  logFirebaseEvent('IconButton_launch_u_r_l');
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
                                                                                  logFirebaseEvent('EXPLORE_PAGE_mapMarkedAlt_ICN_ON_TAP');
                                                                                  logFirebaseEvent('IconButton_backend_call');

                                                                                  final restaurantsUpdateData = {
                                                                                    'mapClicks': FieldValue.increment(1),
                                                                                  };
                                                                                  await storeListViewRestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                  logFirebaseEvent('IconButton_launch_u_r_l');
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
                                                                                  logFirebaseEvent('EXPLORE_PAGE_globe_ICN_ON_TAP');
                                                                                  logFirebaseEvent('IconButton_backend_call');

                                                                                  final restaurantsUpdateData = {
                                                                                    'websiteClicks': FieldValue.increment(1),
                                                                                  };
                                                                                  await storeListViewRestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                  logFirebaseEvent('IconButton_launch_u_r_l');
                                                                                  await launchURL(storeListViewRestaurantsRecord.website!);
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          if (storeListViewRestaurantsRecord.isSubscribed ??
                                                                              true)
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
                                                                                    logFirebaseEvent('EXPLORE_PAGE_fastfood_rounded_ICN_ON_TAP');
                                                                                    logFirebaseEvent('IconButton_backend_call');

                                                                                    final restaurantsUpdateData = {
                                                                                      'orderNowClicks': FieldValue.increment(1),
                                                                                    };
                                                                                    await storeListViewRestaurantsRecord.reference.update(restaurantsUpdateData);
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
                                                                              isEqualTo: storeListViewRestaurantsRecord.reference),
                                                                          limit:
                                                                              5,
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
                                                                          List<PostsRecord>
                                                                              rowPostsRecordList =
                                                                              snapshot.data!;
                                                                          if (rowPostsRecordList
                                                                              .isEmpty) {
                                                                            return EmptyReviewsWidget(
                                                                              restaurant: storeListViewRestaurantsRecord,
                                                                            );
                                                                          }
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(rowPostsRecordList.length, (rowIndex) {
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
                                                                                      logFirebaseEvent('EXPLORE_PAGE_Image_22dfg9lh_ON_TAP');
                                                                                      logFirebaseEvent('Image_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'restaurantReviewsList',
                                                                                        queryParams: {
                                                                                          'initialStoryIndex': serializeParam(
                                                                                            rowIndex,
                                                                                            ParamType.int,
                                                                                          ),
                                                                                          'restaurant': serializeParam(
                                                                                            storeListViewRestaurantsRecord,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'restaurant': storeListViewRestaurantsRecord,
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: CachedNetworkImage(
                                                                                        imageUrl: valueOrDefault<String>(
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
                                                                          ).animateOnPageLoad(
                                                                              animationsMap['rowOnPageLoadAnimation']!);
                                                                        },
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
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation1']!),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 0.0),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EXPLORE_PAGE_Row_gl8d6712_ON_TAP');
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context
                                                  .pushNamed('curatedListPage');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '3mijylyc' /* more */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.arrow_right_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 24.0,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1.0,
                                            height: 210.0,
                                            decoration: BoxDecoration(),
                                            child: Container(
                                              width: double.infinity,
                                              height: 210.0,
                                              decoration: BoxDecoration(),
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
                                                  List<CuratedListsRecord>
                                                      listViewCuratedListsRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        listViewCuratedListsRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewCuratedListsRecord =
                                                          listViewCuratedListsRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    8.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'EXPLORE_PAGE_Container_ogu0kkqe_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Container_navigate_to');

                                                            context.pushNamed(
                                                              'curatedListSwipe',
                                                              queryParams: {
                                                                'curatedList':
                                                                    serializeParam(
                                                                  listViewCuratedListsRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'curatedList':
                                                                    listViewCuratedListsRecord,
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 270.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      3.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          1.0),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            12.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            12.0),
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
                                                                    height:
                                                                        110.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          12.0),
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
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            listViewCuratedListsRecord.title!,
                                                                            style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 18.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    '${listViewCuratedListsRecord.followers!.toList().length.toString()} Following',
                                                                                    '0 Following',
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                        fontFamily: 'Lexend Deca',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            32.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              listViewCuratedListsRecord.range,
                                                                              '\$\$ - \$\$\$\$',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: Color(0xFF05D35F),
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.normal,
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
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation2']!),
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
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'lq72ftp7' /* Deals */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 20.0,
                                                ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EXPLORE_PAGE_Row_yvau1lv8_ON_TAP');
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context.pushNamed('dealPage');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ku24yuwk' /* more */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.arrow_right_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    StreamBuilder<List<DealsRecord>>(
                                      stream: queryDealsRecord(
                                        queryBuilder: (dealsRecord) =>
                                            dealsRecord
                                                .where('active',
                                                    isEqualTo: true)
                                                .where('promoted',
                                                    isEqualTo: true)
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 30.0,
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
                                                    .contains(rowDealsRecord
                                                        .reference),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 20.0),
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    12.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'EXPLORE_PAGE_Container_w8rbwezc_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Container_bottom_sheet');
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
                                                                    height:
                                                                        800.0,
                                                                    child:
                                                                        DealPopupWidget(
                                                                      deal:
                                                                          rowDealsRecord,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child: Container(
                                                            width: 350.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      3.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          1.0),
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
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          4.0,
                                                                          4.0),
                                                                  child:
                                                                      Container(
                                                                    width: 4.0,
                                                                    height:
                                                                        90.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 200.0,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            16.0,
                                                                            12.0),
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
                                                                          rowDealsRecord
                                                                              .title!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .title2
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 22.0,
                                                                                fontWeight: FontWeight.w800,
                                                                              ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            rowDealsRecord.details!.maybeHandleOverflow(
                                                                              maxChars: 21,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Until ${dateTimeFormat(
                                                                              'MMMEd',
                                                                              rowDealsRecord.expiry,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          5.0,
                                                                      height:
                                                                          10.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          5.0,
                                                                      height:
                                                                          10.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          5.0,
                                                                      height:
                                                                          10.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          5.0,
                                                                      height:
                                                                          10.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          5.0,
                                                                      height:
                                                                          10.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          5.0,
                                                                      height:
                                                                          10.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    350.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 3.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                offset: Offset(
                                                                    0.0, 1.0),
                                                              )
                                                            ],
                                                            shape:
                                                                BoxShape.circle,
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
                                                                      170.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              RestaurantsRecord>(
                                                            stream: RestaurantsRecord
                                                                .getDocument(
                                                                    rowDealsRecord
                                                                        .restRef!),
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
                                                              final circleImageRestaurantsRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                width: 60.0,
                                                                height: 60.0,
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
                                                                      circleImageRestaurantsRecord
                                                                          .logo!,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      if (rowDealsRecord
                                                          .userSaved!
                                                          .toList()
                                                          .contains(
                                                              currentUserReference))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      250.0,
                                                                      0.0,
                                                                      0.0,
                                                                      55.0),
                                                          child: Icon(
                                                            Icons
                                                                .favorite_rounded,
                                                            color: Color(
                                                                0xFFB20000),
                                                            size: 24.0,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'vnva9ir6' /* Popular */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 20.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    StreamBuilder<List<RestaurantsRecord>>(
                                      stream: queryRestaurantsRecord(
                                        queryBuilder: (restaurantsRecord) =>
                                            restaurantsRecord
                                                .where('cardClicks',
                                                    isGreaterThan: 5)
                                                .orderBy('cardClicks',
                                                    descending: true),
                                        limit: 15,
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 30.0,
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
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  width: 340.0,
                                                  height: 300.0,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                10.0, 0.0),
                                                    child: StreamBuilder<
                                                        RestaurantsRecord>(
                                                      stream: RestaurantsRecord
                                                          .getDocument(
                                                              rowRestaurantsRecord
                                                                  .reference),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          1.0),
                                                              child: Container(
                                                                width: 340.0,
                                                                height: 300.0,
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
                                                                          0x33000000),
                                                                      offset: Offset(
                                                                          0.0,
                                                                          1.0),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
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
                                                                            'Container_backend_call');

                                                                        final restaurantsUpdateData =
                                                                            {
                                                                          'cardClicks':
                                                                              FieldValue.increment(1),
                                                                        };
                                                                        await storeListView2RestaurantsRecord
                                                                            .reference
                                                                            .update(restaurantsUpdateData);
                                                                        logFirebaseEvent(
                                                                            'Container_navigate_to');

                                                                        context
                                                                            .pushNamed(
                                                                          'restaurantDetails',
                                                                          queryParams:
                                                                              {
                                                                            'restaurant':
                                                                                serializeParam(
                                                                              storeListView2RestaurantsRecord.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            1.0,
                                                                        height:
                                                                            120.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 3.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(0.0, 1.0),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
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
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 8.0, 8.0),
                                                                                        child: InkWell(
                                                                                          onTap: () async {
                                                                                            logFirebaseEvent('EXPLORE_PAGE_Image_otn2i6rb_ON_TAP');
                                                                                            logFirebaseEvent('Image_expand_image');
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
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: CachedNetworkImage(
                                                                                                imageUrl: valueOrDefault<String>(
                                                                                                  storeListView2RestaurantsRecord.featuredImage,
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
                                                                                      stream: RestaurantsRecord.getDocument(storeListView2RestaurantsRecord.reference),
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 55.0, 0.0, 0.0),
                                                                                    child: StreamBuilder<List<PostsRecord>>(
                                                                                      stream: queryPostsRecord(
                                                                                        queryBuilder: (postsRecord) => postsRecord.where('rest_ref', isEqualTo: storeListView2RestaurantsRecord.reference),
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
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
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
                                                                                            storeListView2RestaurantsRecord.restaurantName!.maybeHandleOverflow(
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
                                                                                            storeListView2RestaurantsRecord.restAddress!.maybeHandleOverflow(
                                                                                              maxChars: 20,
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
                                                                                              storeListView2RestaurantsRecord.categories,
                                                                                              '-',
                                                                                            ).maybeHandleOverflow(
                                                                                              maxChars: 16,
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
                                                                                              storeListView2RestaurantsRecord.priceRange,
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
                                                                                                  storeListView2RestaurantsRecord.reviews,
                                                                                                  formatType: FormatType.compact,
                                                                                                )} reviews',
                                                                                                '0 reviews',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
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
                                                                                              '${functions.getDistance(currentUserLocationValue, storeListView2RestaurantsRecord.restLatLong)} miles away',
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
                                                                                logFirebaseEvent('EXPLORE_PAGE_phone_ICN_ON_TAP');
                                                                                logFirebaseEvent('IconButton_backend_call');

                                                                                final restaurantsUpdateData = {
                                                                                  'phoneClicks': FieldValue.increment(1),
                                                                                };
                                                                                await storeListView2RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                logFirebaseEvent('IconButton_launch_u_r_l');
                                                                                await launchURL('tel:${storeListView2RestaurantsRecord.phoneNumber}');
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
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
                                                                                logFirebaseEvent('EXPLORE_PAGE_mapMarkedAlt_ICN_ON_TAP');
                                                                                logFirebaseEvent('IconButton_backend_call');

                                                                                final restaurantsUpdateData = {
                                                                                  'mapClicks': FieldValue.increment(1),
                                                                                };
                                                                                await storeListView2RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                logFirebaseEvent('IconButton_launch_u_r_l');
                                                                                await launchURL(functions.getMapUrl(storeListView2RestaurantsRecord.restLatLong));
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
                                                                                logFirebaseEvent('EXPLORE_PAGE_globe_ICN_ON_TAP');
                                                                                logFirebaseEvent('IconButton_backend_call');

                                                                                final restaurantsUpdateData = {
                                                                                  'websiteClicks': FieldValue.increment(1),
                                                                                };
                                                                                await storeListView2RestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                logFirebaseEvent('IconButton_launch_u_r_l');
                                                                                await launchURL(storeListView2RestaurantsRecord.website!);
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        if (storeListView2RestaurantsRecord.isSubscribed ??
                                                                            true)
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                  logFirebaseEvent('EXPLORE_PAGE_fastfood_rounded_ICN_ON_TAP');
                                                                                  logFirebaseEvent('IconButton_backend_call');

                                                                                  final restaurantsUpdateData = {
                                                                                    'orderNowClicks': FieldValue.increment(1),
                                                                                  };
                                                                                  await storeListView2RestaurantsRecord.reference.update(restaurantsUpdateData);
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
                                                                        limit:
                                                                            5,
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
                                                                              width: 30.0,
                                                                              height: 30.0,
                                                                              child: SpinKitThreeBounce(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 30.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<PostsRecord>
                                                                            rowPostsRecordList =
                                                                            snapshot.data!;
                                                                        if (rowPostsRecordList
                                                                            .isEmpty) {
                                                                          return EmptyReviewsWidget(
                                                                            restaurant:
                                                                                storeListView2RestaurantsRecord,
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
                                                                                    logFirebaseEvent('EXPLORE_PAGE_Image_ah9aaydg_ON_TAP');
                                                                                    logFirebaseEvent('Image_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'restaurantReviewsList',
                                                                                      queryParams: {
                                                                                        'initialStoryIndex': serializeParam(
                                                                                          rowIndex,
                                                                                          ParamType.int,
                                                                                        ),
                                                                                        'restaurant': serializeParam(
                                                                                          storeListView2RestaurantsRecord,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'restaurant': storeListView2RestaurantsRecord,
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: CachedNetworkImage(
                                                                                      imageUrl: valueOrDefault<String>(
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation3']!),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 10.0, 16.0, 0.0),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 20.0,
                                                ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EXPLORE_PAGE_Row_82yynop9_ON_TAP');
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context.pushNamed('searchUsers');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '86crvntw' /* more */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.arrow_right_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 10.0, 16.0, 0.0),
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
                                                  List<UsersRecord>
                                                      rowUsersRecordList =
                                                      snapshot.data!
                                                          .where((u) =>
                                                              u.uid !=
                                                              currentUserUid)
                                                          .toList();
                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: List.generate(
                                                          rowUsersRecordList
                                                              .length,
                                                          (rowIndex) {
                                                        final rowUsersRecord =
                                                            rowUsersRecordList[
                                                                rowIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      12.0,
                                                                      12.0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'EXPLORE_PAGE_Container_8pgobz31_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Container_navigate_to');

                                                              context.pushNamed(
                                                                'viewProfileOther',
                                                                queryParams: {
                                                                  'otherUser':
                                                                      serializeParam(
                                                                    rowUsersRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 160.0,
                                                              height: 136.0,
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
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            1.0),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        12.0,
                                                                        12.0,
                                                                        12.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        imageUrl:
                                                                            valueOrDefault<String>(
                                                                          rowUsersRecord
                                                                              .photoUrl,
                                                                          'https://p1.pxfuel.com/preview/828/149/229/indistinct-blurred-pineapple-rough.jpg',
                                                                        ),
                                                                        width:
                                                                            60.0,
                                                                        height:
                                                                            60.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          35.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            8.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            rowUsersRecord.username,
                                                                            '--',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .subtitle1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          '${rowUsersRecord.reviews?.toString()} reviews',
                                                                          '0 reviews',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: Color(0xFF57636C),
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.normal,
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
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'q0wenwtb' /* Recommended */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 20.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: StreamBuilder<
                                          List<RestaurantsRecord>>(
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
                                                  rowRestaurantsRecordList
                                                      .length, (rowIndex) {
                                                final rowRestaurantsRecord =
                                                    rowRestaurantsRecordList[
                                                        rowIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: StreamBuilder<
                                                      AddNumberRecord>(
                                                    stream: AddNumberRecord
                                                        .getDocument(
                                                            exploreAddNumberRecord
                                                                .reference),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      final containerAddNumberRecord =
                                                          snapshot.data!;
                                                      return Container(
                                                        width: 340.0,
                                                        height: 300.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      2.0,
                                                                      0.0,
                                                                      0.0),
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
                                                              final storeListView3RestaurantsRecord =
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          340.0,
                                                                      height:
                                                                          360.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                3.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(0.0, 1.0),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                logFirebaseEvent('EXPLORE_PAGE_Container_8vpuek94_ON_TAP');
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
                                                                              child: Container(
                                                                                width: MediaQuery.of(context).size.width * 1.0,
                                                                                height: 120.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 3.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(0.0, 1.0),
                                                                                    )
                                                                                  ],
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
                                                                                                    logFirebaseEvent('EXPLORE_PAGE_Image_v4uhdfpd_ON_TAP');
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
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
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
                                                                                                      maxChars: 20,
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
                                                                                                      maxChars: 16,
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
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
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
                                                                                        logFirebaseEvent('EXPLORE_PAGE_phone_ICN_ON_TAP');
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
                                                                                        logFirebaseEvent('EXPLORE_PAGE_mapMarkedAlt_ICN_ON_TAP');
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
                                                                                        logFirebaseEvent('EXPLORE_PAGE_globe_ICN_ON_TAP');
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
                                                                                          logFirebaseEvent('EXPLORE_PAGE_fastfood_rounded_ICN_ON_TAP');
                                                                                          logFirebaseEvent('IconButton_backend_call');

                                                                                          final restaurantsUpdateData = {
                                                                                            'orderNowClicks': FieldValue.increment(1),
                                                                                          };
                                                                                          await storeListView3RestaurantsRecord.reference.update(restaurantsUpdateData);
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
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                                                              logFirebaseEvent('EXPLORE_PAGE_Image_0fwdvpnx_ON_TAP');
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
                                                                                              child: CachedNetworkImage(
                                                                                                imageUrl: valueOrDefault<String>(
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
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation4']!);
                                                    },
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 0.0),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EXPLORE_PAGE_Text_rz5skmoo_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_navigate_to');

                                              context.pushNamed(
                                                'nearbyVideoPage',
                                                queryParams: {
                                                  'initialStoryIndex':
                                                      serializeParam(
                                                    0,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'fpczrisn' /* see all... */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 110.0),
                                        child: FutureBuilder<List<PostsRecord>>(
                                          future: PostsRecord.search(
                                            location: getCurrentUserLocation(
                                                defaultLocation: LatLng(
                                                    37.4298229, -122.1735655)),
                                            maxResults: 30,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 30.0,
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
                                                    eventsListPostsRecordList
                                                        .length,
                                                    (eventsListIndex) {
                                                  final eventsListPostsRecord =
                                                      eventsListPostsRecordList[
                                                          eventsListIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                8.0, 8.0),
                                                    child: StreamBuilder<
                                                        PostsRecord>(
                                                      stream: PostsRecord
                                                          .getDocument(
                                                              eventsListPostsRecord
                                                                  .reference),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        final eventCardPostsRecord =
                                                            snapshot.data!;
                                                        return InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'EXPLORE_PAGE_eventCard_ON_TAP');
                                                            logFirebaseEvent(
                                                                'eventCard_navigate_to');

                                                            context.pushNamed(
                                                              'nearbyVideoPage',
                                                              queryParams: {
                                                                'post':
                                                                    serializeParam(
                                                                  eventsListPostsRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                                'initialStoryIndex':
                                                                    serializeParam(
                                                                  eventsListIndex,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'post':
                                                                    eventsListPostsRecord,
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 95.63,
                                                            height: 170.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryDark,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      3.0,
                                                                  color: Color(
                                                                      0x64000000),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          2.0),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
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
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl:
                                                                          path,
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  videoPlayerBuilder:
                                                                      (path) =>
                                                                          FlutterFlowVideoPlayer(
                                                                    path: path,
                                                                    width:
                                                                        300.0,
                                                                    autoPlay:
                                                                        false,
                                                                    looping:
                                                                        true,
                                                                    showControls:
                                                                        false,
                                                                    allowFullScreen:
                                                                        false,
                                                                    allowPlaybackSpeedMenu:
                                                                        false,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          130.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        () {
                                                                          if (eventCardPostsRecord.userRating ==
                                                                              5.0) {
                                                                            return Color(0xFF3FDF86);
                                                                          } else if (eventCardPostsRecord.userRating ==
                                                                              4.0) {
                                                                            return Color(0xFFC3DF3F);
                                                                          } else if (eventCardPostsRecord.userRating ==
                                                                              3.0) {
                                                                            return Color(0xFFDFCB3F);
                                                                          } else if (eventCardPostsRecord.userRating ==
                                                                              2.0) {
                                                                            return Color(0xFFDF993F);
                                                                          } else if (eventCardPostsRecord.userRating ==
                                                                              1.0) {
                                                                            return Color(0xFFDF5A3F);
                                                                          } else {
                                                                            return FlutterFlowTheme.of(context).secondaryBackground;
                                                                          }
                                                                        }(),
                                                                        Color(
                                                                            0x8E95A1AC),
                                                                      ),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        formatNumber(
                                                                          eventCardPostsRecord
                                                                              .userRating,
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          format:
                                                                              '0',
                                                                          locale:
                                                                              'en_US',
                                                                        ),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            fontSize:
                                                                                22.0,
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
                ),
              ));
        },
      ),
    );
  }
}
