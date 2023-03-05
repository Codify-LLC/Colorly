import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_media.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateRestaurantModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  bool isMediaUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isMediaUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for restName widget.
  TextEditingController? restNameController;
  String? Function(BuildContext, String?)? restNameControllerValidator;
  // State field(s) for TextFieldnum widget.
  TextEditingController? textFieldnumController;
  String? Function(BuildContext, String?)? textFieldnumControllerValidator;
  // State field(s) for restAdress widget.
  TextEditingController? restAdressController;
  String? Function(BuildContext, String?)? restAdressControllerValidator;
  // State field(s) for categories widget.
  TextEditingController? categoriesController;
  String? Function(BuildContext, String?)? categoriesControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for website widget.
  TextEditingController? websiteController;
  String? Function(BuildContext, String?)? websiteControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  // State field(s) for videoTou widget.
  TextEditingController? videoTouController;
  String? Function(BuildContext, String?)? videoTouControllerValidator;
  // State field(s) for onlineOrderLink widget.
  TextEditingController? onlineOrderLinkController;
  String? Function(BuildContext, String?)? onlineOrderLinkControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    restNameController?.dispose();
    textFieldnumController?.dispose();
    restAdressController?.dispose();
    categoriesController?.dispose();
    textController5?.dispose();
    websiteController?.dispose();
    textController7?.dispose();
    videoTouController?.dispose();
    onlineOrderLinkController?.dispose();
  }

  /// Additional helper methods are added here.

}
