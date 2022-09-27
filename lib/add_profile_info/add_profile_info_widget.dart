import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProfileInfoWidget extends StatefulWidget {
  const AddProfileInfoWidget({Key? key}) : super(key: key);

  @override
  _AddProfileInfoWidgetState createState() => _AddProfileInfoWidgetState();
}

class _AddProfileInfoWidgetState extends State<AddProfileInfoWidget> {
  String uploadedFileUrl1 = '';
  String uploadedFileUrl2 = '';
  TextEditingController? yourNameController;
  TextEditingController? userNameController;
  TextEditingController? bioController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    bioController = TextEditingController();
    userNameController = TextEditingController();
    yourNameController = TextEditingController();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'addProfileInfo'});
  }

  @override
  void dispose() {
    bioController?.dispose();
    userNameController?.dispose();
    yourNameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF0F0F0F),
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            '6uir9wij' /* Update Your Profile */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 24, 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '38n0j2bo' /* Fill out your profile now in o... */,
                              ),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'ADD_PROFILE_INFO_Container_wkaeera2_ON_T');
                        logFirebaseEvent('Container_Upload-Photo-Video');
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          allowPhoto: true,
                          backgroundColor:
                              FlutterFlowTheme.of(context).tertiaryColor,
                          textColor: FlutterFlowTheme.of(context).primaryDark,
                          pickerFontFamily: 'Lexend Deca',
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          final downloadUrls = (await Future.wait(selectedMedia
                                  .map((m) async => await uploadData(
                                      m.storagePath, m.bytes))))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          if (downloadUrls.length == selectedMedia.length) {
                            setState(
                                () => uploadedFileUrl1 = downloadUrls.first);
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
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFFA4A4A4),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/addUser@2x.png',
                            ).image,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Visibility(
                          visible: functions.hasUploadedMedia(uploadedFileUrl1),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'ADD_PROFILE_INFO_CircleImage_02q89tae_ON');
                              logFirebaseEvent(
                                  'CircleImage_Upload-Photo-Video');
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
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
                            child: Container(
                              width: 120,
                              height: 120,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                valueOrDefault<String>(
                                  uploadedFileUrl1,
                                  ' https://p1.pxfuel.com/preview/828/149/229/indistinct-blurred-pineapple-rough.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: yourNameController,
                            onChanged: (_) => EasyDebounce.debounce(
                              'yourNameController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'zxeitpeu' /* Your Full Name */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFFA4A4A4),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFA4A4A4),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFA4A4A4),
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
                              suffixIcon: yourNameController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        yourNameController?.clear();
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: TextFormField(
                              controller: userNameController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'userNameController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'ezjjy6w6' /* UserName */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFFA4A4A4),
                                      fontSize: 22,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFA4A4A4),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFA4A4A4),
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
                                suffixIcon: userNameController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          userNameController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      )
                                    : null,
                              ),
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 20,
                                      ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: TextFormField(
                              controller: bioController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'bioController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  '6vkkeqvk' /* Bio */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFFA4A4A4),
                                      fontSize: 22,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'kaiici3q' /* Your Bio */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFFA4A4A4),
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFA4A4A4),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFA4A4A4),
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
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                suffixIcon: bioController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          bioController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    fontSize: 14,
                                  ),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'kh2lbk90' /* You can always update your pro... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 20, 40),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ADD_PROFILE_INFO_PAGE_SKIP_BTN_ON_TAP');
                                    logFirebaseEvent('Button_Navigate-To');

                                    context.goNamed('onboarding');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'e3lvl7b8' /* Skip */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 100,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryDark,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ADD_PROFILE_INFO_SAVE_&_CONTINUE_BTN_ON_');
                                    logFirebaseEvent('Button_Backend-Call');

                                    final usersUpdateData =
                                        createUsersRecordData(
                                      displayName: yourNameController!.text,
                                      username: '@${userNameController!.text}',
                                      bio: bioController!.text,
                                      photoUrl: uploadedFileUrl1,
                                    );
                                    await currentUserReference!
                                        .update(usersUpdateData);
                                    logFirebaseEvent('Button_Navigate-To');

                                    context.goNamed('onboarding');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'p68dc9kx' /* Save & Continue */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 180,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
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
            ],
          ),
        ),
      ),
    );
  }
}
