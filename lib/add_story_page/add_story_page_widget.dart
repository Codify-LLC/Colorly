import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddStoryPageWidget extends StatefulWidget {
  const AddStoryPageWidget({
    Key? key,
    this.user,
    this.restaurant,
  }) : super(key: key);

  final UsersRecord? user;
  final RestaurantsRecord? restaurant;

  @override
  _AddStoryPageWidgetState createState() => _AddStoryPageWidgetState();
}

class _AddStoryPageWidgetState extends State<AddStoryPageWidget>
    with TickerProviderStateMixin {
  StoriesRecord? restStory;
  String uploadedFileUrl = '';
  TextEditingController? campaignNameController;
  TextEditingController? websiteController;
  TextEditingController? storyDescriptionController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'buttonOnActionTriggerAnimation': AnimationInfo(
      curve: Curves.elasticOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 170,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        scale: 0.8,
        opacity: 0,
      ),
      finalState: AnimationState(
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );

    campaignNameController = TextEditingController();
    websiteController = TextEditingController();
    storyDescriptionController = TextEditingController();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'addStoryPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          websiteController?.text = FFLocalizations.of(context).getText(
            's2xl4pxv' /* https:// */,
          );
        }));
  }

  @override
  void dispose() {
    campaignNameController?.dispose();
    websiteController?.dispose();
    storyDescriptionController?.dispose();
    super.dispose();
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
            logFirebaseEvent('ADD_STORY_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            '862rtn8c' /* Add Story */,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Stack(
                    children: [
                      if (!functions.hasUploadedMedia(uploadedFileUrl))
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.7,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F5F8),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/emptyPost@3x.png',
                              ).image,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x2D000000),
                                offset: Offset(0, 1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      if (functions.hasUploadedMedia(uploadedFileUrl))
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: FlutterFlowMediaDisplay(
                            path: uploadedFileUrl,
                            imageBuilder: (path) => Image.network(
                              path,
                              width: MediaQuery.of(context).size.width,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            videoPlayerBuilder: (path) =>
                                FlutterFlowVideoPlayer(
                              path: path,
                              width: MediaQuery.of(context).size.width,
                              autoPlay: false,
                              looping: true,
                              showControls: true,
                              allowFullScreen: true,
                              allowPlaybackSpeedMenu: false,
                            ),
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 400),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 20, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            height: 90,
                                            constraints: BoxConstraints(
                                              maxWidth: 350,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryDark,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  valueOrDefault<String>(
                                                    widget.restaurant!
                                                        .featuredImage,
                                                    'https://www.gannett-cdn.com/presto/2021/10/13/NETN/9bc08400-29c9-4c37-85e4-6dddeadd331d-sullivans2.jpg',
                                                  ),
                                                ).image,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 2,
                                                  color: Color(0x2E000000),
                                                  offset: Offset(0, 4),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x65000000),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      widget.restaurant!
                                                          .restaurantName!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 40,
                                    fillColor: Color(0x41000000),
                                    icon: Icon(
                                      Icons.close_rounded,
                                      color: Color(0xFFA4A4A4),
                                      size: 20,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'ADD_STORY_close_rounded_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_Navigate-Back');
                                      context.pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: TextFormField(
                      controller: campaignNameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          '5f9uhtv9' /* Campaign Name */,
                        ),
                        hintText: FFLocalizations.of(context).getText(
                          'lok62mpw' /* Campaign Name */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF8B97A2),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryDark,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryDark,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 20, 20, 12),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: TextFormField(
                      controller: websiteController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          '1ft47jdq' /* Website Link */,
                        ),
                        hintText: FFLocalizations.of(context).getText(
                          'ewgvzio4' /* Campaign Name */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF8B97A2),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryDark,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryDark,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 20, 20, 12),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      keyboardType: TextInputType.url,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          FlutterFlowTheme.of(context).primaryDark
                        ],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 1),
                      child: TextFormField(
                        controller: storyDescriptionController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: FFLocalizations.of(context).getText(
                            '3iuuviir' /* Add Comment.... */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryDark,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryDark,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 12),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                        textAlign: TextAlign.start,
                        maxLines: 6,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 50),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'ADD_STORY_Container_xvyzl8fi_ON_TAP');
                          logFirebaseEvent('Container_Upload-Photo-Video');
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            allowPhoto: false,
                            allowVideo: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
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
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            if (downloadUrls.length == selectedMedia.length) {
                              setState(
                                  () => uploadedFileUrl = downloadUrls.first);
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
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.videocam_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  size: 32,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '7y7xkdja' /* Video */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 12,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'ADD_STORY_PAGE_PAGE_ADD_STORY_BTN_ON_TAP');
                            logFirebaseEvent('Button_Backend-Call');

                            final storiesCreateData = createStoriesRecordData(
                              videoUrl: uploadedFileUrl,
                              restRef: widget.restaurant!.reference,
                              comment: storyDescriptionController!.text,
                              linkLearnMore: websiteController!.text,
                              campaignName: campaignNameController!.text,
                              createdTime: getCurrentTimestamp,
                              userRef: currentUserReference,
                              isFlagged: false,
                            );
                            var storiesRecordReference =
                                StoriesRecord.collection.doc();
                            await storiesRecordReference.set(storiesCreateData);
                            restStory = StoriesRecord.getDocumentFromData(
                                storiesCreateData, storiesRecordReference);
                            logFirebaseEvent('Button_Navigate-To');

                            context.pushNamed(
                              'storySuccess',
                              queryParams: {
                                'story': serializeParam(
                                    restStory, ParamType.Document),
                                'restaurant': serializeParam(
                                    widget.restaurant, ParamType.Document),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'story': restStory,
                                'restaurant': widget.restaurant,
                              },
                            );

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'ii9wvyqr' /* Add Story */,
                          ),
                          options: FFButtonOptions(
                            width: 140,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                    ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ).animated(
                            [animationsMap['buttonOnActionTriggerAnimation']!]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
