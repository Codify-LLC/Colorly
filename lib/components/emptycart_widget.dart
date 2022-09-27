import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/delivery_sheet_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptycartWidget extends StatefulWidget {
  const EmptycartWidget({
    Key? key,
    this.user,
    this.restaurant,
    this.restaurantRef,
  }) : super(key: key);

  final DocumentReference? user;
  final RestaurantsRecord? restaurant;
  final DocumentReference? restaurantRef;

  @override
  _EmptycartWidgetState createState() => _EmptycartWidgetState();
}

class _EmptycartWidgetState extends State<EmptycartWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
      child: AuthUserStreamWidget(
        child: StreamBuilder<List<InCartItemRecord>>(
          stream: queryInCartItemRecord(
            queryBuilder: (inCartItemRecord) => inCartItemRecord.where(
                'shoppingBag',
                isEqualTo: currentUserDocument!.shoppingBag),
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
            List<InCartItemRecord> proPlanInCartItemRecordList = snapshot.data!;
            return Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    color: Color(0x32171717),
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(currentUserReference!),
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
                    final rowUsersRecord = snapshot.data!;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/shopping-basket-remove_hires.png',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '76zz6lii' /* Empty Current Bag? */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 10, 0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'dzqmyonk' /* You have items from a differen... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF57636C),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: StreamBuilder<ShoppingBagRecord>(
                                    stream: ShoppingBagRecord.getDocument(
                                        currentUserDocument!.shoppingBag!),
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
                                      final rowShoppingBagRecord =
                                          snapshot.data!;
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Badge(
                                            badgeContent: Text(
                                              formatNumber(
                                                proPlanInCartItemRecordList
                                                    .length,
                                                formatType: FormatType.custom,
                                                format: '0',
                                                locale: '',
                                              ),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 8),
                                            position: BadgePosition.topEnd(),
                                            animationType:
                                                BadgeAnimationType.scale,
                                            toAnimate: true,
                                            child: StreamBuilder<
                                                List<InCartItemRecord>>(
                                              stream: queryInCartItemRecord(
                                                queryBuilder: (inCartItemRecord) =>
                                                    inCartItemRecord.where(
                                                        'shoppingBag',
                                                        isEqualTo:
                                                            currentUserDocument!
                                                                .shoppingBag),
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<InCartItemRecord>
                                                    buttonInCartItemRecordList =
                                                    snapshot.data!;
                                                return FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'EMPTYCART_COMP_MY_BAG_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_Navigate-To');

                                                    context.pushNamed(
                                                        'shoppingCart');
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'vakr97dy' /* My Bag */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 100,
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
                                                );
                                              },
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'EMPTYCART_COMP__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_Bottom-Sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: Container(
                                                      height: 400,
                                                      child:
                                                          DeliverySheetWidget(
                                                        restaurant:
                                                            widget.restaurant,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            text: '',
                                            icon: FaIcon(
                                              FontAwesomeIcons.solidTrashAlt,
                                            ),
                                            options: FFButtonOptions(
                                              width: 45,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                        ],
                                      );
                                    },
                                  ),
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
            );
          },
        ),
      ),
    );
  }
}
