import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMenuToPostWidget extends StatefulWidget {
  const AddMenuToPostWidget({
    Key? key,
    this.post,
    this.restaurant,
  }) : super(key: key);

  final PostsRecord? post;
  final RestaurantsRecord? restaurant;

  @override
  _AddMenuToPostWidgetState createState() => _AddMenuToPostWidgetState();
}

class _AddMenuToPostWidgetState extends State<AddMenuToPostWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'totzsitj' /* Add Items */,
                    ),
                    style: FlutterFlowTheme.of(context).subtitle2.override(
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
            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
            child: StreamBuilder<List<MenuItemRecord>>(
              stream: queryMenuItemRecord(
                queryBuilder: (menuItemRecord) => menuItemRecord
                    .where('restRef', isEqualTo: widget.restaurant!.reference)
                    .orderBy('itemName', descending: true),
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
                List<MenuItemRecord> eventsListMenuItemRecordList =
                    snapshot.data!;
                if (eventsListMenuItemRecordList.isEmpty) {
                  return Center(
                    child: Image.asset(
                      'assets/images/no_menu_items.png',
                      height: 250,
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(eventsListMenuItemRecordList.length,
                        (eventsListIndex) {
                      final eventsListMenuItemRecord =
                          eventsListMenuItemRecordList[eventsListIndex];
                      return Align(
                        alignment: AlignmentDirectional(0, -0.65),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: Stack(
                            alignment: AlignmentDirectional(0, 0),
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 20, 0, 0),
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
                                      borderRadius: BorderRadius.circular(16),
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
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    child: CachedNetworkImage(
                                                      imageUrl: valueOrDefault<
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
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6, 6, 0, 0),
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6, 0, 0, 0),
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
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF414141),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                formatNumber(
                                                  eventsListMenuItemRecord
                                                      .itemPrice!,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.periodDecimal,
                                                  currency: '\$',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF43C643),
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 0, 50),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  icon: Icon(
                                    Icons.add_box_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ADD_MENU_TO_POST_add_box_outlined_ICN_ON');
                                    logFirebaseEvent('IconButton_Backend-Call');

                                    final postsUpdateData = {
                                      ...createPostsRecordData(
                                        restaurantName: '',
                                      ),
                                      'menuItems': FieldValue.arrayUnion(
                                          [eventsListMenuItemRecord.reference]),
                                    };
                                    await widget.post!.reference
                                        .update(postsUpdateData);
                                    logFirebaseEvent('IconButton_Alert-Dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Added to your post!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    logFirebaseEvent('IconButton_Backend-Call');

                                    final usersUpdateData = {
                                      'fizzzCoin': FieldValue.increment(2),
                                      'fizzzMonthly': FieldValue.increment(2),
                                    };
                                    await currentUserReference!
                                        .update(usersUpdateData);
                                  },
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
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ADD_MENU_TO_POST_COMP_DONE_BTN_ON_TAP');
                    logFirebaseEvent('Button_Navigate-To');

                    context.goNamed('userProfile');
                  },
                  text: FFLocalizations.of(context).getText(
                    'ki0vldlo' /* Done */,
                  ),
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
            ),
          ),
        ],
      ),
    );
  }
}
