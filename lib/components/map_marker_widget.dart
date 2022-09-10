import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/delivery_sheet_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MapMarkerWidget extends StatefulWidget {
  const MapMarkerWidget({
    Key? key,
    this.restaurant,
    this.posts,
    this.restaurants,
  }) : super(key: key);

  final RestaurantsRecord? restaurant;
  final DocumentReference? posts;
  final DocumentReference? restaurants;

  @override
  _MapMarkerWidgetState createState() => _MapMarkerWidgetState();
}

class _MapMarkerWidgetState extends State<MapMarkerWidget> {
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0x00960000),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  width: 350,
                  height: 175,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(
                        valueOrDefault<String>(
                          widget.restaurant!.featuredImage,
                          'https://news.vumc.org/wp-content/uploads/Restaurant-iStock_edited-1.jpg',
                        ),
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 350,
                            height: 175,
                            decoration: BoxDecoration(
                              color: Color(0xB30F0F0F),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'MAP_MARKER_COMP_Row_gsag1nv3_ON_TAP');
                          logFirebaseEvent('Row_Navigate-To');

                          context.pushNamed(
                            'restaurantDetails',
                            queryParams: {
                              'restaurant': serializeParam(
                                  widget.restaurant!.reference,
                                  ParamType.DocumentReference),
                            }.withoutNulls,
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 4,
                                      shape: const CircleBorder(),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Stack(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              children: [
                                                Container(
                                                  width: 60,
                                                  height: 60,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      widget.restaurant!.logo,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test3-r71why/assets/ikoxy9icoqvd/icon%20google%20play.png',
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 10, 0, 0),
                                    child: StreamBuilder<List<PostsRecord>>(
                                      stream: queryPostsRecord(
                                        queryBuilder: (postsRecord) =>
                                            postsRecord.where('rest_ref',
                                                isEqualTo: widget
                                                    .restaurant!.reference),
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
                                        List<PostsRecord>
                                            containerPostsRecordList =
                                            snapshot.data!;
                                        return Material(
                                          color: Colors.transparent,
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(99),
                                          ),
                                          child: Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                              borderRadius:
                                                  BorderRadius.circular(99),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                functions.getAverageRating(
                                                    containerPostsRecordList
                                                        .toList()),
                                                '-',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
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
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        widget.restaurant!.restaurantName!
                                            .maybeHandleOverflow(
                                          maxChars: 18,
                                          replacement: '…',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              fontSize: 26,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.restaurant!.restAddress!
                                            .maybeHandleOverflow(maxChars: 30),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        widget.restaurant!.categories!
                                            .maybeHandleOverflow(maxChars: 30),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 4, 0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget.restaurant!.priceRange,
                                            '\$\$',
                                          ).maybeHandleOverflow(maxChars: 30),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF00FF00),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          '${valueOrDefault<String>(
                                            widget.restaurant!.reviews
                                                ?.toString(),
                                            '0',
                                          )} reviews',
                                          '0 reviews',
                                        ).maybeHandleOverflow(maxChars: 30),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
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
                                        '${functions.getDistance(currentUserLocationValue, widget.restaurant!.restLatLong)} miles away'
                                            .maybeHandleOverflow(maxChars: 30),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  buttonSize: 48,
                                  icon: Icon(
                                    Icons.phone_enabled,
                                    color: Colors.orange,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'MAP_MARKER_COMP_phone_enabled_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_Launch-U-R-L');
                                    await launchURL(
                                        'tel:${widget.restaurant!.phoneNumber}');
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
                                  buttonSize: 48,
                                  icon: FaIcon(
                                    FontAwesomeIcons.mapMarkedAlt,
                                    color: Colors.orange,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'MAP_MARKER_COMP_mapMarkedAlt_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_Launch-U-R-L');
                                    await launchURL(functions.getMapUrl(
                                        widget.restaurant!.restLatLong));
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
                                  buttonSize: 48,
                                  icon: FaIcon(
                                    FontAwesomeIcons.globe,
                                    color: Colors.orange,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'MAP_MARKER_COMP_globe_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_Launch-U-R-L');
                                    await launchURL(
                                        'https://${widget.restaurant!.website}');
                                  },
                                ),
                              ],
                            ),
                            if (widget.restaurant!.isSubscribed ?? true)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    buttonSize: 48,
                                    icon: Icon(
                                      Icons.fastfood_rounded,
                                      color: Colors.orange,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'MAP_MARKER_fastfood_rounded_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_Backend-Call');

                                      final restaurantsUpdateData = {
                                        'orderNowClicks':
                                            FieldValue.increment(1),
                                      };
                                      await widget.restaurant!.reference
                                          .update(restaurantsUpdateData);
                                      logFirebaseEvent(
                                          'IconButton_Bottom-Sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: Container(
                                              height: 400,
                                              child: DeliverySheetWidget(
                                                restaurant: widget.restaurant,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
