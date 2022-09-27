import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/delivery_sheet_widget.dart';
import '../components/emptycart_widget.dart';
import '../components/no_menu_items_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMenuCartCopyWidget extends StatefulWidget {
  const AddMenuCartCopyWidget({
    Key? key,
    this.stream,
    this.streamRef,
  }) : super(key: key);

  final StreamsRecord? stream;
  final DocumentReference? streamRef;

  @override
  _AddMenuCartCopyWidgetState createState() => _AddMenuCartCopyWidgetState();
}

class _AddMenuCartCopyWidgetState extends State<AddMenuCartCopyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryDark,
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
            padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'hmqwz39f' /* Items in video */,
                    ),
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                if (currentUserDocument!.shoppingBag != null)
                  AuthUserStreamWidget(
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'ADD_MENU_CART_COPY_Container_tffa5207_ON');
                        logFirebaseEvent('Container_Navigate-To');

                        context.pushNamed('shoppingCart');
                      },
                      child: Container(
                        width: 59,
                        decoration: BoxDecoration(),
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            Icon(
                              Icons.shopping_bag,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              size: 34,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              decoration: BoxDecoration(
                color: Color(0x00960000),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Builder(
                  builder: (context) {
                    final menuItems = widget.stream!.menuItems!.toList();
                    if (menuItems.isEmpty) {
                      return NoMenuItemsWidget();
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children:
                            List.generate(menuItems.length, (menuItemsIndex) {
                          final menuItemsItem = menuItems[menuItemsIndex];
                          return StreamBuilder<RestaurantsRecord>(
                            stream: RestaurantsRecord.getDocument(
                                widget.stream!.restaurant!),
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
                              final columnRestaurantsRecord = snapshot.data!;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 0),
                                    child: StreamBuilder<MenuItemRecord>(
                                      stream: MenuItemRecord.getDocument(
                                          menuItemsItem),
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
                                        final eventCardMenuItemRecord =
                                            snapshot.data!;
                                        return InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'ADD_MENU_CART_COPY_COMP_eventCard_ON_TAP');
                                            logFirebaseEvent(
                                                'eventCard_Navigate-To');

                                            context.pushNamed(
                                              'singleItem',
                                              queryParams: {
                                                'menuItem': serializeParam(
                                                    eventCardMenuItemRecord,
                                                    ParamType.Document),
                                                'restaurant': serializeParam(
                                                    columnRestaurantsRecord,
                                                    ParamType.Document),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'menuItem':
                                                    eventCardMenuItemRecord,
                                                'restaurant':
                                                    columnRestaurantsRecord,
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: 250,
                                            height: 210,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
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
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Column(
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
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(6,
                                                                      6, 0, 0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFEEEEEE),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        eventCardMenuItemRecord
                                                                            .itemImage,
                                                                        'https://cdn.vox-cdn.com/thumbor/9qN-DmdwZE__GqwuoJIinjUXzmk=/0x0:960x646/1200x900/filters:focal(404x247:556x399)/cdn.vox-cdn.com/uploads/chorus_image/image/63084260/foodlife_2.0.jpg',
                                                                      ),
                                                                      width:
                                                                          238,
                                                                      height:
                                                                          125,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  6, 6, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            eventCardMenuItemRecord
                                                                .itemName!
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
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  6, 0, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            eventCardMenuItemRecord
                                                                .itemDescription!
                                                                .maybeHandleOverflow(
                                                              maxChars: 25,
                                                              replacement: '…',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  6, 0, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            formatNumber(
                                                              eventCardMenuItemRecord
                                                                  .itemPrice!,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .periodDecimal,
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
                                                                      FontWeight
                                                                          .w500,
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
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          if (valueOrDefault<bool>(currentUserDocument?.isPremium, false) ==
              true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: AuthUserStreamWidget(
                child: StreamBuilder<RestaurantsRecord>(
                  stream:
                      RestaurantsRecord.getDocument(widget.stream!.restaurant!),
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
                    final stackRestaurantsRecord = snapshot.data!;
                    return Stack(
                      alignment: AlignmentDirectional(0, 0),
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'ADD_MENU_CART_COPY_START_NEW_ORDER_BTN_O');
                            if (currentUserDocument!.shoppingBag != null) {
                              logFirebaseEvent('Button_Bottom-Sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: EmptycartWidget(
                                      restaurant: stackRestaurantsRecord,
                                      restaurantRef: widget.stream!.restaurant,
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            } else {
                              logFirebaseEvent('Button_Bottom-Sheet');
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
                                        restaurant: stackRestaurantsRecord,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            }
                          },
                          text: FFLocalizations.of(context).getText(
                            '3mmclc45' /* Start New Order */,
                          ),
                          options: FFButtonOptions(
                            width: 160,
                            height: 40,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
