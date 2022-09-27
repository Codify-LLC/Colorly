import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class ChooseRestaurantWidget extends StatefulWidget {
  const ChooseRestaurantWidget({
    Key? key,
    this.stream,
  }) : super(key: key);

  final StreamsRecord? stream;

  @override
  _ChooseRestaurantWidgetState createState() => _ChooseRestaurantWidgetState();
}

class _ChooseRestaurantWidgetState extends State<ChooseRestaurantWidget> {
  LatLng? currentUserLocationValue;
  List<RestaurantsRecord> simpleSearchResults = [];
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    return StreamBuilder<List<RestaurantsRecord>>(
      stream: queryRestaurantsRecord(),
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
        List<RestaurantsRecord> buttonFullWidthRestaurantsRecordList =
            snapshot.data!;
        return Container(
          width: double.infinity,
          height: 320,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x411D2429),
                offset: Offset(0, -2),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 5, 10, 5),
                    child: TextFormField(
                      controller: textController,
                      onChanged: (_) => EasyDebounce.debounce(
                        'textController',
                        Duration(milliseconds: 200),
                        () async {
                          logFirebaseEvent(
                              'CHOOSE_RESTAURANT_TextField_e0xphe0g_ON_');
                          logFirebaseEvent('TextField_Simple-Search');
                          setState(() {
                            simpleSearchResults = TextSearch(
                              buttonFullWidthRestaurantsRecordList
                                  .map(
                                    (record) => TextSearchItem(record, [
                                      record.restaurantName!,
                                      record.restAddress!,
                                      record.restDescription!
                                    ]),
                                  )
                                  .toList(),
                            )
                                .search(textController!.text)
                                .map((r) => r.object)
                                .take(20)
                                .toList();
                          });
                        },
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: FFLocalizations.of(context).getText(
                          'd66dpf33' /* Search restaurants... */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
                        focusedErrorBorder: UnderlineInputBorder(
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
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final restaurants = simpleSearchResults.toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: restaurants.length,
                      itemBuilder: (context, restaurantsIndex) {
                        final restaurantsItem = restaurants[restaurantsIndex];
                        return Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'CHOOSE_RESTAURANT_COMP_menuItem_ON_TAP');
                              logFirebaseEvent('menuItem_Backend-Call');

                              final streamsUpdateData = createStreamsRecordData(
                                restaurant: restaurantsItem.reference,
                                hasRestaurant: true,
                              );
                              await widget.stream!.reference
                                  .update(streamsUpdateData);
                              logFirebaseEvent('menuItem_Bottom-Sheet');
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0x411D2429),
                                    offset: Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 1, 1, 1),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: CachedNetworkImage(
                                          imageUrl: restaurantsItem.logo!,
                                          width: 70,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 4, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              restaurantsItem.restaurantName!,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF090F13),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 8, 0),
                                                child: AutoSizeText(
                                                  restaurantsItem.restAddress!
                                                      .maybeHandleOverflow(
                                                    maxChars: 70,
                                                    replacement: '…',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF7C8791),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: Icon(
                                            Icons.chevron_right_rounded,
                                            color: Color(0xFF57636C),
                                            size: 24,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 4, 8),
                                          child: Text(
                                            '${functions.getDistance(currentUserLocationValue, restaurantsItem.restLatLong)} mi.',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
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
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
