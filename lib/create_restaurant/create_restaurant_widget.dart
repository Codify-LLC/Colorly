import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../flutter_flow/upload_media.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateRestaurantWidget extends StatefulWidget {
  const CreateRestaurantWidget({Key? key}) : super(key: key);

  @override
  _CreateRestaurantWidgetState createState() => _CreateRestaurantWidgetState();
}

class _CreateRestaurantWidgetState extends State<CreateRestaurantWidget> {
  String uploadedFileUrl1 = '';
  String uploadedFileUrl2 = '';
  var placePickerValue = FFPlace();
  TextEditingController? restNameController;
  TextEditingController? textFieldnumController;
  TextEditingController? restAdressController;
  TextEditingController? categoriesController;
  TextEditingController? textController5;
  TextEditingController? websiteController;
  TextEditingController? textController7;
  String? choiceChipsValue;
  TextEditingController? videoTouController;
  TextEditingController? onlineOrderLinkController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    categoriesController = TextEditingController();
    restAdressController =
        TextEditingController(text: placePickerValue.address);
    restNameController = TextEditingController(text: placePickerValue.name);
    textFieldnumController = TextEditingController();
    textController5 = TextEditingController();
    websiteController = TextEditingController();
    textController7 = TextEditingController();
    videoTouController = TextEditingController();
    onlineOrderLinkController = TextEditingController();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createRestaurant'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          websiteController?.text = FFLocalizations.of(context).getText(
            'oi9suiwy' /* https:// */,
          );
        }));
  }

  @override
  void dispose() {
    categoriesController?.dispose();
    restAdressController?.dispose();
    restNameController?.dispose();
    textFieldnumController?.dispose();
    textController5?.dispose();
    websiteController?.dispose();
    textController7?.dispose();
    videoTouController?.dispose();
    onlineOrderLinkController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryDark,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            logFirebaseEvent('CREATE_RESTAURANT_Icon_64j3vr9z_ON_TAP');
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
            'm4aqp0ul' /* Create Restaurant */,
          ),
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).tertiaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryDark,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'q4ah7ip8' /* Upload Your Logo Below */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontSize: 22,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.add_box_outlined,
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                size: 30,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CREATE_RESTAURANT_add_box_outlined_ICN_O');
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
                                    setState(() =>
                                        uploadedFileUrl1 = downloadUrls.first);
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
                            ),
                            Stack(
                              children: [
                                FlutterFlowMediaDisplay(
                                  path: valueOrDefault<String>(
                                    uploadedFileUrl1,
                                    'https://assets.bonappetit.com/photos/610aa6ddc50e2f9f7c42f7f8/master/pass/Savage-2019-top-50-busy-restaurant.jpg',
                                  ),
                                  imageBuilder: (path) => ClipRRect(
                                    borderRadius: BorderRadius.circular(999),
                                    child: Image.network(
                                      path,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  videoPlayerBuilder: (path) =>
                                      FlutterFlowVideoPlayer(
                                    path: path,
                                    width: 300,
                                    autoPlay: false,
                                    looping: true,
                                    showControls: true,
                                    allowFullScreen: true,
                                    allowPlaybackSpeedMenu: false,
                                  ),
                                ),
                                if (functions
                                    .hasUploadedMedia(uploadedFileUrl1))
                                  FlutterFlowMediaDisplay(
                                    path: valueOrDefault<String>(
                                      uploadedFileUrl1,
                                      'https://assets.bonappetit.com/photos/610aa6ddc50e2f9f7c42f7f8/master/pass/Savage-2019-top-50-busy-restaurant.jpg',
                                    ),
                                    imageBuilder: (path) => ClipRRect(
                                      borderRadius: BorderRadius.circular(999),
                                      child: Image.network(
                                        path,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    videoPlayerBuilder: (path) =>
                                        FlutterFlowVideoPlayer(
                                      path: path,
                                      width: 300,
                                      autoPlay: false,
                                      looping: true,
                                      showControls: true,
                                      allowFullScreen: true,
                                      allowPlaybackSpeedMenu: false,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'm49bkrur' /* Upload a Featured Image */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontSize: 22,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.add_box_outlined,
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                size: 30,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CREATE_RESTAURANT_add_box_outlined_ICN_O');
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
                                    setState(() =>
                                        uploadedFileUrl2 = downloadUrls.first);
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
                            ),
                            Stack(
                              children: [
                                FlutterFlowMediaDisplay(
                                  path: valueOrDefault<String>(
                                    uploadedFileUrl2,
                                    'https://assets.bonappetit.com/photos/610aa6ddc50e2f9f7c42f7f8/master/pass/Savage-2019-top-50-busy-restaurant.jpg',
                                  ),
                                  imageBuilder: (path) => ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      path,
                                      width: 200,
                                      height: 225,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  videoPlayerBuilder: (path) =>
                                      FlutterFlowVideoPlayer(
                                    path: path,
                                    width: 200,
                                    height: 225,
                                    autoPlay: false,
                                    looping: false,
                                    showControls: true,
                                    allowFullScreen: true,
                                    allowPlaybackSpeedMenu: false,
                                  ),
                                ),
                                if (functions
                                    .hasUploadedMedia(uploadedFileUrl2))
                                  FlutterFlowMediaDisplay(
                                    path: valueOrDefault<String>(
                                      uploadedFileUrl2,
                                      'https://assets.bonappetit.com/photos/610aa6ddc50e2f9f7c42f7f8/master/pass/Savage-2019-top-50-busy-restaurant.jpg',
                                    ),
                                    imageBuilder: (path) => ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        path,
                                        width: 200,
                                        height: 225,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    videoPlayerBuilder: (path) =>
                                        FlutterFlowVideoPlayer(
                                      path: path,
                                      width: 200,
                                      height: 225,
                                      autoPlay: false,
                                      looping: false,
                                      showControls: true,
                                      allowFullScreen: true,
                                      allowPlaybackSpeedMenu: false,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(12, 10, 12, 10),
                          child: FlutterFlowPlacePicker(
                            iOSGoogleMapsApiKey:
                                'AIzaSyBH1fZaBJ0aBUx4Y6fjsVaEs6cD9FhYgow',
                            androidGoogleMapsApiKey:
                                'AIzaSyB8YLpQ-pVGaEOSZEfaoDBbniyzNHREMP0',
                            webGoogleMapsApiKey:
                                'AIzaSyCI7LeCn7jPdiTPwKiLhn6xMxPlcLevReM',
                            onSelect: (place) async {
                              setState(() => placePickerValue = place);
                            },
                            defaultText: FFLocalizations.of(context).getText(
                              'ny252bxp' /* Restaurant Location */,
                            ),
                            icon: Icon(
                              Icons.place,
                              color: Color(0xFF95A1AC),
                              size: 16,
                            ),
                            buttonOptions: FFButtonOptions(
                              width: double.infinity,
                              height: 50,
                              color: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 4,
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: restNameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '920ihtwt' /* Restaurant Name */,
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
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: textFieldnumController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'hbwj1ny2' /*  Phone Number */,
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
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: restAdressController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '79wtku8q' /* Restaurant Address */,
                                    ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'c757h358' /* 123 Main St, Indianapolis, IN,... */,
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
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: categoriesController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'thre1ol2' /* Categories */,
                                    ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '1za6whdp' /* Japanese, Asian Fusion, Sushi.... */,
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
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: textController5,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'ol6w6pja' /* Slogan */,
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
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: websiteController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'jyzbt1t4' /* Website */,
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
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  keyboardType: TextInputType.url,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: textController7,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '0wwjmo7i' /* About Your Restaurant */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
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
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'w7zun1qs' /* What is your restaurants 
affo... */
                                      ,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          fontSize: 22,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FlutterFlowChoiceChips(
                                  initiallySelected: [
                                    if (choiceChipsValue != null)
                                      choiceChipsValue!
                                  ],
                                  options: [
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                      'bms5bnpg' /* $ */,
                                    )),
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                      'b6toq6b8' /* $$ */,
                                    )),
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                      '4ur5li9p' /* $$$ */,
                                    )),
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                      'g1kf6tib' /* $$$$ */,
                                    ))
                                  ],
                                  onChanged: (val) => setState(
                                      () => choiceChipsValue = val?.first),
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: videoTouController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '7bp19hcg' /* Video Tour Link */,
                                    ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '7kvy9a37' /* https:// */,
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
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: onlineOrderLinkController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      't5wkqxsy' /* Online Order Link */,
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
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 30),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('CREATE_RESTAURANT_CREATE_RESTAURANT_BTN_');
                  logFirebaseEvent('Button_Backend-Call');

                  final restaurantsCreateData = createRestaurantsRecordData(
                    restaurantName: restNameController!.text,
                    logo: uploadedFileUrl1,
                    featuredImage: uploadedFileUrl2,
                    restLatLong: placePickerValue.latLng,
                    city: placePickerValue.city,
                    website: websiteController!.text,
                    priceRange: choiceChipsValue,
                    email: '',
                    restSlogan: textController5!.text,
                    restAddress: placePickerValue.address,
                    restDescription: textController7!.text,
                    categories: categoriesController!.text,
                    phoneNumber: textFieldnumController!.text,
                    onlineOrderLink: onlineOrderLinkController!.text,
                    videoTour: videoTouController!.text,
                  );
                  await RestaurantsRecord.collection
                      .doc()
                      .set(restaurantsCreateData);
                  logFirebaseEvent('Button_Alert-Dialog');
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Confirm'),
                            content: Text(
                                'Are you sure you want to make these changes?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    logFirebaseEvent('Button_Navigate-Back');
                    context.pop();
                  }
                },
                text: FFLocalizations.of(context).getText(
                  '3n2odx5c' /* Create Restaurant */,
                ),
                icon: Icon(
                  Icons.add_rounded,
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                  size: 24,
                ),
                options: FFButtonOptions(
                  width: 270,
                  height: 60,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 3,
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
