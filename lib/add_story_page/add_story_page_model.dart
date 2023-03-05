import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddStoryPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for campaignName widget.
  TextEditingController? campaignNameController;
  String? Function(BuildContext, String?)? campaignNameControllerValidator;
  // State field(s) for website widget.
  TextEditingController? websiteController;
  String? Function(BuildContext, String?)? websiteControllerValidator;
  // State field(s) for storyDescription widget.
  TextEditingController? storyDescriptionController;
  String? Function(BuildContext, String?)? storyDescriptionControllerValidator;
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  StoriesRecord? restStory;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    campaignNameController?.dispose();
    websiteController?.dispose();
    storyDescriptionController?.dispose();
  }

  /// Additional helper methods are added here.

}
