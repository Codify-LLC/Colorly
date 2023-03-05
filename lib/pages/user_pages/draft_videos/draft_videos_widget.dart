import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/edit_draft/edit_draft_widget.dart';
import '/components/no_liked_videos/no_liked_videos_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'draft_videos_model.dart';
export 'draft_videos_model.dart';

class DraftVideosWidget extends StatefulWidget {
  const DraftVideosWidget({Key? key}) : super(key: key);

  @override
  _DraftVideosWidgetState createState() => _DraftVideosWidgetState();
}

class _DraftVideosWidgetState extends State<DraftVideosWidget> {
  late DraftVideosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DraftVideosModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'draftVideos'});
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

    return Title(
        title: 'draftVideos',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                logFirebaseEvent('DRAFT_VIDEOS_arrow_back_rounded_ICN_ON_T');
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'rwanjnyu' /* Drafts */,
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
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<PostDraftsRecord>>(
                        stream: queryPostDraftsRecord(
                          queryBuilder: (postDraftsRecord) => postDraftsRecord
                              .where('user', isEqualTo: currentUserReference)
                              .orderBy('created_at', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: SpinKitThreeBounce(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 30.0,
                                ),
                              ),
                            );
                          }
                          List<PostDraftsRecord> gridViewPostDraftsRecordList =
                              snapshot.data!;
                          if (gridViewPostDraftsRecordList.isEmpty) {
                            return NoLikedVideosWidget();
                          }
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 3.0,
                              mainAxisSpacing: 0.0,
                              childAspectRatio: 0.75,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewPostDraftsRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewPostDraftsRecord =
                                  gridViewPostDraftsRecordList[gridViewIndex];
                              return StreamBuilder<RestaurantsRecord>(
                                stream: RestaurantsRecord.getDocument(
                                    gridViewPostDraftsRecord.restRef!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
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
                                  final stackRestaurantsRecord = snapshot.data!;
                                  return Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.86, -0.97),
                                        child: FaIcon(
                                          FontAwesomeIcons.solidEdit,
                                          color: Color(0xD8FFFFFF),
                                          size: 24.0,
                                        ),
                                      ),
                                      StreamBuilder<RestaurantsRecord>(
                                        stream: RestaurantsRecord.getDocument(
                                            gridViewPostDraftsRecord.restRef!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child: SpinKitThreeBounce(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 30.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final imageRestaurantsRecord =
                                              snapshot.data!;
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: CachedNetworkImage(
                                              imageUrl: valueOrDefault<String>(
                                                gridViewPostDraftsRecord
                                                    .videoThumbnail,
                                                'http://colorly.app/wp-content/uploads/2021/08/OQaOKP_t20_g8wmld.jpg',
                                              ),
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'DRAFT_VIDEOS_Container_fh76m30e_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.9,
                                                  child: EditDraftWidget(
                                                    postDraft:
                                                        gridViewPostDraftsRecord,
                                                    restaurant:
                                                        stackRestaurantsRecord,
                                                    restRef:
                                                        stackRestaurantsRecord
                                                            .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0x000F0F0F),
                                                FlutterFlowTheme.of(context)
                                                    .primaryDark
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 5.0),
                                            child: Text(
                                              stackRestaurantsRecord
                                                  .restaurantName!,
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
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 0.0, 0.0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'DRAFT_VIDEOS_PAGE_Icon_2g56zw8f_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_backend_call');
                                            await gridViewPostDraftsRecord
                                                .reference
                                                .delete();
                                          },
                                          child: Icon(
                                            Icons.delete_rounded,
                                            color: Color(0xD8FFFFFF),
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
