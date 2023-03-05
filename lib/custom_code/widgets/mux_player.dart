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

import 'package:mux_player/mux_player.dart';

class MuxPlayer extends StatefulWidget {
  const MuxPlayer({
    Key? key,
    required this.width,
    required this.height,
    required this.playbackId,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String playbackId;

  @override
  _MuxPlayerState createState() => _MuxPlayerState();
}

class _MuxPlayerState extends State<MuxPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Html5Player(
        playbackId: widget.playbackId,
      ),
    );
  }
}
