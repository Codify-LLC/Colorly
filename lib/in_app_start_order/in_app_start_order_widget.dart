import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/deal_popup_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:text_search/text_search.dart';

class InAppStartOrderWidget extends StatefulWidget {
  const InAppStartOrderWidget({
    Key? key,
    this.restaurant,
    this.user,
  }) : super(key: key);

  final RestaurantsRecord? restaurant;
  final UsersRecord? user;

  @override
  _InAppStartOrderWidgetState createState() => _InAppStartOrderWidgetState();
}

class _InAppStartOrderWidgetState extends State<InAppStartOrderWidget>
    with TickerProviderStateMixin {
  InCartItemRecord? shoppingBagItem2;
  InCartItemRecord? shoppingBagItem5;
  List<MenuItemRecord> simpleSearchResults = [];
  TextEditingController? textController;
  PagingController<DocumentSnapshot?, DealsRecord>? _pagingController;
  Query? _pagingQuery;

  String? choiceChipsValue;
  InCartItemRecord? shoppingBagItem;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'iconButtonOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 110,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0.5,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'iconButtonOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 110,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0.5,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'iconButtonOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 110,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0.5,
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
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'inAppStartOrder'});
    textController = TextEditingController();
  }

  @override
  void dispose() {
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
            logFirebaseEvent('IN_APP_START_ORDER_arrow_back_rounded_IC');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          widget.restaurant!.restaurantName!,
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).tertiaryColor,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryDark,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            alignment: AlignmentDirectional(0, 1),
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional(-1, 1),
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(99),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(99),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: valueOrDefault<String>(
                                    widget.restaurant!.featuredImage,
                                    'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                  ),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 4,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Container(
                                    width: 65,
                                    height: 65,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: valueOrDefault<String>(
                                        widget.restaurant!.logo,
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test3-r71why/assets/ikoxy9icoqvd/icon%20google%20play.png',
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xBA333333),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 40, 0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      widget.restaurant!
                                                          .deliveryFee,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                      currency: '\$',
                                                    ),
                                                    '\$0',
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
                                                                .tertiaryColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(40, 0, 0, 0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    '${valueOrDefault<String>(
                                                      widget.restaurant!
                                                          .deliveryTime
                                                          ?.toString(),
                                                      '35',
                                                    )} min.',
                                                    '35 min.',
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
                                                                .tertiaryColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'm44x8x1m' /* delivery fee */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(30, 0, 0, 0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'xihysat3' /* delivery time */,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Container(
                                        width: 270,
                                        height: 2,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF6B6B6B),
                                          borderRadius:
                                              BorderRadius.circular(99),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 0, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'vajvqze1' /* **This restaurant ONLY deliver... */,
                                          ),
                                          textAlign: TextAlign.center,
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
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional(1, 0),
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Container(
                                          width: 196,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 4, 4, 4),
                                            child: FlutterFlowChoiceChips(
                                              initiallySelected:
                                                  choiceChipsValue != null
                                                      ? [choiceChipsValue!]
                                                      : [
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'eztxdlsq' /* Pickup */,
                                                          )
                                                        ],
                                              options: [
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'auw5opaj' /* Pickup */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'glqsjmso' /* Delivery */,
                                                ))
                                              ],
                                              onChanged: (val) => setState(() =>
                                                  choiceChipsValue =
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
                                                          fontSize: 16,
                                                        ),
                                                iconColor: Colors.white,
                                                iconSize: 18,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(12, 8, 12, 8),
                                                elevation: 4,
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    Color(0xFFDBE2E7),
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF262D34),
                                                      fontSize: 16,
                                                    ),
                                                iconColor: Color(0xFF6B6B6B),
                                                iconSize: 0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(12, 8, 12, 8),
                                                elevation: 0,
                                              ),
                                              chipSpacing: 8,
                                              multiselect: false,
                                              initialized:
                                                  choiceChipsValue != null,
                                              alignment: WrapAlignment.start,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (widget.restaurant!.deliveryRange! <=
                                          valueOrDefault<int>(
                                            functions.distanceInteger(
                                                currentUserDocument!
                                                    .locationDelivery,
                                                widget.restaurant!.restLatLong),
                                            99,
                                          ))
                                        AuthUserStreamWidget(
                                          child: Container(
                                            width: 100,
                                            height: 47,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1xv2odyh' /* *Delivery Not Available */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40, 2, 40, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        '${widget.restaurant!.pickupTime?.toString()} min',
                                        '20 min.',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          60, 0, 0, 0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          '${widget.restaurant!.deliveryTime?.toString()} min.',
                                          '35 min.',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 375,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Color(0x00414141),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: PagedListView<
                                        DocumentSnapshot<Object?>?,
                                        DealsRecord>(
                                      pagingController: () {
                                        final Query<Object?> Function(
                                                Query<Object?>) queryBuilder =
                                            (dealsRecord) => dealsRecord
                                                .where('restRef',
                                                    isEqualTo: widget
                                                        .restaurant!.reference)
                                                .where('promoted',
                                                    isEqualTo: true)
                                                .where('expiry',
                                                    isGreaterThanOrEqualTo:
                                                        getCurrentTimestamp)
                                                .orderBy('expiry');
                                        if (_pagingController != null) {
                                          final query = queryBuilder(
                                              DealsRecord.collection);
                                          if (query != _pagingQuery) {
                                            // The query has changed
                                            _pagingQuery = query;

                                            _pagingController!.refresh();
                                          }
                                          return _pagingController!;
                                        }

                                        _pagingController = PagingController(
                                            firstPageKey: null);
                                        _pagingQuery = queryBuilder(
                                            DealsRecord.collection);
                                        _pagingController!
                                            .addPageRequestListener(
                                                (nextPageMarker) {
                                          queryDealsRecordPage(
                                            queryBuilder: (dealsRecord) =>
                                                dealsRecord
                                                    .where('restRef',
                                                        isEqualTo: widget
                                                            .restaurant!
                                                            .reference)
                                                    .where('promoted',
                                                        isEqualTo: true)
                                                    .where('expiry',
                                                        isGreaterThanOrEqualTo:
                                                            getCurrentTimestamp)
                                                    .orderBy('expiry'),
                                            nextPageMarker: nextPageMarker,
                                            pageSize: 10,
                                            isStream: false,
                                          ).then((page) {
                                            _pagingController!.appendPage(
                                              page.data,
                                              page.nextPageMarker,
                                            );
                                          });
                                        });
                                        return _pagingController!;
                                      }(),
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      builderDelegate:
                                          PagedChildBuilderDelegate<
                                              DealsRecord>(
                                        // Customize what your widget looks like when it's loading the first page.
                                        firstPageProgressIndicatorBuilder:
                                            (_) => Center(
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
                                        ),

                                        itemBuilder:
                                            (context, _, listViewIndex) {
                                          final listViewDealsRecord =
                                              _pagingController!
                                                  .itemList![listViewIndex];
                                          return Visibility(
                                            visible: !(currentUserDocument
                                                        ?.usedDeals
                                                        ?.toList() ??
                                                    [])
                                                .contains(listViewDealsRecord
                                                    .reference),
                                            child: AuthUserStreamWidget(
                                              child: Container(
                                                width: 375,
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 12,
                                                                  16, 0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.86,
                                                        decoration:
                                                            BoxDecoration(
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
                                                        child: InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'IN_APP_START_ORDER_Row_nhs7ozh5_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Row_Bottom-Sheet');
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
                                                                        DealPopupWidget(
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
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                        BorderRadius
                                                                            .circular(4),
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
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                          listViewDealsRecord
                                                                              .details!
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                21,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
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
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
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
                                                                    height: 10,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFEEEEEE),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
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
                                                                          BorderRadius.circular(
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
                                                                          BorderRadius.circular(
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
                                                                          BorderRadius.circular(
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
                                                                          BorderRadius.circular(
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
                                                                          BorderRadius.circular(
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
                                                                          BorderRadius.circular(
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
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 10,
                                                                    0, 0),
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
                                                            shape:
                                                                BoxShape.circle,
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
                                                                .fromSTEB(0, 10,
                                                                    0, 0),
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
                                                    if (listViewDealsRecord
                                                        .userSaved!
                                                        .toList()
                                                        .contains(
                                                            currentUserReference))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.75, -0.65),
                                                        child: Icon(
                                                          Icons
                                                              .favorite_rounded,
                                                          color:
                                                              Color(0xFFB20000),
                                                          size: 24,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
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
                                width: MediaQuery.of(context).size.width * 0.95,
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
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 4, 0),
                                        child: Icon(
                                          Icons.search_rounded,
                                          color: Color(0xFF95A1AC),
                                          size: 24,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 0),
                                          child: TextFormField(
                                            controller: textController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              'textController',
                                              Duration(milliseconds: 200),
                                              () async {
                                                logFirebaseEvent(
                                                    'IN_APP_START_ORDER_TextField_292n7mn4_ON');
                                                logFirebaseEvent(
                                                    'TextField_Simple-Search');
                                                await queryMenuItemRecordOnce()
                                                    .then(
                                                      (records) =>
                                                          simpleSearchResults =
                                                              TextSearch(
                                                        records
                                                            .map(
                                                              (record) =>
                                                                  TextSearchItem(
                                                                      record, [
                                                                record
                                                                    .itemName!,
                                                                record
                                                                    .itemDescription!
                                                              ]),
                                                            )
                                                            .toList(),
                                                      )
                                                                  .search(
                                                                      textController!
                                                                          .text)
                                                                  .map((r) =>
                                                                      r.object)
                                                                  .toList(),
                                                    )
                                                    .onError((_, __) =>
                                                        simpleSearchResults =
                                                            [])
                                                    .whenComplete(
                                                        () => setState(() {}));
                                              },
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '6wu5279v' /* Search  menu... */,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              suffixIcon: textController!
                                                      .text.isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        textController?.clear();
                                                        logFirebaseEvent(
                                                            'IN_APP_START_ORDER_TextField_292n7mn4_ON');
                                                        logFirebaseEvent(
                                                            'TextField_Simple-Search');
                                                        await queryMenuItemRecordOnce()
                                                            .then(
                                                              (records) => simpleSearchResults =
                                                                  TextSearch(
                                                                records
                                                                    .map(
                                                                      (record) =>
                                                                          TextSearchItem(
                                                                              record,
                                                                              [
                                                                            record.itemName!,
                                                                            record.itemDescription!
                                                                          ]),
                                                                    )
                                                                    .toList(),
                                                              )
                                                                      .search(textController!
                                                                          .text)
                                                                      .map((r) =>
                                                                          r.object)
                                                                      .toList(),
                                                            )
                                                            .onError((_, __) =>
                                                                simpleSearchResults =
                                                                    [])
                                                            .whenComplete(() =>
                                                                setState(
                                                                    () {}));

                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFF2F2F2F),
                                                        size: 15,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF95A1AC),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Builder(
                        builder: (context) {
                          final searchedItem = simpleSearchResults.toList();
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(searchedItem.length,
                                  (searchedItemIndex) {
                                final searchedItemItem =
                                    searchedItem[searchedItemIndex];
                                return Visibility(
                                  visible: searchedItemItem.restRef ==
                                      widget.restaurant!.reference,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'IN_APP_START_ORDER_Container_eotbwux7_ON');
                                        logFirebaseEvent(
                                            'Container_Navigate-To');

                                        context.pushNamed(
                                          'singleItem',
                                          queryParams: {
                                            'menuItem': serializeParam(
                                                searchedItemItem,
                                                ParamType.Document),
                                            'restaurant': serializeParam(
                                                widget.restaurant,
                                                ParamType.Document),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'menuItem': searchedItemItem,
                                            'restaurant': widget.restaurant,
                                          },
                                        );
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Container(
                                          width: 250,
                                          height: 210,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                6, 6, 0, 0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 2,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEEEEE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  searchedItemItem
                                                                      .itemImage,
                                                                  'https://cdn.vox-cdn.com/thumbor/9qN-DmdwZE__GqwuoJIinjUXzmk=/0x0:960x646/1200x900/filters:focal(404x247:556x399)/cdn.vox-cdn.com/uploads/chorus_image/image/63084260/foodlife_2.0.jpg',
                                                                ),
                                                                width: 238,
                                                                height: 125,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          5,
                                                                          5,
                                                                          5),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                buttonSize: 45,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                icon: Icon(
                                                                  Icons
                                                                      .add_circle_rounded,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 30,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'IN_APP_START_ORDER_add_circle_rounded_IC');
                                                                  if (widget
                                                                          .restaurant!
                                                                          .reference ==
                                                                      currentUserDocument!
                                                                          .orderingRestaurant) {
                                                                    logFirebaseEvent(
                                                                        'IconButton_Backend-Call');

                                                                    final inCartItemCreateData =
                                                                        createInCartItemRecordData(
                                                                      menuItem:
                                                                          searchedItemItem
                                                                              .reference,
                                                                      user:
                                                                          currentUserReference,
                                                                      price: searchedItemItem
                                                                          .itemPrice,
                                                                      quantity:
                                                                          1.0,
                                                                      timeAdded:
                                                                          getCurrentTimestamp,
                                                                      shoppingBag:
                                                                          currentUserDocument!
                                                                              .shoppingBag,
                                                                      restaurantRef: widget
                                                                          .restaurant!
                                                                          .reference,
                                                                    );
                                                                    var inCartItemRecordReference =
                                                                        InCartItemRecord
                                                                            .collection
                                                                            .doc();
                                                                    await inCartItemRecordReference
                                                                        .set(
                                                                            inCartItemCreateData);
                                                                    shoppingBagItem5 =
                                                                        InCartItemRecord.getDocumentFromData(
                                                                            inCartItemCreateData,
                                                                            inCartItemRecordReference);
                                                                    logFirebaseEvent(
                                                                        'IconButton_Backend-Call');

                                                                    final shoppingBagUpdateData =
                                                                        {
                                                                      'inCartItemsRef':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        shoppingBagItem!
                                                                            .reference
                                                                      ]),
                                                                    };
                                                                    await currentUserDocument!
                                                                        .shoppingBag!
                                                                        .update(
                                                                            shoppingBagUpdateData);
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'IconButton_Show-Snack-Bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Can not add to bag',
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).tertiaryColor,
                                                                      ),
                                                                    );
                                                                  }

                                                                  logFirebaseEvent(
                                                                      'IconButton_Widget-Animation');
                                                                  if (animationsMap[
                                                                          'iconButtonOnActionTriggerAnimation2'] ==
                                                                      null) {
                                                                    return;
                                                                  }
                                                                  await (animationsMap['iconButtonOnActionTriggerAnimation2']!
                                                                              .curvedAnimation
                                                                              .parent
                                                                          as AnimationController)
                                                                      .forward(
                                                                          from:
                                                                              0.0);

                                                                  logFirebaseEvent(
                                                                      'IconButton_Show-Snack-Bar');
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Item Added',
                                                                        style: GoogleFonts
                                                                            .getFont(
                                                                          'Lexend',
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .tertiaryColor,
                                                                    ),
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'IconButton_Backend-Call');

                                                                  final usersUpdateData =
                                                                      createUsersRecordData(
                                                                    orderingRestaurant: widget
                                                                        .restaurant!
                                                                        .reference,
                                                                  );
                                                                  await currentUserReference!
                                                                      .update(
                                                                          usersUpdateData);

                                                                  setState(
                                                                      () {});
                                                                },
                                                              ).animated([
                                                                animationsMap[
                                                                    'iconButtonOnActionTriggerAnimation1']!
                                                              ]),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(6, 6, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      searchedItemItem.itemName!
                                                          .maybeHandleOverflow(
                                                        maxChars: 18,
                                                        replacement: '…',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(6, 0, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      searchedItemItem
                                                          .itemDescription!
                                                          .maybeHandleOverflow(
                                                        maxChars: 25,
                                                        replacement: '…',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF414141),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(6, 0, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      formatNumber(
                                                        searchedItemItem
                                                            .itemPrice!,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                        currency: '\$',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFF43C643),
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '6fyrrrw2' /* Featured Items */,
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 20),
                      child: StreamBuilder<List<MenuItemRecord>>(
                        stream: queryMenuItemRecord(
                          queryBuilder: (menuItemRecord) => menuItemRecord
                              .where('restRef',
                                  isEqualTo: widget.restaurant!.reference)
                              .where('featuredItem', isEqualTo: true),
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
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 30,
                                ),
                              ),
                            );
                          }
                          List<MenuItemRecord> eventsListMenuItemRecordList =
                              snapshot.data!;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  eventsListMenuItemRecordList.length,
                                  (eventsListIndex) {
                                final eventsListMenuItemRecord =
                                    eventsListMenuItemRecordList[
                                        eventsListIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 20, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'IN_APP_START_ORDER_Container_ofgpdmrc_ON');
                                      logFirebaseEvent('Container_Navigate-To');

                                      context.pushNamed(
                                        'singleItem',
                                        queryParams: {
                                          'menuItem': serializeParam(
                                              eventsListMenuItemRecord,
                                              ParamType.Document),
                                          'restaurant': serializeParam(
                                              widget.restaurant,
                                              ParamType.Document),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'menuItem': eventsListMenuItemRecord,
                                          'restaurant': widget.restaurant,
                                        },
                                      );
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Container(
                                        width: 250,
                                        height: 210,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(6, 6, 0, 0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEEEEEE),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  valueOrDefault<
                                                                      String>(
                                                                eventsListMenuItemRecord
                                                                    .itemImage,
                                                                'https://cdn.vox-cdn.com/thumbor/9qN-DmdwZE__GqwuoJIinjUXzmk=/0x0:960x646/1200x900/filters:focal(404x247:556x399)/cdn.vox-cdn.com/uploads/chorus_image/image/63084260/foodlife_2.0.jpg',
                                                              ),
                                                              width: 238,
                                                              height: 125,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        5,
                                                                        5,
                                                                        5),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 30,
                                                              buttonSize: 45,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              icon: Icon(
                                                                Icons
                                                                    .add_circle_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 30,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'IN_APP_START_ORDER_add_circle_rounded_IC');
                                                                if (widget
                                                                        .restaurant!
                                                                        .reference ==
                                                                    currentUserDocument!
                                                                        .orderingRestaurant) {
                                                                  logFirebaseEvent(
                                                                      'IconButton_Backend-Call');

                                                                  final inCartItemCreateData =
                                                                      createInCartItemRecordData(
                                                                    menuItem:
                                                                        eventsListMenuItemRecord
                                                                            .reference,
                                                                    user:
                                                                        currentUserReference,
                                                                    price: eventsListMenuItemRecord
                                                                        .itemPrice,
                                                                    quantity:
                                                                        1.0,
                                                                    timeAdded:
                                                                        getCurrentTimestamp,
                                                                    shoppingBag:
                                                                        currentUserDocument!
                                                                            .shoppingBag,
                                                                    restaurantRef: widget
                                                                        .restaurant!
                                                                        .reference,
                                                                  );
                                                                  var inCartItemRecordReference =
                                                                      InCartItemRecord
                                                                          .collection
                                                                          .doc();
                                                                  await inCartItemRecordReference
                                                                      .set(
                                                                          inCartItemCreateData);
                                                                  shoppingBagItem =
                                                                      InCartItemRecord.getDocumentFromData(
                                                                          inCartItemCreateData,
                                                                          inCartItemRecordReference);
                                                                  logFirebaseEvent(
                                                                      'IconButton_Backend-Call');

                                                                  final shoppingBagUpdateData =
                                                                      {
                                                                    'inCartItemsRef':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      shoppingBagItem!
                                                                          .reference
                                                                    ]),
                                                                  };
                                                                  await currentUserDocument!
                                                                      .shoppingBag!
                                                                      .update(
                                                                          shoppingBagUpdateData);
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'IconButton_Show-Snack-Bar');
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Can not add to bag',
                                                                        style:
                                                                            TextStyle(),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .tertiaryColor,
                                                                    ),
                                                                  );
                                                                }

                                                                logFirebaseEvent(
                                                                    'IconButton_Widget-Animation');
                                                                if (animationsMap[
                                                                        'iconButtonOnActionTriggerAnimation2'] ==
                                                                    null) {
                                                                  return;
                                                                }
                                                                await (animationsMap['iconButtonOnActionTriggerAnimation2']!
                                                                            .curvedAnimation
                                                                            .parent
                                                                        as AnimationController)
                                                                    .forward(
                                                                        from:
                                                                            0.0);

                                                                logFirebaseEvent(
                                                                    'IconButton_Show-Snack-Bar');
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Item Added',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Lexend',
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                  ),
                                                                );
                                                                logFirebaseEvent(
                                                                    'IconButton_Backend-Call');

                                                                final usersUpdateData =
                                                                    createUsersRecordData(
                                                                  orderingRestaurant: widget
                                                                      .restaurant!
                                                                      .reference,
                                                                );
                                                                await currentUserReference!
                                                                    .update(
                                                                        usersUpdateData);

                                                                setState(() {});
                                                              },
                                                            ).animated([
                                                              animationsMap[
                                                                  'iconButtonOnActionTriggerAnimation2']!
                                                            ]),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6, 6, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    eventsListMenuItemRecord
                                                        .itemName!
                                                        .maybeHandleOverflow(
                                                      maxChars: 18,
                                                      replacement: '…',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6, 0, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    eventsListMenuItemRecord
                                                        .itemDescription!
                                                        .maybeHandleOverflow(
                                                      maxChars: 25,
                                                      replacement: '…',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF414141),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6, 0, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    formatNumber(
                                                      eventsListMenuItemRecord
                                                          .itemPrice!,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                      currency: '\$',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF43C643),
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: StreamBuilder<List<MenuCourseRecord>>(
                              stream: queryMenuCourseRecord(
                                queryBuilder: (menuCourseRecord) =>
                                    menuCourseRecord.where('restRef',
                                        isEqualTo:
                                            widget.restaurant!.reference),
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
                                List<MenuCourseRecord>
                                    listViewMenuCourseRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewMenuCourseRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewMenuCourseRecord =
                                        listViewMenuCourseRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 5),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          color: Color(0xBA333333),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              listViewMenuCourseRecord
                                                  .courseName!,
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Expanded(
                                              child: ListView(
                                                padding: EdgeInsets.zero,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 20),
                                                    child: StreamBuilder<
                                                        List<MenuItemRecord>>(
                                                      stream:
                                                          queryMenuItemRecord(
                                                        queryBuilder: (menuItemRecord) => menuItemRecord
                                                            .where('restRef',
                                                                isEqualTo: widget
                                                                    .restaurant!
                                                                    .reference)
                                                            .where('courseRef',
                                                                isEqualTo:
                                                                    listViewMenuCourseRecord
                                                                        .reference),
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
                                                        List<MenuItemRecord>
                                                            eventsListMenuItemRecordList =
                                                            snapshot.data!;
                                                        return SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: List.generate(
                                                                eventsListMenuItemRecordList
                                                                    .length,
                                                                (eventsListIndex) {
                                                              final eventsListMenuItemRecord =
                                                                  eventsListMenuItemRecordList[
                                                                      eventsListIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16,
                                                                            20,
                                                                            8,
                                                                            0),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'IN_APP_START_ORDER_Container_tvnup694_ON');
                                                                    logFirebaseEvent(
                                                                        'Container_Navigate-To');

                                                                    context
                                                                        .pushNamed(
                                                                      'singleItem',
                                                                      queryParams:
                                                                          {
                                                                        'menuItem': serializeParam(
                                                                            eventsListMenuItemRecord,
                                                                            ParamType.Document),
                                                                        'restaurant': serializeParam(
                                                                            widget.restaurant,
                                                                            ParamType.Document),
                                                                      }.withoutNulls,
                                                                      extra: <
                                                                          String,
                                                                          dynamic>{
                                                                        'menuItem':
                                                                            eventsListMenuItemRecord,
                                                                        'restaurant':
                                                                            widget.restaurant,
                                                                      },
                                                                    );
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
                                                                          BorderRadius.circular(
                                                                              16),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          250,
                                                                      height:
                                                                          210,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(16),
                                                                                          child: CachedNetworkImage(
                                                                                            imageUrl: valueOrDefault<String>(
                                                                                              eventsListMenuItemRecord.itemImage,
                                                                                              'https://cdn.vox-cdn.com/thumbor/9qN-DmdwZE__GqwuoJIinjUXzmk=/0x0:960x646/1200x900/filters:focal(404x247:556x399)/cdn.vox-cdn.com/uploads/chorus_image/image/63084260/foodlife_2.0.jpg',
                                                                                            ),
                                                                                            width: 238,
                                                                                            height: 125,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                          child:
                                                                                              FlutterFlowIconButton(
                                                                                            borderColor: Colors.transparent,
                                                                                            borderRadius: 30,
                                                                                            buttonSize: 45,
                                                                                            fillColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                            icon: Icon(
                                                                                              Icons.add_circle_rounded,
                                                                                              color: Colors.white,
                                                                                              size: 30,
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              logFirebaseEvent('IN_APP_START_ORDER_add_circle_rounded_IC');
                                                                                              if (widget.restaurant!.reference == currentUserDocument!.orderingRestaurant) {
                                                                                                logFirebaseEvent('IconButton_Backend-Call');

                                                                                                final inCartItemCreateData = createInCartItemRecordData(
                                                                                                  menuItem: eventsListMenuItemRecord.reference,
                                                                                                  user: currentUserReference,
                                                                                                  price: eventsListMenuItemRecord.itemPrice,
                                                                                                  quantity: 1.0,
                                                                                                  timeAdded: getCurrentTimestamp,
                                                                                                  shoppingBag: currentUserDocument!.shoppingBag,
                                                                                                );
                                                                                                var inCartItemRecordReference = InCartItemRecord.collection.doc();
                                                                                                await inCartItemRecordReference.set(inCartItemCreateData);
                                                                                                shoppingBagItem2 = InCartItemRecord.getDocumentFromData(inCartItemCreateData, inCartItemRecordReference);
                                                                                                logFirebaseEvent('IconButton_Backend-Call');

                                                                                                final shoppingBagUpdateData = {
                                                                                                  'inCartItemsRef': FieldValue.arrayUnion([
                                                                                                    shoppingBagItem2!.reference
                                                                                                  ]),
                                                                                                };
                                                                                                await currentUserDocument!.shoppingBag!.update(shoppingBagUpdateData);
                                                                                              } else {
                                                                                                logFirebaseEvent('IconButton_Show-Snack-Bar');
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Can not add to bag',
                                                                                                      style: TextStyle(),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                  ),
                                                                                                );
                                                                                              }

                                                                                              logFirebaseEvent('IconButton_Widget-Animation');
                                                                                              if (animationsMap['iconButtonOnActionTriggerAnimation2'] == null) {
                                                                                                return;
                                                                                              }
                                                                                              await (animationsMap['iconButtonOnActionTriggerAnimation2']!.curvedAnimation.parent as AnimationController).forward(from: 0.0);

                                                                                              logFirebaseEvent('IconButton_Show-Snack-Bar');
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    'Item Added',
                                                                                                    style: GoogleFonts.getFont(
                                                                                                      'Lexend',
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      fontSize: 14,
                                                                                                    ),
                                                                                                  ),
                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                  backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                ),
                                                                                              );
                                                                                              logFirebaseEvent('IconButton_Backend-Call');

                                                                                              final usersUpdateData = createUsersRecordData(
                                                                                                orderingRestaurant: widget.restaurant!.reference,
                                                                                              );
                                                                                              await currentUserReference!.update(usersUpdateData);

                                                                                              setState(() {});
                                                                                            },
                                                                                          ).animated([
                                                                                            animationsMap['iconButtonOnActionTriggerAnimation3']!
                                                                                          ]),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                6,
                                                                                6,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
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
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                6,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
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
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                6,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
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
                                                ],
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AuthUserStreamWidget(
                          child: StreamBuilder<List<InCartItemRecord>>(
                            stream: queryInCartItemRecord(
                              queryBuilder: (inCartItemRecord) =>
                                  inCartItemRecord.where('shoppingBag',
                                      isEqualTo:
                                          currentUserDocument!.shoppingBag),
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
                              List<InCartItemRecord>
                                  containerInCartItemRecordList =
                                  snapshot.data!;
                              return Material(
                                color: Colors.transparent,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(99),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xF2E5831D),
                                    borderRadius: BorderRadius.circular(99),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'IN_APP_START_ORDER_Row_h6n0tjav_ON_TAP');
                                          logFirebaseEvent('Row_Navigate-To');

                                          context.pushNamed('shoppingCart');
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                              Icons.shopping_bag,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mdgbdp16' /* view my bag */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '37d9uhfq' /* Restaurant Name */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Badge(
                                              badgeContent: Text(
                                                containerInCartItemRecordList
                                                    .length
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: Colors.white,
                                                        ),
                                              ),
                                              showBadge: true,
                                              shape: BadgeShape.circle,
                                              badgeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              elevation: 4,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 8, 8, 8),
                                              position: BadgePosition.topEnd(),
                                              animationType:
                                                  BadgeAnimationType.scale,
                                              toAnimate: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
