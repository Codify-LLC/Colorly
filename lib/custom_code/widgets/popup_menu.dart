// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class PopupMenu extends StatefulWidget {
  const PopupMenu({
    Key? key,
    this.width,
    this.height,
    this.backGroundColor,
    required this.menuElevation,
    required this.action,
    required this.values,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? backGroundColor;
  final double menuElevation;
  final Future<dynamic> Function() action;
  final List<String> values;

  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        elevation: widget.menuElevation,
        color: widget.backGroundColor,
        onSelected: (value) async {
          setState(() => {
                FFAppState().SelectedMenu = ("$value"),
              });
          widget.action.call();
        },
        itemBuilder: (context) {
          return widget.values.map((String choice) {
            return PopupMenuItem(
              value: choice,
              child: Text("$choice"),
            );
          }).toList();
        });
  }
}
