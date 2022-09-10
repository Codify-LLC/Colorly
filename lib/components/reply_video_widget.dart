import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ReplyVideoWidget extends StatefulWidget {
  const ReplyVideoWidget({
    Key? key,
    this.video,
    this.video2,
  }) : super(key: key);

  final ReplyVideosRecord? video;
  final DocumentReference? video2;

  @override
  _ReplyVideoWidgetState createState() => _ReplyVideoWidgetState();
}

class _ReplyVideoWidgetState extends State<ReplyVideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50, 50, 50, 50),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(),
                  child: StreamBuilder<ReplyVideosRecord>(
                    stream: ReplyVideosRecord.getDocument(widget.video2!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: SpinKitThreeBounce(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 30,
                            ),
                          ),
                        );
                      }
                      final videoPlayerReplyVideosRecord = snapshot.data!;
                      return FlutterFlowVideoPlayer(
                        path: videoPlayerReplyVideosRecord.video!,
                        videoType: VideoType.network,
                        width: 270,
                        height: 480,
                        autoPlay: true,
                        looping: false,
                        showControls: true,
                        allowFullScreen: false,
                        allowPlaybackSpeedMenu: false,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
