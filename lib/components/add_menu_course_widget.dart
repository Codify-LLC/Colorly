import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMenuCourseWidget extends StatefulWidget {
  const AddMenuCourseWidget({
    Key? key,
    this.restaurant,
  }) : super(key: key);

  final RestaurantsRecord? restaurant;

  @override
  _AddMenuCourseWidgetState createState() => _AddMenuCourseWidgetState();
}

class _AddMenuCourseWidgetState extends State<AddMenuCourseWidget> {
  String uploadedFileUrl = '';
  TextEditingController? textController1;
  TextEditingController? textController2;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 385,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional(0.7, 1.25),
                  children: [
                    FlutterFlowMediaDisplay(
                      path: valueOrDefault<String>(
                        uploadedFileUrl,
                        'https://images.squarespace-cdn.com/content/v1/53b839afe4b07ea978436183/1608506169128-S6KYNEV61LEP5MS1UIH4/traditional-food-around-the-world-Travlinmad.jpg',
                      ),
                      imageBuilder: (path) => ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: Image.network(
                          path,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                        path: path,
                        width: 300,
                        autoPlay: false,
                        looping: true,
                        showControls: true,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'ADD_MENU_COURSE_Container_6bw32yr2_ON_TA');
                        logFirebaseEvent('Container_Upload-Photo-Video');
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
                          final downloadUrls = (await Future.wait(selectedMedia
                                  .map((m) async => await uploadData(
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
                      child: Material(
                        color: Colors.transparent,
                        elevation: 4,
                        shape: const CircleBorder(),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF060606),
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: FaIcon(
                            FontAwesomeIcons.pen,
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                  child: TextFormField(
                    controller: textController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'qunhzf4a' /* Menu Course */,
                      ),
                      hintText: FFLocalizations.of(context).getText(
                        'mb7db7uq' /* [Some hint text...] */,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                  child: TextFormField(
                    controller: textController2,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        '28s7tqs6' /* Course Description */,
                      ),
                      hintText: FFLocalizations.of(context).getText(
                        '579cldxs' /* [Some hint text...] */,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ADD_MENU_COURSE_COMP_ADD_BTN_ON_TAP');
                    logFirebaseEvent('Button_Backend-Call');

                    final menuCourseCreateData = createMenuCourseRecordData(
                      courseName: textController1!.text,
                      restRef: widget.restaurant!.reference,
                      createdAt: getCurrentTimestamp,
                      courseDescription: textController2!.text,
                      courseImage: valueOrDefault<String>(
                        uploadedFileUrl,
                        'https://images.squarespace-cdn.com/content/v1/53b839afe4b07ea978436183/1608506169128-S6KYNEV61LEP5MS1UIH4/traditional-food-around-the-world-Travlinmad.jpg',
                      ),
                    );
                    await MenuCourseRecord.collection
                        .doc()
                        .set(menuCourseCreateData);
                    logFirebaseEvent('Button_Navigate-Back');
                    context.pop();
                  },
                  text: FFLocalizations.of(context).getText(
                    '2pwee89s' /* Add */,
                  ),
                  icon: Icon(
                    Icons.add_rounded,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
        ],
      ),
    );
  }
}
