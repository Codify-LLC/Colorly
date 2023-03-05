import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTriviaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField1 widget.
  TextEditingController? textField1Controller;
  String? Function(BuildContext, String?)? textField1ControllerValidator;
  // State field(s) for TextField2 widget.
  TextEditingController? textField2Controller;
  String? Function(BuildContext, String?)? textField2ControllerValidator;
  // State field(s) for TextField3 widget.
  TextEditingController? textField3Controller;
  String? Function(BuildContext, String?)? textField3ControllerValidator;
  // State field(s) for TextField4 widget.
  TextEditingController? textField4Controller;
  String? Function(BuildContext, String?)? textField4ControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TriviaRecord? triviaOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    textField1Controller?.dispose();
    textField2Controller?.dispose();
    textField3Controller?.dispose();
    textField4Controller?.dispose();
  }

  /// Additional helper methods are added here.

}
