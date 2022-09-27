import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:text_search/text_search.dart';

class CuratedListPageWidget extends StatefulWidget {
  const CuratedListPageWidget({Key? key}) : super(key: key);

  @override
  _CuratedListPageWidgetState createState() => _CuratedListPageWidgetState();
}

class _CuratedListPageWidgetState extends State<CuratedListPageWidget>
    with TickerProviderStateMixin {
  List<CuratedListsRecord> simpleSearchResults = [];
  TextEditingController? textController;
  PagingController<DocumentSnapshot?, CuratedListsRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 60),
        scale: 0.95,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 60),
        scale: 0.95,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(30, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(40, 0),
        scale: 1,
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
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 40),
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
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'curatedListPage'});
    textController = TextEditingController();
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryDark,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
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
            logFirebaseEvent('CURATED_LIST_arrow_back_rounded_ICN_ON_T');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'wqa6s6un' /* Discover */,
          ),
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).tertiaryColor,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                height: 500,
                child: Stack(
                  alignment: AlignmentDirectional(0, -1),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.05, -1),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://media.istockphoto.com/photos/its-sweet-like-you-picture-id1295387357?b=1&k=20&m=1295387357&s=170667a&w=0&h=MTE5honI-MjWn6LYKU7aUPdUHQVV5CmyO6O1UHlYitY=',
                        width: double.infinity,
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Color(0x8D090F13),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            '',
                          ).image,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 60, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: textController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'textController',
                                        Duration(milliseconds: 200),
                                        () => setState(() {}),
                                      ),
                                      onFieldSubmitted: (_) async {
                                        logFirebaseEvent(
                                            'CURATED_LIST_TextField_bscx3pxq_ON_TEXTF');
                                        logFirebaseEvent(
                                            'TextField_Simple-Search');
                                        await queryCuratedListsRecordOnce()
                                            .then(
                                              (records) => simpleSearchResults =
                                                  TextSearch(
                                                records
                                                    .map(
                                                      (record) =>
                                                          TextSearchItem(
                                                              record, [
                                                        record.title!,
                                                        record.description!
                                                      ]),
                                                    )
                                                    .toList(),
                                              )
                                                      .search(
                                                          textController!.text)
                                                      .map((r) => r.object)
                                                      .toList(),
                                            )
                                            .onError((_, __) =>
                                                simpleSearchResults = [])
                                            .whenComplete(
                                                () => setState(() {}));
                                      },
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF57636C),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          '485b361b' /* sweets, date nights, the best.... */,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Color(0xFF090F13),
                                          size: 16,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF090F13),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ).animated([
                                      animationsMap[
                                          'textFieldOnPageLoadAnimation']!
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 24, 16, 44),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'h6x97wez' /* Explore Top Foodie 
Spots in I... */
                                  ,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ).animated(
                                  [animationsMap['textOnPageLoadAnimation1']!]),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                              child: Container(
                                width: double.infinity,
                                height: 600,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryDark,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 16),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Divider(
                                          height: 8,
                                          thickness: 4,
                                          indent: 140,
                                          endIndent: 140,
                                          color: Color(0xFFF1F4F8),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 16, 16, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'hf5c0opi' /* Experience Top Notch Spots */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ).animated([
                                            animationsMap[
                                                'textOnPageLoadAnimation2']!
                                          ]),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 4, 16, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'fn0o2om7' /* Chosen by your local community */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF57636C),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ).animated([
                                            animationsMap[
                                                'textOnPageLoadAnimation3']!
                                          ]),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 12, 0, 0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 210,
                                            decoration: BoxDecoration(),
                                            child: PagedListView<
                                                DocumentSnapshot<Object?>?,
                                                CuratedListsRecord>(
                                              pagingController: () {
                                                final Query<Object?> Function(
                                                        Query<Object?>)
                                                    queryBuilder =
                                                    (curatedListsRecord) =>
                                                        curatedListsRecord
                                                            .where('isFeatured',
                                                                isEqualTo:
                                                                    true);
                                                if (_pagingController != null) {
                                                  final query = queryBuilder(
                                                      CuratedListsRecord
                                                          .collection);
                                                  if (query != _pagingQuery) {
                                                    // The query has changed
                                                    _pagingQuery = query;
                                                    _streamSubscriptions
                                                        .forEach(
                                                            (s) => s?.cancel());
                                                    _streamSubscriptions
                                                        .clear();
                                                    _pagingController!
                                                        .refresh();
                                                  }
                                                  return _pagingController!;
                                                }

                                                _pagingController =
                                                    PagingController(
                                                        firstPageKey: null);
                                                _pagingQuery = queryBuilder(
                                                    CuratedListsRecord
                                                        .collection);
                                                _pagingController!
                                                    .addPageRequestListener(
                                                        (nextPageMarker) {
                                                  queryCuratedListsRecordPage(
                                                    queryBuilder:
                                                        (curatedListsRecord) =>
                                                            curatedListsRecord
                                                                .where(
                                                                    'isFeatured',
                                                                    isEqualTo:
                                                                        true),
                                                    nextPageMarker:
                                                        nextPageMarker,
                                                    pageSize: 5,
                                                    isStream: true,
                                                  ).then((page) {
                                                    _pagingController!
                                                        .appendPage(
                                                      page.data,
                                                      page.nextPageMarker,
                                                    );
                                                    final streamSubscription =
                                                        page.dataStream
                                                            ?.listen((data) {
                                                      final itemIndexes =
                                                          _pagingController!
                                                              .itemList!
                                                              .asMap()
                                                              .map((k, v) =>
                                                                  MapEntry(
                                                                      v.reference
                                                                          .id,
                                                                      k));
                                                      data.forEach((item) {
                                                        final index =
                                                            itemIndexes[item
                                                                .reference.id];
                                                        final items =
                                                            _pagingController!
                                                                .itemList!;
                                                        if (index != null) {
                                                          items.replaceRange(
                                                              index,
                                                              index + 1,
                                                              [item]);
                                                          _pagingController!
                                                              .itemList = {
                                                            for (var item
                                                                in items)
                                                              item.reference:
                                                                  item
                                                          }.values.toList();
                                                        }
                                                      });
                                                      setState(() {});
                                                    });
                                                    _streamSubscriptions.add(
                                                        streamSubscription);
                                                  });
                                                });
                                                return _pagingController!;
                                              }(),
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              builderDelegate:
                                                  PagedChildBuilderDelegate<
                                                      CuratedListsRecord>(
                                                // Customize what your widget looks like when it's loading the first page.
                                                firstPageProgressIndicatorBuilder:
                                                    (_) => Center(
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
                                                ),

                                                itemBuilder: (context, _,
                                                    listViewIndex) {
                                                  final listViewCuratedListsRecord =
                                                      _pagingController!
                                                              .itemList![
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 8, 0, 12),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'CURATED_LIST_Container_1qg2prpz_ON_TAP');
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
                                                        decoration:
                                                            BoxDecoration(
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
                                                            color: Color(
                                                                0xFFF1F4F8),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'CURATED_LIST_Column_ds2vyjmy_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Column_Navigate-To');

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
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12),
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      listViewCuratedListsRecord
                                                                          .image!,
                                                                  width: double
                                                                      .infinity,
                                                                  height: 110,
                                                                  fit: BoxFit
                                                                      .cover,
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
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .subtitle1
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: Color(0xFF090F13),
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
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
                                                                                textAlign: TextAlign.start,
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
                                                                      height:
                                                                          32,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFF090F13),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          listViewCuratedListsRecord
                                                                              .range!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: Colors.white,
                                                                                fontSize: 14,
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
                                                      ),
                                                    ).animated([
                                                      animationsMap[
                                                          'containerOnPageLoadAnimation1']!
                                                    ]),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 16, 16, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'uwcoitnx' /* Your Results */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ).animated([
                                            animationsMap[
                                                'textOnPageLoadAnimation4']!
                                          ]),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 12, 0, 0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 210,
                                            decoration: BoxDecoration(),
                                            child: Builder(
                                              builder: (context) {
                                                final results =
                                                    simpleSearchResults
                                                        .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: results.length,
                                                  itemBuilder:
                                                      (context, resultsIndex) {
                                                    final resultsItem =
                                                        results[resultsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 8, 0, 12),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'CURATED_LIST_Container_hg5teyxt_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Container_Navigate-To');

                                                          context.pushNamed(
                                                            'curatedListSwipe',
                                                            queryParams: {
                                                              'curatedList':
                                                                  serializeParam(
                                                                      resultsItem,
                                                                      ParamType
                                                                          .Document),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'curatedList':
                                                                  resultsItem,
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          width: 270,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 8,
                                                                color: Color(
                                                                    0x230F1113),
                                                                offset: Offset(
                                                                    0, 4),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFF1F4F8),
                                                              width: 1,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'CURATED_LIST_Column_8wrr55jk_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Column_Navigate-To');

                                                              context.pushNamed(
                                                                'curatedListSwipe',
                                                                queryParams: {
                                                                  'curatedList': serializeParam(
                                                                      resultsItem,
                                                                      ParamType
                                                                          .Document),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'curatedList':
                                                                      resultsItem,
                                                                },
                                                              );
                                                            },
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
                                                                            0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            12),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            12),
                                                                  ),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    imageUrl:
                                                                        resultsItem
                                                                            .image!,
                                                                    width: double
                                                                        .infinity,
                                                                    height: 110,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            resultsItem.title!,
                                                                            style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: Color(0xFF090F13),
                                                                                  fontSize: 18,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                8,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    '${resultsItem.followers!.toList().length.toString()} Following',
                                                                                    '0 Following',
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
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
                                                                        height:
                                                                            32,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFF090F13),
                                                                          borderRadius:
                                                                              BorderRadius.circular(12),
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            resultsItem.range!,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: Colors.white,
                                                                                  fontSize: 14,
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
            ),
          ],
        ),
      ),
    );
  }
}
