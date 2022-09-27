import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/deal_popup_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDealStoryWidget extends StatefulWidget {
  const AddDealStoryWidget({
    Key? key,
    this.deal,
    this.restaurant,
    this.story,
  }) : super(key: key);

  final DealsRecord? deal;
  final RestaurantsRecord? restaurant;
  final StoriesRecord? story;

  @override
  _AddDealStoryWidgetState createState() => _AddDealStoryWidgetState();
}

class _AddDealStoryWidgetState extends State<AddDealStoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        StreamBuilder<List<DealsRecord>>(
          stream: queryDealsRecord(
            queryBuilder: (dealsRecord) => dealsRecord
                .where('active', isEqualTo: true)
                .where('expiry', isGreaterThanOrEqualTo: getCurrentTimestamp)
                .where('restRef', isEqualTo: widget.restaurant!.reference),
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
            List<DealsRecord> rowDealsRecordList = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(rowDealsRecordList.length, (rowIndex) {
                  final rowDealsRecord = rowDealsRecordList[rowIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                    child: Stack(
                      alignment: AlignmentDirectional(0, 0),
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 16, 0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'ADD_DEAL_STORY_Container_e35wbe6u_ON_TAP');
                              logFirebaseEvent('Container_Bottom-Sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: Container(
                                      height: 800,
                                      child: DealPopupWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.86,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0x25000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 4, 4, 4),
                                    child: Container(
                                      width: 4,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 16, 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            rowDealsRecord.title!,
                                            style: FlutterFlowTheme.of(context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF090F13),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Text(
                                              rowDealsRecord.details!
                                                  .maybeHandleOverflow(
                                                maxChars: 21,
                                                replacement: '…',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF090F13),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Text(
                                              'Until ${dateTimeFormat('MMMEd', rowDealsRecord.expiry)}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF874E00),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 5,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                      ),
                                      Container(
                                        width: 5,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                      ),
                                      Container(
                                        width: 5,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                      ),
                                      Container(
                                        width: 5,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                      ),
                                      Container(
                                        width: 5,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                      ),
                                      Container(
                                        width: 5,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                      ),
                                      Container(
                                        width: 5,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                          alignment: AlignmentDirectional(1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(310, 10, 0, 0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x4E6E6E6E),
                                    offset: Offset(-1, 0),
                                  )
                                ],
                                shape: BoxShape.circle,
                              ),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADD_DEAL_STORY_add_circle_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_Backend-Call');

                                  final storiesUpdateData =
                                      createStoriesRecordData(
                                    dealRef: rowDealsRecord.reference,
                                    hasDeal: true,
                                  );
                                  await widget.story!.reference
                                      .update(storiesUpdateData);
                                  logFirebaseEvent('IconButton_Alert-Dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Deal has been added!'),
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
                                  logFirebaseEvent('IconButton_Navigate-To');

                                  context.goNamed('userProfile');
                                },
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.6, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(170, 10, 0, 0),
                            child: StreamBuilder<RestaurantsRecord>(
                              stream: RestaurantsRecord.getDocument(
                                  rowDealsRecord.restRef!),
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
                                final circleImageRestaurantsRecord =
                                    snapshot.data!;
                                return Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    circleImageRestaurantsRecord.logo!,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            );
          },
        ),
      ],
    );
  }
}
