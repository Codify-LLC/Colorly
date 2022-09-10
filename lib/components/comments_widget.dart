import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/no_comments_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentsWidget extends StatefulWidget {
  const CommentsWidget({
    Key? key,
    this.story,
    this.post,
  }) : super(key: key);

  final StoriesRecord? story;
  final PostsRecord? post;

  @override
  _CommentsWidgetState createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 563,
      child: Stack(
        alignment: AlignmentDirectional(0, 1),
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              height: 563,
              child: Stack(
                alignment: AlignmentDirectional(0, 0),
                children: [],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 525,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryDark,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(2),
                    bottomRight: Radius.circular(2),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(2),
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: StreamBuilder<StoriesRecord>(
                        stream:
                            StoriesRecord.getDocument(widget.story!.reference),
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
                          final columnStoriesRecord = snapshot.data!;
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Container(
                                    width: 60,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: Color(0xABFFFFFF),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'cnbzz7qy' /* Comments */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryDark,
                                  ),
                                  child:
                                      StreamBuilder<List<StoryCommentsRecord>>(
                                    stream: queryStoryCommentsRecord(
                                      queryBuilder: (storyCommentsRecord) =>
                                          storyCommentsRecord
                                              .where('storyAssociation',
                                                  isEqualTo: columnStoriesRecord
                                                      .reference)
                                              .where('deleted',
                                                  isEqualTo: false)
                                              .orderBy('timePosted',
                                                  descending: true),
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
                                      List<StoryCommentsRecord>
                                          listViewStoryCommentsRecordList =
                                          snapshot.data!;
                                      if (listViewStoryCommentsRecordList
                                          .isEmpty) {
                                        return Center(
                                          child: NoCommentsWidget(),
                                        );
                                      }
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewStoryCommentsRecordList
                                                .length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewStoryCommentsRecord =
                                              listViewStoryCommentsRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 12, 0, 0),
                                            child: StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  listViewStoryCommentsRecord
                                                      .commentUser!),
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
                                                final commentUsersRecord =
                                                    snapshot.data!;
                                                return InkWell(
                                                  onLongPress: () async {
                                                    logFirebaseEvent(
                                                        'COMMENTS_COMP_comment_ON_LONG_PRESS');
                                                    if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.superAdmin,
                                                        false)) {
                                                      logFirebaseEvent(
                                                          'comment_Alert-Dialog');
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Confirm'),
                                                                    content: Text(
                                                                        'Do you wan to delete this comment?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Cancel'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'Confirm'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        logFirebaseEvent(
                                                            'comment_Navigate-Back');
                                                        context.pop();
                                                      }
                                                      logFirebaseEvent(
                                                          'comment_Backend-Call');

                                                      final storyCommentsUpdateData =
                                                          createStoryCommentsRecordData(
                                                        deleted: true,
                                                      );
                                                      await listViewStoryCommentsRecord
                                                          .reference
                                                          .update(
                                                              storyCommentsUpdateData);
                                                    }
                                                    if (commentUsersRecord
                                                            .reference ==
                                                        currentUserReference) {
                                                      logFirebaseEvent(
                                                          'comment_Backend-Call');

                                                      final storyCommentsUpdateData =
                                                          createStoryCommentsRecordData(
                                                        deleted: true,
                                                      );
                                                      await listViewStoryCommentsRecord
                                                          .reference
                                                          .update(
                                                              storyCommentsUpdateData);
                                                      logFirebaseEvent(
                                                          'comment_Backend-Call');

                                                      final usersUpdateData = {
                                                        'fizzzCoin': FieldValue
                                                            .increment(-1),
                                                      };
                                                      await currentUserReference!
                                                          .update(
                                                              usersUpdateData);
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x45EEEEEE),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 12, 8, 12),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'COMMENTS_CircleImage_xv4p1jam_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'CircleImage_Navigate-To');

                                                              context.pushNamed(
                                                                'viewProfileOther',
                                                                queryParams: {
                                                                  'otherUser': serializeParam(
                                                                      commentUsersRecord
                                                                          .reference,
                                                                      ParamType
                                                                          .DocumentReference),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 40,
                                                              height: 40,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  commentUsersRecord
                                                                      .photoUrl,
                                                                  'https://p1.pxfuel.com/preview/828/149/229/indistinct-blurred-pineapple-rough.jpg',
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    commentUsersRecord
                                                                        .displayName!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiaryColor,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      listViewStoryCommentsRecord
                                                                          .comment!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              4,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '8u9eu9zs' /* Posted */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Lexend Deca',
                                                                                  color: Color(0xFFA4A4A4),
                                                                                  fontSize: 12,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                              'relative',
                                                                              listViewStoryCommentsRecord.timePosted!),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: Color(0xFFA4A4A4),
                                                                                fontSize: 12,
                                                                              ),
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
                                                    ),
                                                  ),
                                                );
                                              },
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
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x3A000000),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 4),
                          child: TextFormField(
                            controller: textController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                '7hwbbwfq' /* Comment here... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF0F0F0F),
                                  ),
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
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color:
                                      FlutterFlowTheme.of(context).primaryDark,
                                ),
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('COMMENTS_COMP_POST_BTN_ON_TAP');
                            logFirebaseEvent('Button_Backend-Call');

                            final storyCommentsCreateData =
                                createStoryCommentsRecordData(
                              storyAssociation: widget.story!.reference,
                              commentUser: currentUserReference,
                              comment: textController!.text,
                              timePosted: getCurrentTimestamp,
                              deleted: false,
                            );
                            await StoryCommentsRecord.collection
                                .doc()
                                .set(storyCommentsCreateData);
                            logFirebaseEvent('Button_Backend-Call');

                            final storiesUpdateData = {
                              'numComments': FieldValue.increment(1),
                            };
                            await widget.story!.reference
                                .update(storiesUpdateData);
                            logFirebaseEvent(
                                'Button_Trigger-Push-Notification');
                            triggerPushNotification(
                              notificationTitle: 'New Comment',
                              notificationText: 'Your story has a new comment',
                              userRefs: [widget.story!.userRef!],
                              initialPageName: 'storyDetails',
                              parameterData: {
                                'stories': widget.story,
                              },
                            );
                            logFirebaseEvent('Button_Clear-Text-Fields');
                            setState(() {
                              textController?.clear();
                            });
                            logFirebaseEvent('Button_Backend-Call');

                            final usersUpdateData = {
                              'fizzzCoin': FieldValue.increment(2),
                              'fizzzMonthly': FieldValue.increment(2),
                            };
                            await currentUserReference!.update(usersUpdateData);
                          },
                          text: FFLocalizations.of(context).getText(
                            '6p9t269w' /* Post */,
                          ),
                          options: FFButtonOptions(
                            width: 70,
                            height: 40,
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
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
