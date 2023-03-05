import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_comments_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comments_copy_model.dart';
export 'comments_copy_model.dart';

class CommentsCopyWidget extends StatefulWidget {
  const CommentsCopyWidget({
    Key? key,
    this.story,
    this.post,
  }) : super(key: key);

  final StoriesRecord? story;
  final PostsRecord? post;

  @override
  _CommentsCopyWidgetState createState() => _CommentsCopyWidgetState();
}

class _CommentsCopyWidgetState extends State<CommentsCopyWidget> {
  late CommentsCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentsCopyModel());

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 525.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(2.0),
          bottomRight: Radius.circular(2.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(2.0),
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional(0.0, 1.0),
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StreamBuilder<PostsRecord>(
                          stream:
                              PostsRecord.getDocument(widget.post!.reference),
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
                            final columnPostsRecord = snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 12.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 60.0,
                                          height: 4.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xABFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'iybxfe74' /* Comments */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title3
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                          height: 390.0,
                                          decoration: BoxDecoration(),
                                          child: StreamBuilder<
                                              List<PostCommentsRecord>>(
                                            stream: queryPostCommentsRecord(
                                              queryBuilder: (postCommentsRecord) =>
                                                  postCommentsRecord
                                                      .where('post',
                                                          isEqualTo:
                                                              columnPostsRecord
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
                                                    width: 30.0,
                                                    height: 30.0,
                                                    child: SpinKitThreeBounce(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<PostCommentsRecord>
                                                  listViewPostCommentsRecordList =
                                                  snapshot.data!;
                                              if (listViewPostCommentsRecordList
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
                                                    listViewPostCommentsRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewPostCommentsRecord =
                                                      listViewPostCommentsRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: StreamBuilder<
                                                        UsersRecord>(
                                                      stream: UsersRecord
                                                          .getDocument(
                                                              listViewPostCommentsRecord
                                                                  .user!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              child:
                                                                  SpinKitThreeBounce(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final commentUsersRecord =
                                                            snapshot.data!;
                                                        return InkWell(
                                                          onLongPress:
                                                              () async {
                                                            logFirebaseEvent(
                                                                'COMMENTS_COPY_COMP_comment_ON_LONG_PRESS');
                                                            if (valueOrDefault<
                                                                    bool>(
                                                                currentUserDocument
                                                                    ?.superAdmin,
                                                                false)) {
                                                              logFirebaseEvent(
                                                                  'comment_alert_dialog');
                                                              var confirmDialogResponse =
                                                                  await showDialog<
                                                                          bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Confirm'),
                                                                            content:
                                                                                Text('Are you sure you want to delete this comment?'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                child: Text('Cancel'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                child: Text('Confirm'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ) ??
                                                                      false;
                                                              if (confirmDialogResponse) {
                                                                logFirebaseEvent(
                                                                    'comment_navigate_back');
                                                                context.pop();
                                                              }
                                                              logFirebaseEvent(
                                                                  'comment_backend_call');

                                                              final postCommentsUpdateData =
                                                                  createPostCommentsRecordData(
                                                                deleted: true,
                                                              );
                                                              await listViewPostCommentsRecord
                                                                  .reference
                                                                  .update(
                                                                      postCommentsUpdateData);
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          12.0,
                                                                          8.0,
                                                                          12.0),
                                                              child: InkWell(
                                                                onLongPress:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'COMMENTS_COPY_Row_yqohjfme_ON_LONG_PRESS');
                                                                  if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.superAdmin,
                                                                      false)) {
                                                                    logFirebaseEvent(
                                                                        'Row_alert_dialog');
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Confirm'),
                                                                                  content: Text('Do you wan to delete this comment?'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Confirm'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      logFirebaseEvent(
                                                                          'Row_navigate_back');
                                                                      context
                                                                          .pop();
                                                                    }
                                                                    logFirebaseEvent(
                                                                        'Row_backend_call');

                                                                    final postCommentsUpdateData1 =
                                                                        createPostCommentsRecordData(
                                                                      deleted:
                                                                          true,
                                                                    );
                                                                    await listViewPostCommentsRecord
                                                                        .reference
                                                                        .update(
                                                                            postCommentsUpdateData1);
                                                                  }
                                                                  if (commentUsersRecord
                                                                          .reference ==
                                                                      currentUserReference) {
                                                                    logFirebaseEvent(
                                                                        'Row_backend_call');

                                                                    final postCommentsUpdateData2 =
                                                                        createPostCommentsRecordData(
                                                                      deleted:
                                                                          true,
                                                                    );
                                                                    await listViewPostCommentsRecord
                                                                        .reference
                                                                        .update(
                                                                            postCommentsUpdateData2);
                                                                    logFirebaseEvent(
                                                                        'Row_backend_call');

                                                                    final usersUpdateData =
                                                                        {
                                                                      'fizzzCoin':
                                                                          FieldValue.increment(
                                                                              -1),
                                                                    };
                                                                    await currentUserReference!
                                                                        .update(
                                                                            usersUpdateData);
                                                                  }
                                                                },
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'COMMENTS_COPY_CircleImage_tjkrclw7_ON_TA');
                                                                        logFirebaseEvent(
                                                                            'CircleImage_navigate_to');

                                                                        context
                                                                            .pushNamed(
                                                                          'viewProfileOther',
                                                                          queryParams:
                                                                              {
                                                                            'otherUser':
                                                                                serializeParam(
                                                                              commentUsersRecord.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          imageUrl:
                                                                              valueOrDefault<String>(
                                                                            commentUsersRecord.photoUrl,
                                                                            'https://p1.pxfuel.com/preview/828/149/229/indistinct-blurred-pineapple-rough.jpg',
                                                                          ),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              commentUsersRecord.displayName!,
                                                                              style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Lexend Deca',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                listViewPostCommentsRecord.comment!,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '818x7txx' /* Posted */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Lexend Deca',
                                                                                            color: Color(0xFFA4A4A4),
                                                                                            fontSize: 12.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    dateTimeFormat(
                                                                                      'relative',
                                                                                      listViewPostCommentsRecord.timePosted!,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                          fontFamily: 'Lexend Deca',
                                                                                          color: Color(0xFFA4A4A4),
                                                                                          fontSize: 12.0,
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
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3.0,
                        color: Color(0x3A000000),
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 0.0, 4.0),
                          child: TextFormField(
                            controller: _model.textController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'jhwb7epu' /* Comment here... */,
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
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
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
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'COMMENTS_COPY_COMP_POST_BTN_ON_TAP');
                            logFirebaseEvent('Button_backend_call');

                            final postCommentsCreateData =
                                createPostCommentsRecordData(
                              comment: _model.textController.text,
                              timePosted: getCurrentTimestamp,
                              deleted: false,
                              post: widget.post!.reference,
                              user: currentUserReference,
                            );
                            await PostCommentsRecord.collection
                                .doc()
                                .set(postCommentsCreateData);
                            logFirebaseEvent('Button_backend_call');

                            final postsUpdateData = {
                              'num_comments': FieldValue.increment(1),
                            };
                            await widget.post!.reference
                                .update(postsUpdateData);
                            logFirebaseEvent('Button_clear_text_fields');
                            setState(() {
                              _model.textController?.clear();
                            });
                            logFirebaseEvent('Button_backend_call');

                            final usersUpdateData = {
                              'fizzzCoin': FieldValue.increment(2),
                              'fizzzMonthly': FieldValue.increment(2),
                            };
                            await currentUserReference!.update(usersUpdateData);
                          },
                          text: FFLocalizations.of(context).getText(
                            'jbfe5eab' /* Post */,
                          ),
                          options: FFButtonOptions(
                            width: 70.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
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
