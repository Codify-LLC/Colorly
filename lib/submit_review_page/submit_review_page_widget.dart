import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
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
import 'package:google_fonts/google_fonts.dart';

class SubmitReviewPageWidget extends StatefulWidget {
  const SubmitReviewPageWidget({
    Key? key,
    this.restaurant,
  }) : super(key: key);

  final RestaurantsRecord? restaurant;

  @override
  _SubmitReviewPageWidgetState createState() => _SubmitReviewPageWidgetState();
}

class _SubmitReviewPageWidgetState extends State<SubmitReviewPageWidget> {
  TextEditingController? textController;

  ApiCallResponse? videoUrlMux;
  String uploadedFileUrl1 = '';
  String uploadedFileUrl2 = '';
  double? ratingBarValue;
  String? choiceChipsValue1;
  String? choiceChipsValue2;
  String? choiceChipsValue3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'submitReviewPage'});
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RestaurantsRecord>(
      stream: RestaurantsRecord.getDocument(widget.restaurant!.reference),
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
        final submitReviewPageRestaurantsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryDark,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                logFirebaseEvent('SUBMIT_REVIEW_Icon_srp0pn7j_ON_TAP');
                logFirebaseEvent('Icon_Navigate-Back');
                context.pop();
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).tertiaryColor,
                size: 24,
              ),
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'aooe24t4' /* Rate Restaurant */,
              ),
              style: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            actions: [
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('SUBMIT_REVIEW_PAGE_PAGE_SAVE_BTN_ON_TAP');
                  logFirebaseEvent('Button_Backend-Call');

                  final postDraftsCreateData = createPostDraftsRecordData(
                    user: currentUserReference,
                    videoUrl: uploadedFileUrl1,
                    restRef: widget.restaurant!.reference,
                    description: textController!.text,
                    userRating: ratingBarValue,
                    videoThumbnail: uploadedFileUrl2,
                    createdAt: getCurrentTimestamp,
                    isFlagged: false,
                    postLocation: widget.restaurant!.restLatLong,
                    numComments: 0,
                    attribute1: choiceChipsValue1,
                    attribute2: choiceChipsValue2,
                    attribute3: choiceChipsValue3,
                  );
                  await PostDraftsRecord.collection
                      .doc()
                      .set(postDraftsCreateData);
                  logFirebaseEvent('Button_Navigate-To');

                  context.pushNamed('userProfile');
                },
                text: FFLocalizations.of(context).getText(
                  'e0rps9aq' /* Save */,
                ),
                options: FFButtonOptions(
                  width: 90,
                  height: 30,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
            ],
            centerTitle: false,
            elevation: 4,
          ),
          backgroundColor: Color(0xFFF5F5F5),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.9,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'm3i5c13r' /* Rate the restaurant below. */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 90,
                                  constraints: BoxConstraints(
                                    maxWidth: 350,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryDark,
                                    image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: Image.network(
                                        widget.restaurant!.featuredImage!,
                                      ).image,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Color(0x2E000000),
                                        offset: Offset(0, 4),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0x65000000),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.restaurant!.restaurantName!,
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                  fontFamily: 'Lexend Deca',
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
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '79cs9tfx' /* What would you rate this resta... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: RatingBar.builder(
                              onRatingUpdate: (newValue) =>
                                  setState(() => ratingBarValue = newValue),
                              itemBuilder: (context, index) => Icon(
                                Icons.star_rounded,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                              direction: Axis.horizontal,
                              initialRating: ratingBarValue ??= 5,
                              unratedColor: Color(0xFFA4A4A4),
                              itemCount: 5,
                              itemPadding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                              itemSize: 40,
                              glowColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.94,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 20),
                                                child: TextFormField(
                                                  controller: textController,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'ryslhhgi' /* Share your experience.... */,
                                                    ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF8B97A2),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFDBE2E7),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFDBE2E7),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 32, 20, 12),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF090F13),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 6,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'b7qde5sf' /* **WAIT FOR YOUR UPLOADS TO APP... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFFB11B1B),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FontStyle.italic,
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 20, 0),
                                                child: FlutterFlowMediaDisplay(
                                                  path: uploadedFileUrl1,
                                                  imageBuilder: (path) =>
                                                      Image.network(
                                                    path,
                                                    width: 108,
                                                    height: 192,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  videoPlayerBuilder: (path) =>
                                                      FlutterFlowVideoPlayer(
                                                    path: path,
                                                    width: 108,
                                                    height: 192,
                                                    autoPlay: false,
                                                    looping: true,
                                                    showControls: true,
                                                    allowFullScreen: true,
                                                    allowPlaybackSpeedMenu:
                                                        false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(18, 0, 0, 0),
                                                child: FlutterFlowMediaDisplay(
                                                  path: valueOrDefault<String>(
                                                    uploadedFileUrl2,
                                                    'http://colorly.app/wp-content/uploads/2021/08/OQaOKP_t20_g8wmld.jpg',
                                                  ),
                                                  imageBuilder: (path) =>
                                                      ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
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
                                                    allowPlaybackSpeedMenu:
                                                        false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'SUBMIT_REVIEW_Container_n3khth3r_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Container_Upload-Photo-Video');
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      allowPhoto: false,
                                                      allowVideo: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      showUploadMessage(
                                                        context,
                                                        'Uploading file...',
                                                        showLoading: true,
                                                      );
                                                      final downloadUrls = (await Future
                                                              .wait(selectedMedia
                                                                  .map((m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes))))
                                                          .where((u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .hideCurrentSnackBar();
                                                      if (downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                        setState(() =>
                                                            uploadedFileUrl1 =
                                                                downloadUrls
                                                                    .first);
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

                                                    logFirebaseEvent(
                                                        'Container_Backend-Call');
                                                    videoUrlMux =
                                                        await MuxVideoCall.call(
                                                      videoUrl:
                                                          uploadedFileUrl1,
                                                    );

                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    width: 108,
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryDark,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/upload_video.png',
                                                      height: 150,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 6, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SUBMIT_REVIEW_Container_f1chj3rm_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_Upload-Photo-Video');
                                                      final selectedMedia =
                                                          await selectMediaWithSourceBottomSheet(
                                                        context: context,
                                                        maxWidth: 1000.00,
                                                        maxHeight: 1000.00,
                                                        allowPhoto: true,
                                                      );
                                                      if (selectedMedia !=
                                                              null &&
                                                          selectedMedia.every((m) =>
                                                              validateFileFormat(
                                                                  m.storagePath,
                                                                  context))) {
                                                        showUploadMessage(
                                                          context,
                                                          'Uploading file...',
                                                          showLoading: true,
                                                        );
                                                        final downloadUrls = (await Future.wait(
                                                                selectedMedia.map((m) async =>
                                                                    await uploadData(
                                                                        m.storagePath,
                                                                        m.bytes))))
                                                            .where((u) => u != null)
                                                            .map((u) => u!)
                                                            .toList();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        if (downloadUrls
                                                                .length ==
                                                            selectedMedia
                                                                .length) {
                                                          setState(() =>
                                                              uploadedFileUrl2 =
                                                                  downloadUrls
                                                                      .first);
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
                                                      width: 200,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryDark,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/upload_thimbnail.png',
                                                        height: 150,
                                                        fit: BoxFit.fitHeight,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 10),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'wthsk39m' /* Tell us what was great about t... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '682la1ai' /* 1.  */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Expanded(
                                  child: FlutterFlowChoiceChips(
                                    initiallySelected: [
                                      if (choiceChipsValue1 != null)
                                        choiceChipsValue1!
                                    ],
                                    options: [
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'ym7v3235' /* Amazing Food */,
                                      )),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        '1mys4ovu' /* Very Diverse */,
                                      )),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'ldbpqzev' /* Highly Reccommend */,
                                      ))
                                    ],
                                    onChanged: (val) => setState(
                                        () => choiceChipsValue1 = val?.first),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                          ),
                                      iconColor: Colors.white,
                                      iconSize: 18,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 10, 0),
                                      elevation: 4,
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF262D34),
                                          ),
                                      iconColor: Color(0xFF262D34),
                                      iconSize: 18,
                                      elevation: 4,
                                    ),
                                    chipSpacing: 10,
                                    multiselect: false,
                                    alignment: WrapAlignment.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'v69f4fn6' /* 2.  */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Expanded(
                                  child: FlutterFlowChoiceChips(
                                    initiallySelected: [
                                      if (choiceChipsValue2 != null)
                                        choiceChipsValue2!
                                    ],
                                    options: [
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'yu34o0di' /* Inclusive */,
                                      )),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'g6optee3' /* Friendly */,
                                      )),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'cgi2tfsu' /* Vibing Atmosphere */,
                                      ))
                                    ],
                                    onChanged: (val) => setState(
                                        () => choiceChipsValue2 = val?.first),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                          ),
                                      iconColor: Colors.white,
                                      iconSize: 18,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 10, 0),
                                      elevation: 4,
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF262D34),
                                          ),
                                      iconColor: Color(0xFF262D34),
                                      iconSize: 18,
                                      elevation: 4,
                                    ),
                                    chipSpacing: 10,
                                    multiselect: false,
                                    alignment: WrapAlignment.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'lxskeryn' /* 3.  */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Expanded(
                                  child: FlutterFlowChoiceChips(
                                    initiallySelected: [
                                      if (choiceChipsValue3 != null)
                                        choiceChipsValue3!
                                    ],
                                    options: [
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'zrnvazp4' /* Great Service */,
                                      )),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'g4efn03p' /* Quick  */,
                                      )),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'oj80bztc' /* Very Comfortable */,
                                      ))
                                    ],
                                    onChanged: (val) => setState(
                                        () => choiceChipsValue3 = val?.first),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                          ),
                                      iconColor: Colors.white,
                                      iconSize: 18,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 10, 0),
                                      elevation: 4,
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF262D34),
                                          ),
                                      iconColor: Color(0xFF262D34),
                                      iconSize: 18,
                                      elevation: 4,
                                    ),
                                    chipSpacing: 10,
                                    multiselect: false,
                                    alignment: WrapAlignment.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 30, 0, 40),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'SUBMIT_REVIEW_SUBMIT_RATING_BTN_ON_TAP');
                                logFirebaseEvent('Button_Backend-Call');

                                final postsCreateData = createPostsRecordData(
                                  user: currentUserReference,
                                  videoUrl: uploadedFileUrl1,
                                  restRef: widget.restaurant!.reference,
                                  description: textController!.text,
                                  userRating: ratingBarValue,
                                  videoThumbnail: uploadedFileUrl2,
                                  createdAt: getCurrentTimestamp,
                                  isFlagged: false,
                                  postLocation: widget.restaurant!.restLatLong,
                                  numComments: 0,
                                  attribute1: choiceChipsValue1,
                                  attribute2: choiceChipsValue2,
                                  attribute3: choiceChipsValue3,
                                );
                                await PostsRecord.collection
                                    .doc()
                                    .set(postsCreateData);
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
                                  'reviews': FieldValue.increment(1),
                                };
                                await currentUserReference!
                                    .update(usersUpdateData);
                                logFirebaseEvent('Button_Navigate-To');

                                context.pushNamed(
                                  'reviewRating',
                                  queryParams: {
                                    'restaurant': serializeParam(
                                        widget.restaurant, ParamType.Document),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'restaurant': widget.restaurant,
                                  },
                                );

                                logFirebaseEvent(
                                    'Button_Trigger-Push-Notification');
                                triggerPushNotification(
                                  notificationTitle: 'You have a new review ⭐',
                                  notificationText:
                                      '${currentUserDisplayName} posted a video review of your restaurant',
                                  notificationImageUrl: currentUserPhoto,
                                  userRefs: [
                                    widget.restaurant!.userConnection!
                                  ],
                                  initialPageName: 'restaurantDetails',
                                  parameterData: {
                                    'restaurant': widget.restaurant!.reference,
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'kvhuof3u' /* Submit Rating */,
                              ),
                              icon: Icon(
                                Icons.star_outline_rounded,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 270,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
