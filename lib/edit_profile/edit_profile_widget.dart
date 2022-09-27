import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../flutter_flow/upload_media.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final UsersRecord? user;

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  String uploadedFileUrl = '';
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  var placePickerValue = FFPlace();
  TextEditingController? textController5;
  bool? switchListTileValue1;
  TextEditingController? textController6;
  bool? switchListTileValue2;
  TextEditingController? textController7;
  bool? switchListTileValue3;
  TextEditingController? textController8;
  bool? switchListTileValue4;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'editProfile'});
    textController1 = TextEditingController(text: widget.user!.displayName);
    textController2 = TextEditingController(text: widget.user!.username);
    textController3 = TextEditingController(text: widget.user!.email);
    textController4 = TextEditingController(text: widget.user!.bio);
    textController5 = TextEditingController(text: widget.user!.facebookUrl);
    textController6 = TextEditingController(text: widget.user!.instagramUrl);
    textController7 = TextEditingController(text: widget.user!.tiktokUrl);
    textController8 = TextEditingController(text: widget.user!.website);
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
    textController6?.dispose();
    textController7?.dispose();
    textController8?.dispose();
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
            logFirebaseEvent('EDIT_PROFILE_arrow_back_rounded_ICN_ON_T');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'yywdy3z8' /* Edit Profile */,
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
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'EDIT_PROFILE_PAGE_Text_salhrfou_ON_TAP');
                        logFirebaseEvent('Text_Navigate-Back');
                        context.pop();
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '41l0g069' /* Cancel */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              fontSize: 16,
                            ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'EDIT_PROFILE_PAGE_Text_jl6sheg8_ON_TAP');
                        logFirebaseEvent('Text_Backend-Call');

                        final usersUpdateData = createUsersRecordData(
                          displayName: textController1!.text,
                          username: textController2!.text,
                          website: textController8!.text,
                          bio: textController4!.text,
                          facebookUrl: textController5!.text,
                          instagramUrl: textController6!.text,
                          tiktokUrl: textController7!.text,
                          email: widget.user!.email,
                          hasFacebook: switchListTileValue1,
                          hasInstagram: switchListTileValue2,
                          hasTikTok: switchListTileValue3,
                          hasLink: switchListTileValue4,
                          address: placePickerValue.address,
                          locationDelivery: placePickerValue.latLng,
                        );
                        await widget.user!.reference.update(usersUpdateData);
                        logFirebaseEvent('Text_Navigate-Back');
                        context.pop();
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '8k481h5f' /* Done */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    color: Color(0x55EEEEEE),
                  ),
                ),
              ),
              if (functions.hasUploadedMedia(uploadedFileUrl))
                Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.user!.photoUrl,
                      'https://p1.pxfuel.com/preview/828/149/229/indistinct-blurred-pineapple-rough.jpg',
                    ),
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'EDIT_PROFILE_PAGE_Text_swsky1q8_ON_TAP');
                      logFirebaseEvent('Text_Upload-Photo-Video');
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        allowPhoto: true,
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
                                    await uploadData(m.storagePath, m.bytes))))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        if (downloadUrls.length == selectedMedia.length) {
                          setState(() => uploadedFileUrl = downloadUrls.first);
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

                      logFirebaseEvent('Text_Backend-Call');

                      final usersUpdateData = createUsersRecordData(
                        photoUrl: uploadedFileUrl,
                      );
                      await widget.user!.reference.update(usersUpdateData);
                    },
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'vur78gex' /* Change Profile Photo */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    color: Color(0x55EEEEEE),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 30,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextFormField(
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                'yjxbwx95' /* Name */,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontSize: 16,
                                    ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0x55EEEEEE),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'EDIT_PROFILE_PAGE_Icon_o3p3mkft_ON_TAP');
                        logFirebaseEvent('Icon_Alert-Dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Success!'),
                              content:
                                  Text('This information has been changed'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 30,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextFormField(
                            controller: textController2,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                'ybtsozrt' /* Username */,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontSize: 16,
                                    ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: Container(
                              width: double.infinity,
                              height: 1,
                              decoration: BoxDecoration(
                                color: Color(0x55EEEEEE),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 30,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextFormField(
                            controller: textController3,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                'gawuvie6' /* Email */,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontSize: 16,
                                    ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0x55EEEEEE),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'EDIT_PROFILE_PAGE_Icon_an7dmako_ON_TAP');
                        logFirebaseEvent('Icon_Alert-Dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Success!'),
                              content:
                                  Text('This information has been changed'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 30,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextFormField(
                            controller: textController4,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: FFLocalizations.of(context).getText(
                                '6mb0cuhf' /* Bio */,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      fontSize: 16,
                                    ),
                            maxLines: 2,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'zs3pzjiw' /* Address: */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: AuthUserStreamWidget(
                              child: Text(
                                valueOrDefault(
                                    currentUserDocument?.address, ''),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                              ),
                            ),
                          ),
                          FlutterFlowPlacePicker(
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
                              'pu6qyvhw' /* Select Location */,
                            ),
                            icon: Icon(
                              Icons.place,
                              color: Colors.white,
                              size: 16,
                            ),
                            buttonOptions: FFButtonOptions(
                              width: 200,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
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
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Color(0x55EEEEEE),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Color(0x55EEEEEE),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 30,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                            child: AuthUserStreamWidget(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(99),
                                  bottomRight: Radius.circular(99),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(99),
                                ),
                                child: SwitchListTile(
                                  value: switchListTileValue1 ??=
                                      valueOrDefault<bool>(
                                          currentUserDocument?.hasFacebook,
                                          false),
                                  onChanged: (newValue) => setState(
                                      () => switchListTileValue1 = newValue),
                                  title: Text(
                                    FFLocalizations.of(context).getText(
                                      '1ilvusb9' /* Facebook */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          fontSize: 14,
                                        ),
                                  ),
                                  tileColor:
                                      FlutterFlowTheme.of(context).primaryDark,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  dense: true,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                ),
                              ),
                            ),
                          ),
                          if (switchListTileValue1 ?? true)
                            TextFormField(
                              controller: textController5,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: FFLocalizations.of(context).getText(
                                  'cvzvvesm' /* Facebook */,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    fontSize: 16,
                                  ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0x55EEEEEE),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 30,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                            child: AuthUserStreamWidget(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(99),
                                  bottomRight: Radius.circular(99),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(99),
                                ),
                                child: SwitchListTile(
                                  value: switchListTileValue2 ??=
                                      valueOrDefault<bool>(
                                          currentUserDocument?.hasInstagram,
                                          false),
                                  onChanged: (newValue) => setState(
                                      () => switchListTileValue2 = newValue),
                                  title: Text(
                                    FFLocalizations.of(context).getText(
                                      'y25ohtbs' /* Instagram */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          fontSize: 14,
                                        ),
                                  ),
                                  tileColor:
                                      FlutterFlowTheme.of(context).primaryDark,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  dense: true,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                ),
                              ),
                            ),
                          ),
                          if (switchListTileValue2 ?? true)
                            TextFormField(
                              controller: textController6,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: FFLocalizations.of(context).getText(
                                  'y5oy7614' /* Instagram */,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    fontSize: 16,
                                  ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0x55EEEEEE),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 30,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                            child: AuthUserStreamWidget(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(99),
                                  bottomRight: Radius.circular(99),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(99),
                                ),
                                child: SwitchListTile(
                                  value: switchListTileValue3 ??=
                                      valueOrDefault<bool>(
                                          currentUserDocument?.hasTikTok,
                                          false),
                                  onChanged: (newValue) => setState(
                                      () => switchListTileValue3 = newValue),
                                  title: Text(
                                    FFLocalizations.of(context).getText(
                                      '1smutidc' /* TikTok */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          fontSize: 14,
                                        ),
                                  ),
                                  tileColor:
                                      FlutterFlowTheme.of(context).primaryDark,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  dense: true,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                ),
                              ),
                            ),
                          ),
                          if (switchListTileValue3 ?? true)
                            TextFormField(
                              controller: textController7,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: FFLocalizations.of(context).getText(
                                  '6xpwraia' /* Tiktok */,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    fontSize: 16,
                                  ),
                              textAlign: TextAlign.start,
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0x55EEEEEE),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 30,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                            child: AuthUserStreamWidget(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(99),
                                  bottomRight: Radius.circular(99),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(99),
                                ),
                                child: SwitchListTile(
                                  value: switchListTileValue4 ??=
                                      valueOrDefault<bool>(
                                          currentUserDocument?.hasLink, false),
                                  onChanged: (newValue) => setState(
                                      () => switchListTileValue4 = newValue),
                                  title: Text(
                                    FFLocalizations.of(context).getText(
                                      'dvagngt6' /* Link */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          fontSize: 14,
                                        ),
                                  ),
                                  tileColor:
                                      FlutterFlowTheme.of(context).primaryDark,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  dense: true,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                ),
                              ),
                            ),
                          ),
                          if (switchListTileValue4 ?? true)
                            TextFormField(
                              controller: textController8,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: FFLocalizations.of(context).getText(
                                  'j0ih6lb9' /* Link */,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    fontSize: 16,
                                  ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: Container(
                              width: double.infinity,
                              height: 1,
                              decoration: BoxDecoration(
                                color: Color(0x55EEEEEE),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
