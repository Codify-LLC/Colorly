import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditDraftWidget extends StatefulWidget {
  const EditDraftWidget({
    Key? key,
    this.restaurant,
    this.postDraft,
    this.restRef,
  }) : super(key: key);

  final RestaurantsRecord? restaurant;
  final PostDraftsRecord? postDraft;
  final DocumentReference? restRef;

  @override
  _EditDraftWidgetState createState() => _EditDraftWidgetState();
}

class _EditDraftWidgetState extends State<EditDraftWidget> {
  String uploadedFileUrl1 = '';
  String uploadedFileUrl2 = '';
  TextEditingController? textController;
  double? ratingBarValue;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.postDraft!.description);
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).tertiaryColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'bxhkye54' /* Edit Review */,
                    ),
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '1yoiu20u' /* Rate the restaurant below. */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('EDIT_DRAFT_COMP_SAVE_BTN_ON_TAP');
                      logFirebaseEvent('Button_Backend-Call');

                      final postDraftsUpdateData = createPostDraftsRecordData(
                        userRating: ratingBarValue,
                        restaurantName: '',
                        createdAt: getCurrentTimestamp,
                        description: textController!.text,
                      );
                      await widget.postDraft!.reference
                          .update(postDraftsUpdateData);
                    },
                    text: FFLocalizations.of(context).getText(
                      'w0nlzz6a' /* Save */,
                    ),
                    options: FFButtonOptions(
                      width: 90,
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
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '8mr04s2x' /* What would you rate this resta... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: RatingBar.builder(
                onRatingUpdate: (newValue) =>
                    setState(() => ratingBarValue = newValue),
                itemBuilder: (context, index) => Icon(
                  Icons.star_rounded,
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
                direction: Axis.horizontal,
                initialRating: ratingBarValue ??= widget.postDraft!.userRating!,
                unratedColor: Color(0xFFA4A4A4),
                itemCount: 5,
                itemPadding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                itemSize: 40,
                glowColor: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.94,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 20),
                                  child: TextFormField(
                                    controller: textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        't11msa19' /* Share your experience.... */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF8B97A2),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 32, 20, 12),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF090F13),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    textAlign: TextAlign.start,
                                    maxLines: 6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: FlutterFlowVideoPlayer(
                                    path: uploadedFileUrl1,
                                    videoType: VideoType.network,
                                    width: 108,
                                    height: 192,
                                    autoPlay: false,
                                    looping: false,
                                    showControls: true,
                                    allowFullScreen: false,
                                    allowPlaybackSpeedMenu: false,
                                  ),
                                ),
                                FlutterFlowVideoPlayer(
                                  path: widget.postDraft!.videoUrl!,
                                  videoType: VideoType.network,
                                  width: 108,
                                  height: 192,
                                  autoPlay: false,
                                  looping: false,
                                  showControls: true,
                                  allowFullScreen: false,
                                  allowPlaybackSpeedMenu: false,
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18, 0, 0, 0),
                                  child: FlutterFlowMediaDisplay(
                                    path: valueOrDefault<String>(
                                      widget.postDraft!.videoThumbnail,
                                      'http://colorly.app/wp-content/uploads/2021/08/OQaOKP_t20_g8wmld.jpg',
                                    ),
                                    imageBuilder: (path) => ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        path,
                                        width: 192,
                                        height: 192,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    videoPlayerBuilder: (path) =>
                                        FlutterFlowVideoPlayer(
                                      path: path,
                                      width: 300,
                                      autoPlay: true,
                                      looping: true,
                                      showControls: true,
                                      allowFullScreen: true,
                                      allowPlaybackSpeedMenu: false,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18, 0, 0, 0),
                                  child: FlutterFlowMediaDisplay(
                                    path: uploadedFileUrl2,
                                    imageBuilder: (path) => ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        path,
                                        width: 192,
                                        height: 192,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    videoPlayerBuilder: (path) =>
                                        FlutterFlowVideoPlayer(
                                      path: path,
                                      width: 300,
                                      autoPlay: true,
                                      looping: true,
                                      showControls: true,
                                      allowFullScreen: true,
                                      allowPlaybackSpeedMenu: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: FaIcon(
                                  FontAwesomeIcons.solidEdit,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'EDIT_DRAFT_COMP_solidEdit_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_Upload-Photo-Video');
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: false,
                                    allowVideo: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    final downloadUrls = (await Future.wait(
                                            selectedMedia.map((m) async =>
                                                await uploadData(
                                                    m.storagePath, m.bytes))))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    if (downloadUrls.length ==
                                        selectedMedia.length) {
                                      setState(() => uploadedFileUrl1 =
                                          downloadUrls.first);
                                      showUploadMessage(
                                        context,
                                        'Success!',
                                      );
                                    } else {
                                      showUploadMessage(
                                        context,
                                        'Failed to upload media',
                                      );
                                      return;
                                    }
                                  }

                                  logFirebaseEvent('IconButton_Backend-Call');

                                  final postDraftsUpdateData =
                                      createPostDraftsRecordData(
                                    videoUrl: uploadedFileUrl1,
                                  );
                                  await widget.postDraft!.reference
                                      .update(postDraftsUpdateData);
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(110, 0, 0, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: FaIcon(
                                  FontAwesomeIcons.solidEdit,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'EDIT_DRAFT_COMP_solidEdit_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_Upload-Photo-Video');
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    final downloadUrls = (await Future.wait(
                                            selectedMedia.map((m) async =>
                                                await uploadData(
                                                    m.storagePath, m.bytes))))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    if (downloadUrls.length ==
                                        selectedMedia.length) {
                                      setState(() => uploadedFileUrl2 =
                                          downloadUrls.first);
                                      showUploadMessage(
                                        context,
                                        'Success!',
                                      );
                                    } else {
                                      showUploadMessage(
                                        context,
                                        'Failed to upload media',
                                      );
                                      return;
                                    }
                                  }

                                  logFirebaseEvent('IconButton_Backend-Call');

                                  final postDraftsUpdateData =
                                      createPostDraftsRecordData(
                                    videoThumbnail: uploadedFileUrl2,
                                  );
                                  await widget.postDraft!.reference
                                      .update(postDraftsUpdateData);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('EDIT_DRAFT_COMP_POST_REVIEW_BTN_ON_TAP');
                  logFirebaseEvent('Button_Backend-Call');

                  final postsCreateData = createPostsRecordData(
                    user: currentUserReference,
                    videoUrl: widget.postDraft!.videoUrl,
                    restRef: widget.postDraft!.restRef,
                    description: textController!.text,
                    userRating: ratingBarValue,
                    videoThumbnail: widget.postDraft!.videoThumbnail,
                    createdAt: getCurrentTimestamp,
                    isFlagged: false,
                    postLocation: widget.restaurant!.restLatLong,
                    numComments: 0,
                    attribute1: widget.postDraft!.attribute1,
                    attribute2: widget.postDraft!.attribute2,
                    attribute3: widget.postDraft!.attribute3,
                  );
                  await PostsRecord.collection.doc().set(postsCreateData);
                  logFirebaseEvent('Button_Backend-Call');
                  await widget.postDraft!.reference.delete();
                  logFirebaseEvent('Button_Backend-Call');

                  final restaurantsUpdateData = {
                    'reviews': FieldValue.increment(1),
                  };
                  await widget.restaurant!.reference
                      .update(restaurantsUpdateData);
                  logFirebaseEvent('Button_Backend-Call');

                  final usersUpdateData = {
                    'fizzzCoin': FieldValue.increment(20),
                    'fizzzMonthly': FieldValue.increment(20),
                  };
                  await currentUserReference!.update(usersUpdateData);
                  logFirebaseEvent('Button_Navigate-To');

                  context.pushNamed(
                    'reviewRating',
                    queryParams: {
                      'restaurant':
                          serializeParam(widget.restaurant, ParamType.Document),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'restaurant': widget.restaurant,
                    },
                  );

                  logFirebaseEvent('Button_Trigger-Push-Notification');
                  triggerPushNotification(
                    notificationTitle: 'You have a new review ⭐',
                    notificationText:
                        '${currentUserDisplayName} posted a video review of your restaurant',
                    notificationImageUrl: currentUserPhoto,
                    notificationSound: 'default',
                    userRefs: [widget.restaurant!.userConnection!],
                    initialPageName: 'restaurantDetails',
                    parameterData: {
                      'restaurant': widget.restaurant!.reference,
                    },
                  );
                  logFirebaseEvent('Button_Navigate-Back');
                  context.pop();
                },
                text: FFLocalizations.of(context).getText(
                  'bh4asap6' /* Post Review */,
                ),
                icon: Icon(
                  Icons.star_outline_rounded,
                  size: 15,
                ),
                options: FFButtonOptions(
                  width: 270,
                  height: 50,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                  elevation: 2,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
