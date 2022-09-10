import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/edit_draft_widget.dart';
import '../components/no_liked_videos_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DraftVideosWidget extends StatefulWidget {
  const DraftVideosWidget({Key? key}) : super(key: key);

  @override
  _DraftVideosWidgetState createState() => _DraftVideosWidgetState();
}

class _DraftVideosWidgetState extends State<DraftVideosWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'draftVideos'});
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
            logFirebaseEvent('DRAFT_VIDEOS_arrow_back_rounded_ICN_ON_T');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'rwanjnyu' /* Drafts */,
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
      backgroundColor: FlutterFlowTheme.of(context).primaryDark,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryDark,
            ),
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
                            width: 30,
                            height: 30,
                            child: SpinKitThreeBounce(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 30,
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 0,
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
                              final stackRestaurantsRecord = snapshot.data!;
                              return Stack(
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.86, -0.97),
                                    child: FaIcon(
                                      FontAwesomeIcons.solidEdit,
                                      color: Color(0xD8FFFFFF),
                                      size: 24,
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
                                      final imageRestaurantsRecord =
                                          snapshot.data!;
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
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
                                          'Container_Bottom-Sheet');
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
                                                restRef: stackRestaurantsRecord
                                                    .reference,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x000F0F0F),
                                            FlutterFlowTheme.of(context)
                                                .primaryDark
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(0, -1),
                                          end: AlignmentDirectional(0, 1),
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0, 1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 5),
                                        child: Text(
                                          stackRestaurantsRecord
                                              .restaurantName!,
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'DRAFT_VIDEOS_PAGE_Icon_2g56zw8f_ON_TAP');
                                        logFirebaseEvent('Icon_Backend-Call');
                                        await gridViewPostDraftsRecord.reference
                                            .delete();
                                      },
                                      child: Icon(
                                        Icons.delete_rounded,
                                        color: Color(0xD8FFFFFF),
                                        size: 24,
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
    );
  }
}
