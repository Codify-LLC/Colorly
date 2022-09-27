import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditMenuItemWidget extends StatefulWidget {
  const EditMenuItemWidget({
    Key? key,
    this.menuCourse,
    this.restaurant,
    this.menuCourses,
    this.menuItem,
  }) : super(key: key);

  final MenuCourseRecord? menuCourse;
  final RestaurantsRecord? restaurant;
  final DocumentReference? menuCourses;
  final MenuItemRecord? menuItem;

  @override
  _EditMenuItemWidgetState createState() => _EditMenuItemWidgetState();
}

class _EditMenuItemWidgetState extends State<EditMenuItemWidget> {
  String uploadedFileUrl = '';
  bool? checkboxListTileValue;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController(text: widget.menuItem!.itemName);
    textController2 =
        TextEditingController(text: widget.menuItem!.itemDescription);
    textController3 =
        TextEditingController(text: widget.menuItem!.itemPrice?.toString());
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Material(
          color: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  blurRadius: 7,
                  color: Color(0x5D000000),
                  offset: Offset(0, -2),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'qdowe7kq' /* Add Menu Item */,
                        ),
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: AutoSizeText(
                            FFLocalizations.of(context).getText(
                              'iu9kj40j' /* Fill out the details below to ... */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
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
                Stack(
                  alignment: AlignmentDirectional(0.7, 1.25),
                  children: [
                    FlutterFlowMediaDisplay(
                      path: valueOrDefault<String>(
                        widget.menuItem!.itemImage,
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
                            'EDIT_MENU_ITEM_Container_2x32fq8h_ON_TAP');
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

                        logFirebaseEvent('Container_Backend-Call');

                        final menuItemUpdateData = createMenuItemRecordData(
                          itemImage: uploadedFileUrl,
                        );
                        await widget.menuItem!.reference
                            .update(menuItemUpdateData);
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 30, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          widget.menuCourse!.courseName!,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Lexend Deca',
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                fontSize: 22,
                              ),
                        ),
                      ),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            unselectedWidgetColor: Color(0xFF707070),
                          ),
                          child: CheckboxListTile(
                            value: checkboxListTileValue ??=
                                widget.menuItem!.featuredItem!,
                            onChanged: (newValue) => setState(
                                () => checkboxListTileValue = newValue!),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                '47pifm1i' /* Featured? */,
                              ),
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF616161),
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic,
                                      ),
                            ),
                            tileColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            activeColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            checkColor:
                                FlutterFlowTheme.of(context).tertiaryColor,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                  child: TextFormField(
                    controller: textController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'dlcgvng6' /* Item Name */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context)
                          .bodyText1
                          .override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                      hintText: FFLocalizations.of(context).getText(
                        'qzek7qqx' /* Enter your item here.... */,
                      ),
                      hintStyle: FlutterFlowTheme.of(context)
                          .bodyText1
                          .override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF2D2D2D),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF2D2D2D),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Color(0xFF2D2D2D),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: TextFormField(
                    controller: textController2,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'dcd8nuwu' /* Item Description */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context)
                          .bodyText1
                          .override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                      hintText: FFLocalizations.of(context).getText(
                        '03yrw0ho' /* Enter a description here... */,
                      ),
                      hintStyle: FlutterFlowTheme.of(context)
                          .bodyText1
                          .override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF2D2D2D),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF2D2D2D),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Color(0xFF2D2D2D),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: TextFormField(
                    controller: textController3,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'mei09mdb' /* Item Price */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context)
                          .bodyText1
                          .override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                      hintText: FFLocalizations.of(context).getText(
                        'csgueex9' /* Enter your price here.... */,
                      ),
                      hintStyle: FlutterFlowTheme.of(context)
                          .bodyText1
                          .override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF2D2D2D),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF2D2D2D),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Color(0xFF2D2D2D),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'EDIT_MENU_ITEM_COMP_CANCEL_BTN_ON_TAP');
                          logFirebaseEvent('Button_Navigate-Back');
                          context.pop();
                        },
                        text: FFLocalizations.of(context).getText(
                          '4dqvo2qw' /* Cancel */,
                        ),
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryDark,
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
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'EDIT_MENU_ITEM_COMP_ADD_ITEM_BTN_ON_TAP');
                          logFirebaseEvent('Button_Backend-Call');

                          final menuItemUpdateData = createMenuItemRecordData(
                            itemName: textController1!.text,
                            itemDescription: textController2!.text,
                            itemPrice: double.parse(textController3!.text),
                          );
                          await widget.menuItem!.reference
                              .update(menuItemUpdateData);
                          logFirebaseEvent('Button_Navigate-Back');
                          context.pop();
                        },
                        text: FFLocalizations.of(context).getText(
                          'ezfl9314' /* Add Item */,
                        ),
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
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
    );
  }
}
