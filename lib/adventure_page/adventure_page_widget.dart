import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdventurePageWidget extends StatefulWidget {
  const AdventurePageWidget({
    Key? key,
    this.adventure,
  }) : super(key: key);

  final AdventuresRecord? adventure;

  @override
  _AdventurePageWidgetState createState() => _AdventurePageWidgetState();
}

class _AdventurePageWidgetState extends State<AdventurePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'adventurePage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryDark,
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            logFirebaseEvent('ADVENTURE_PAGE_PAGE_Icon_ilorkbce_ON_TAP');
            logFirebaseEvent('Icon_Navigate-Back');
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).tertiaryColor,
            size: 24,
          ),
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'fmo7le4r' /* Adventure */,
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
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
        child: AuthUserStreamWidget(
          child: StreamBuilder<AdventuresRecord>(
            stream: AdventuresRecord.getDocument(
                currentUserDocument!.adventureRef!),
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
              final columnAdventuresRecord = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<RestaurantsRecord>(
                      stream: RestaurantsRecord.getDocument(
                          columnAdventuresRecord.slot1!),
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
                        final cardEventPhotoRestaurantsRecord = snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.white,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image.network(
                                        valueOrDefault<String>(
                                          cardEventPhotoRestaurantsRecord
                                              .featuredImage,
                                          'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  cardEventPhotoRestaurantsRecord
                                                      .categories!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xC0000000),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                        height: 1,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFDBE2E7),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  cardEventPhotoRestaurantsRecord
                                                      .restaurantName!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF151B1E),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                cardEventPhotoRestaurantsRecord
                                                    .restDescription!
                                                    .maybeHandleOverflow(
                                                  maxChars: 80,
                                                  replacement: '…',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF8B97A2),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 4),
                                              child: Icon(
                                                Icons.location_on_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: Text(
                                                  cardEventPhotoRestaurantsRecord
                                                      .restAddress!,
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
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Stack(
                                              children: [
                                                StreamBuilder<
                                                    List<PostsRecord>>(
                                                  stream: queryPostsRecord(
                                                    queryBuilder: (postsRecord) =>
                                                        postsRecord.where(
                                                            'rest_ref',
                                                            isEqualTo:
                                                                cardEventPhotoRestaurantsRecord
                                                                    .reference),
                                                  ),
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
                                                    List<PostsRecord>
                                                        containerPostsRecordList =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEEEEEE),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Text(
                                                        functions.getAverageRating(
                                                            containerPostsRecordList
                                                                .toList()),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  fontSize: 18,
                                                                ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 0, 0),
                                              child: Text(
                                                '${formatNumber(
                                                  cardEventPhotoRestaurantsRecord
                                                      .reviews,
                                                  formatType:
                                                      FormatType.compact,
                                                )} reviews',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(70, 0, 0, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADVENTURE_PAGE_PAGE_DETAILS_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_Navigate-To');

                                                  context.pushNamed(
                                                    'restaurantDetails',
                                                    queryParams: {
                                                      'restaurant': serializeParam(
                                                          cardEventPhotoRestaurantsRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '13yi472h' /* Details */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .subtitle2
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                          ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 30,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADVENTURE_PAGE_PAGE_phone_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_Backend-Call');

                                                  final restaurantsUpdateData =
                                                      {
                                                    'phoneClicks':
                                                        FieldValue.increment(1),
                                                  };
                                                  await cardEventPhotoRestaurantsRecord
                                                      .reference
                                                      .update(
                                                          restaurantsUpdateData);
                                                  logFirebaseEvent(
                                                      'IconButton_Launch-U-R-L');
                                                  await launchURL(
                                                      'tel:${cardEventPhotoRestaurantsRecord.phoneNumber}');
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 30,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADVENTURE_mapMarkedAlt_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_Backend-Call');

                                                  final restaurantsUpdateData =
                                                      {
                                                    'mapClicks':
                                                        FieldValue.increment(1),
                                                  };
                                                  await cardEventPhotoRestaurantsRecord
                                                      .reference
                                                      .update(
                                                          restaurantsUpdateData);
                                                  logFirebaseEvent(
                                                      'IconButton_Launch-U-R-L');
                                                  await launchURL(
                                                      functions.getMapUrl(
                                                          cardEventPhotoRestaurantsRecord
                                                              .restLatLong));
                                                },
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                borderWidth: 1,
                                                buttonSize: 60,
                                                icon: FaIcon(
                                                  FontAwesomeIcons.globe,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 30,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADVENTURE_PAGE_PAGE_globe_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_Backend-Call');

                                                  final restaurantsUpdateData =
                                                      {
                                                    'websiteClicks':
                                                        FieldValue.increment(1),
                                                  };
                                                  await cardEventPhotoRestaurantsRecord
                                                      .reference
                                                      .update(
                                                          restaurantsUpdateData);
                                                  logFirebaseEvent(
                                                      'IconButton_Launch-U-R-L');
                                                  await launchURL(
                                                      cardEventPhotoRestaurantsRecord
                                                          .website!);
                                                },
                                              ),
                                            ],
                                          ),
                                          if (cardEventPhotoRestaurantsRecord
                                                  .isSubscribed ??
                                              true)
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 60,
                                                  icon: Icon(
                                                    Icons.fastfood_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 34,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ADVENTURE_fastfood_rounded_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_Backend-Call');

                                                    final restaurantsUpdateData =
                                                        {
                                                      'orderNowClicks':
                                                          FieldValue.increment(
                                                              1),
                                                    };
                                                    await cardEventPhotoRestaurantsRecord
                                                        .reference
                                                        .update(
                                                            restaurantsUpdateData);
                                                    logFirebaseEvent(
                                                        'IconButton_Navigate-To');

                                                    context.pushNamed(
                                                      'order',
                                                      queryParams: {
                                                        'restaurant':
                                                            serializeParam(
                                                                cardEventPhotoRestaurantsRecord,
                                                                ParamType
                                                                    .Document),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'restaurant':
                                                            cardEventPhotoRestaurantsRecord,
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                        ],
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.plus,
                            color: Colors.black,
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<RestaurantsRecord>(
                      stream: RestaurantsRecord.getDocument(
                          columnAdventuresRecord.slot2!),
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
                        final cardEventPhotoRestaurantsRecord = snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.white,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image.network(
                                        valueOrDefault<String>(
                                          cardEventPhotoRestaurantsRecord
                                              .featuredImage,
                                          'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  cardEventPhotoRestaurantsRecord
                                                      .categories!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xC0000000),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                        height: 1,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFDBE2E7),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  cardEventPhotoRestaurantsRecord
                                                      .restaurantName!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF151B1E),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                cardEventPhotoRestaurantsRecord
                                                    .restDescription!
                                                    .maybeHandleOverflow(
                                                  maxChars: 80,
                                                  replacement: '…',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF8B97A2),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 4),
                                              child: Icon(
                                                Icons.location_on_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: Text(
                                                  cardEventPhotoRestaurantsRecord
                                                      .restAddress!,
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
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Stack(
                                              children: [
                                                StreamBuilder<
                                                    List<PostsRecord>>(
                                                  stream: queryPostsRecord(
                                                    queryBuilder: (postsRecord) =>
                                                        postsRecord.where(
                                                            'rest_ref',
                                                            isEqualTo:
                                                                cardEventPhotoRestaurantsRecord
                                                                    .reference),
                                                  ),
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
                                                    List<PostsRecord>
                                                        containerPostsRecordList =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEEEEEE),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Text(
                                                        functions.getAverageRating(
                                                            containerPostsRecordList
                                                                .toList()),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  fontSize: 18,
                                                                ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 0, 0),
                                              child: Text(
                                                '${formatNumber(
                                                  cardEventPhotoRestaurantsRecord
                                                      .reviews,
                                                  formatType:
                                                      FormatType.compact,
                                                )} reviews',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(70, 0, 0, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADVENTURE_PAGE_PAGE_DETAILS_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_Navigate-To');

                                                  context.pushNamed(
                                                    'restaurantDetails',
                                                    queryParams: {
                                                      'restaurant': serializeParam(
                                                          cardEventPhotoRestaurantsRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0hra6l0e' /* Details */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .subtitle2
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                          ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 30,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADVENTURE_PAGE_PAGE_phone_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_Backend-Call');

                                                  final restaurantsUpdateData =
                                                      {
                                                    'phoneClicks':
                                                        FieldValue.increment(1),
                                                  };
                                                  await cardEventPhotoRestaurantsRecord
                                                      .reference
                                                      .update(
                                                          restaurantsUpdateData);
                                                  logFirebaseEvent(
                                                      'IconButton_Launch-U-R-L');
                                                  await launchURL(
                                                      'tel:${cardEventPhotoRestaurantsRecord.phoneNumber}');
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 30,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADVENTURE_mapMarkedAlt_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_Backend-Call');

                                                  final restaurantsUpdateData =
                                                      {
                                                    'mapClicks':
                                                        FieldValue.increment(1),
                                                  };
                                                  await cardEventPhotoRestaurantsRecord
                                                      .reference
                                                      .update(
                                                          restaurantsUpdateData);
                                                  logFirebaseEvent(
                                                      'IconButton_Launch-U-R-L');
                                                  await launchURL(
                                                      functions.getMapUrl(
                                                          cardEventPhotoRestaurantsRecord
                                                              .restLatLong));
                                                },
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                borderWidth: 1,
                                                buttonSize: 60,
                                                icon: FaIcon(
                                                  FontAwesomeIcons.globe,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 30,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADVENTURE_PAGE_PAGE_globe_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_Backend-Call');

                                                  final restaurantsUpdateData =
                                                      {
                                                    'websiteClicks':
                                                        FieldValue.increment(1),
                                                  };
                                                  await cardEventPhotoRestaurantsRecord
                                                      .reference
                                                      .update(
                                                          restaurantsUpdateData);
                                                  logFirebaseEvent(
                                                      'IconButton_Launch-U-R-L');
                                                  await launchURL(
                                                      cardEventPhotoRestaurantsRecord
                                                          .website!);
                                                },
                                              ),
                                            ],
                                          ),
                                          if (cardEventPhotoRestaurantsRecord
                                                  .isSubscribed ??
                                              true)
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 60,
                                                  icon: Icon(
                                                    Icons.fastfood_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 34,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ADVENTURE_fastfood_rounded_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_Backend-Call');

                                                    final restaurantsUpdateData =
                                                        {
                                                      'orderNowClicks':
                                                          FieldValue.increment(
                                                              1),
                                                    };
                                                    await cardEventPhotoRestaurantsRecord
                                                        .reference
                                                        .update(
                                                            restaurantsUpdateData);
                                                    logFirebaseEvent(
                                                        'IconButton_Navigate-To');

                                                    context.pushNamed(
                                                      'order',
                                                      queryParams: {
                                                        'restaurant':
                                                            serializeParam(
                                                                cardEventPhotoRestaurantsRecord,
                                                                ParamType
                                                                    .Document),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'restaurant':
                                                            cardEventPhotoRestaurantsRecord,
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                        ],
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.plus,
                            color: Colors.black,
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                      child: StreamBuilder<RestaurantsRecord>(
                        stream: RestaurantsRecord.getDocument(
                            columnAdventuresRecord.slot3!),
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
                          final cardEventPhotoRestaurantsRecord =
                              snapshot.data!;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Colors.white,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image.network(
                                          valueOrDefault<String>(
                                            cardEventPhotoRestaurantsRecord
                                                .featuredImage,
                                            'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    cardEventPhotoRestaurantsRecord
                                                        .categories!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xC0000000),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.85,
                                          height: 1,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDBE2E7),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    cardEventPhotoRestaurantsRecord
                                                        .restaurantName!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF151B1E),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  cardEventPhotoRestaurantsRecord
                                                      .restDescription!
                                                      .maybeHandleOverflow(
                                                    maxChars: 80,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF8B97A2),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 4),
                                                child: Icon(
                                                  Icons.location_on_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 20,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 0, 0, 0),
                                                  child: Text(
                                                    cardEventPhotoRestaurantsRecord
                                                        .restAddress!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Stack(
                                                children: [
                                                  StreamBuilder<
                                                      List<PostsRecord>>(
                                                    stream: queryPostsRecord(
                                                      queryBuilder: (postsRecord) =>
                                                          postsRecord.where(
                                                              'rest_ref',
                                                              isEqualTo:
                                                                  cardEventPhotoRestaurantsRecord
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<PostsRecord>
                                                          containerPostsRecordList =
                                                          snapshot.data!;
                                                      return Container(
                                                        width: 40,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEEEEE),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          functions.getAverageRating(
                                                              containerPostsRecordList
                                                                  .toList()),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: Text(
                                                  '${formatNumber(
                                                    cardEventPhotoRestaurantsRecord
                                                        .reviews,
                                                    formatType:
                                                        FormatType.compact,
                                                  )} reviews',
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
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(70, 0, 0, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ADVENTURE_PAGE_PAGE_DETAILS_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_Navigate-To');

                                                    context.pushNamed(
                                                      'restaurantDetails',
                                                      queryParams: {
                                                        'restaurant': serializeParam(
                                                            cardEventPhotoRestaurantsRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'nciixyra' /* Details */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 130,
                                                    height: 40,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: Colors.white,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
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
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 60,
                                                  icon: Icon(
                                                    Icons.phone,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 30,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ADVENTURE_PAGE_PAGE_phone_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_Backend-Call');

                                                    final restaurantsUpdateData =
                                                        {
                                                      'phoneClicks':
                                                          FieldValue.increment(
                                                              1),
                                                    };
                                                    await cardEventPhotoRestaurantsRecord
                                                        .reference
                                                        .update(
                                                            restaurantsUpdateData);
                                                    logFirebaseEvent(
                                                        'IconButton_Launch-U-R-L');
                                                    await launchURL(
                                                        'tel:${cardEventPhotoRestaurantsRecord.phoneNumber}');
                                                  },
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 60,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .mapMarkedAlt,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 30,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ADVENTURE_mapMarkedAlt_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_Backend-Call');

                                                    final restaurantsUpdateData =
                                                        {
                                                      'mapClicks':
                                                          FieldValue.increment(
                                                              1),
                                                    };
                                                    await cardEventPhotoRestaurantsRecord
                                                        .reference
                                                        .update(
                                                            restaurantsUpdateData);
                                                    logFirebaseEvent(
                                                        'IconButton_Launch-U-R-L');
                                                    await launchURL(
                                                        functions.getMapUrl(
                                                            cardEventPhotoRestaurantsRecord
                                                                .restLatLong));
                                                  },
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 60,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.globe,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 30,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ADVENTURE_PAGE_PAGE_globe_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_Backend-Call');

                                                    final restaurantsUpdateData =
                                                        {
                                                      'websiteClicks':
                                                          FieldValue.increment(
                                                              1),
                                                    };
                                                    await cardEventPhotoRestaurantsRecord
                                                        .reference
                                                        .update(
                                                            restaurantsUpdateData);
                                                    logFirebaseEvent(
                                                        'IconButton_Launch-U-R-L');
                                                    await launchURL(
                                                        cardEventPhotoRestaurantsRecord
                                                            .website!);
                                                  },
                                                ),
                                              ],
                                            ),
                                            if (cardEventPhotoRestaurantsRecord
                                                    .isSubscribed ??
                                                true)
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 60,
                                                    icon: Icon(
                                                      Icons.fastfood_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 34,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'ADVENTURE_fastfood_rounded_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_Backend-Call');

                                                      final restaurantsUpdateData =
                                                          {
                                                        'orderNowClicks':
                                                            FieldValue
                                                                .increment(1),
                                                      };
                                                      await cardEventPhotoRestaurantsRecord
                                                          .reference
                                                          .update(
                                                              restaurantsUpdateData);
                                                      logFirebaseEvent(
                                                          'IconButton_Navigate-To');

                                                      context.pushNamed(
                                                        'order',
                                                        queryParams: {
                                                          'restaurant':
                                                              serializeParam(
                                                                  cardEventPhotoRestaurantsRecord,
                                                                  ParamType
                                                                      .Document),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'restaurant':
                                                              cardEventPhotoRestaurantsRecord,
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                          ],
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
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
