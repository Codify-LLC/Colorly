import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/no_liked_videos_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LikedVideosWidget extends StatefulWidget {
  const LikedVideosWidget({Key? key}) : super(key: key);

  @override
  _LikedVideosWidgetState createState() => _LikedVideosWidgetState();
}

class _LikedVideosWidgetState extends State<LikedVideosWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'likedVideos'});
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
            logFirebaseEvent('LIKED_VIDEOS_arrow_back_rounded_ICN_ON_T');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            '7i54k28h' /* Flavored Videos */,
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
                  StreamBuilder<List<PostsRecord>>(
                    stream: queryPostsRecord(
                      queryBuilder: (postsRecord) => postsRecord
                          .where('likes', arrayContains: currentUserReference)
                          .where('isFlagged', isEqualTo: false)
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
                      List<PostsRecord> gridViewPostsRecordList =
                          snapshot.data!;
                      if (gridViewPostsRecordList.isEmpty) {
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
                        itemCount: gridViewPostsRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewPostsRecord =
                              gridViewPostsRecordList[gridViewIndex];
                          return StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                gridViewPostsRecord.user!),
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
                              final stackUsersRecord = snapshot.data!;
                              return Stack(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'LIKED_VIDEOS_PAGE_Image_tbsrz4i9_ON_TAP');
                                      logFirebaseEvent('Image_Backend-Call');

                                      final postsUpdateData = {
                                        'wacthed': FieldValue.increment(1),
                                      };
                                      await gridViewPostsRecord.reference
                                          .update(postsUpdateData);
                                      logFirebaseEvent('Image_Navigate-To');

                                      context.pushNamed(
                                        'singleVideoPage',
                                        queryParams: {
                                          'post': serializeParam(
                                              gridViewPostsRecord,
                                              ParamType.Document),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'post': gridViewPostsRecord,
                                        },
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        imageUrl: valueOrDefault<String>(
                                          gridViewPostsRecord.videoThumbnail,
                                          'http://colorly.app/wp-content/uploads/2021/08/OQaOKP_t20_g8wmld.jpg',
                                        ),
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(0.85, -0.85),
                                    child: Icon(
                                      Icons.play_circle_outline_rounded,
                                      color: Color(0xD8FFFFFF),
                                      size: 24,
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0x00960000),
                                              FlutterFlowTheme.of(context)
                                                  .primaryDark
                                            ],
                                            stops: [0, 1],
                                            begin: AlignmentDirectional(0, -1),
                                            end: AlignmentDirectional(0, 1),
                                          ),
                                        ),
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2, 0, 3, 0),
                                              child: Icon(
                                                Icons.remove_red_eye,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                size: 14,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 5, 0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  gridViewPostsRecord.wacthed
                                                      ?.toString(),
                                                  '0',
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
                                                      fontSize: 12,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 3, 0),
                                              child: FaIcon(
                                                FontAwesomeIcons.fire,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                size: 12,
                                              ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                gridViewPostsRecord.likes!
                                                    .toList()
                                                    .length
                                                    .toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    fontSize: 12,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
