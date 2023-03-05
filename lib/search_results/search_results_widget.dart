import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delivery_sheet_widget.dart';
import '/components/no_results_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'search_results_model.dart';
export 'search_results_model.dart';

class SearchResultsWidget extends StatefulWidget {
  const SearchResultsWidget({Key? key}) : super(key: key);

  @override
  _SearchResultsWidgetState createState() => _SearchResultsWidgetState();
}

class _SearchResultsWidgetState extends State<SearchResultsWidget> {
  late SearchResultsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchResultsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'searchResults'});
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

    return StreamBuilder<List<RestaurantsRecord>>(
      stream: queryRestaurantsRecord(),
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
        List<RestaurantsRecord> searchResultsRestaurantsRecordList =
            snapshot.data!;
        return Title(
            title: 'searchResults',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'SEARCH_RESULTS_arrow_back_rounded_ICN_ON');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.pop();
                  },
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    '53jg3g2n' /* Search */,
                  ),
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 4.0,
              ),
              body: SafeArea(
                child: GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_unfocusNode),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: 88.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
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
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: TextFormField(
                                                      controller:
                                                          _model.textController,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController',
                                                        Duration(
                                                            milliseconds: 200),
                                                        () async {
                                                          logFirebaseEvent(
                                                              'SEARCH_RESULTS_TextField_xrpt8ipo_ON_TEX');
                                                          logFirebaseEvent(
                                                              'TextField_algolia_search');
                                                          setState(() => _model
                                                                  .algoliaSearchResults =
                                                              null);
                                                          await RestaurantsRecord
                                                                  .search(
                                                            term: _model
                                                                .textController
                                                                .text,
                                                          )
                                                              .then((r) => _model
                                                                      .algoliaSearchResults =
                                                                  r)
                                                              .onError((_,
                                                                      __) =>
                                                                  _model.algoliaSearchResults =
                                                                      [])
                                                              .whenComplete(() =>
                                                                  setState(
                                                                      () {}));
                                                        },
                                                      ),
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'l3d990cn' /* Search for restaurants... */,
                                                        ),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        suffixIcon: _model
                                                                .textController!
                                                                .text
                                                                .isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .textController
                                                                      ?.clear();
                                                                  logFirebaseEvent(
                                                                      'SEARCH_RESULTS_TextField_xrpt8ipo_ON_TEX');
                                                                  logFirebaseEvent(
                                                                      'TextField_algolia_search');
                                                                  setState(() =>
                                                                      _model.algoliaSearchResults =
                                                                          null);
                                                                  await RestaurantsRecord
                                                                          .search(
                                                                    term: _model
                                                                        .textController
                                                                        .text,
                                                                  )
                                                                      .then((r) =>
                                                                          _model.algoliaSearchResults =
                                                                              r)
                                                                      .onError((_,
                                                                              __) =>
                                                                          _model.algoliaSearchResults =
                                                                              [])
                                                                      .whenComplete(() =>
                                                                          setState(
                                                                              () {}));

                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: Color(
                                                                      0xFF2F2F2F),
                                                                  size: 15.0,
                                                                ),
                                                              )
                                                            : null,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF95A1AC),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      validator: _model
                                                          .textControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    if (_model.algoliaSearchResults == null) {
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
                                    final results =
                                        _model.algoliaSearchResults?.toList() ??
                                            [];
                                    if (results.isEmpty) {
                                      return NoResultsWidget();
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: results.length,
                                      itemBuilder: (context, resultsIndex) {
                                        final resultsItem =
                                            results[resultsIndex];
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
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
                                                                resultsItem
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
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
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
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'SEARCH_RESULTS_Container_rusuvsig_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Container_backend_call');

                                                                        final restaurantsUpdateData =
                                                                            {
                                                                          'cardClicks':
                                                                              FieldValue.increment(1),
                                                                        };
                                                                        await storeListViewRestaurantsRecord
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
                                                                              storeListViewRestaurantsRecord.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            1.0,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.9,
                                                                          height:
                                                                              120.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                color: FlutterFlowTheme.of(context).primaryDark,
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
                                                                                              logFirebaseEvent('SEARCH_RESULTS_Image_6gv4cru8_ON_TAP');
                                                                                              logFirebaseEvent('Image_expand_image');
                                                                                              await Navigator.push(
                                                                                                context,
                                                                                                PageTransition(
                                                                                                  type: PageTransitionType.fade,
                                                                                                  child: FlutterFlowExpandedImageView(
                                                                                                    image: CachedNetworkImage(
                                                                                                      imageUrl: valueOrDefault<String>(
                                                                                                        resultsItem.featuredImage,
                                                                                                        'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                                                                                      ),
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                    allowRotation: false,
                                                                                                    tag: valueOrDefault<String>(
                                                                                                      resultsItem.featuredImage,
                                                                                                      'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg' + '$resultsIndex',
                                                                                                    ),
                                                                                                    useHeroAnimation: true,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                            child: Hero(
                                                                                              tag: valueOrDefault<String>(
                                                                                                resultsItem.featuredImage,
                                                                                                'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg' + '$resultsIndex',
                                                                                              ),
                                                                                              transitionOnUserGestures: true,
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                child: CachedNetworkImage(
                                                                                                  imageUrl: valueOrDefault<String>(
                                                                                                    resultsItem.featuredImage,
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
                                                                                      child: Material(
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
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test3-r71why/assets/ikoxy9icoqvd/icon%20google%20play.png' + '$resultsIndex',
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
                                                                                                      return Color(0x00000000);
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
                                                                                              valueOrDefault<String>(
                                                                                                resultsItem.restaurantName,
                                                                                                '--',
                                                                                              ).maybeHandleOverflow(
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
                                                                                              valueOrDefault<String>(
                                                                                                resultsItem.restAddress,
                                                                                                '--',
                                                                                              ).maybeHandleOverflow(
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
                                                                                                resultsItem.categories,
                                                                                                '--',
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
                                                                                                resultsItem.priceRange,
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
                                                                                                  '${valueOrDefault<String>(
                                                                                                    resultsItem.reviews?.toString(),
                                                                                                    '0',
                                                                                                  )}  reviews',
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
                                                                                                '${valueOrDefault<String>(
                                                                                                  functions.getDistance(currentUserLocationValue, storeListViewRestaurantsRecord.restLatLong),
                                                                                                  '0,0',
                                                                                                )} miles away',
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
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                child: FlutterFlowIconButton(
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
                                                                                    logFirebaseEvent('SEARCH_RESULTS_PAGE_phone_ICN_ON_TAP');
                                                                                    logFirebaseEvent('IconButton_launch_u_r_l');
                                                                                    await launchURL('tel:${resultsItem.phoneNumber}');
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                child: FlutterFlowIconButton(
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
                                                                                    logFirebaseEvent('SEARCH_RESULTS_mapMarkedAlt_ICN_ON_TAP');
                                                                                    logFirebaseEvent('IconButton_launch_u_r_l');
                                                                                    await launchURL(functions.getMapUrl(resultsItem.restLatLong));
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                child: FlutterFlowIconButton(
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
                                                                                    logFirebaseEvent('SEARCH_RESULTS_PAGE_globe_ICN_ON_TAP');
                                                                                    logFirebaseEvent('IconButton_launch_u_r_l');
                                                                                    await launchURL('https://${resultsItem.website}');
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        if (storeListViewRestaurantsRecord.isSubscribed ??
                                                                            true)
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: FlutterFlowIconButton(
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
                                                                                      logFirebaseEvent('SEARCH_RESULTS_fastfood_rounded_ICN_ON_T');
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
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          10.0),
                                                                      child: StreamBuilder<
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
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
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
                                                                                      logFirebaseEvent('SEARCH_RESULTS_Image_blo59t1g_ON_TAP');
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
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                  ),
                ),
              ),
            ));
      },
    );
  }
}
