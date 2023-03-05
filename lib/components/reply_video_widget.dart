import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reply_video_model.dart';
export 'reply_video_model.dart';

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
  late ReplyVideoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReplyVideoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2.0,
                sigmaY: 2.0,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50.0, 50.0, 50.0, 50.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 1.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: StreamBuilder<ReplyVideosRecord>(
                      stream: ReplyVideosRecord.getDocument(widget.video2!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: SpinKitThreeBounce(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 30.0,
                              ),
                            ),
                          );
                        }
                        final videoPlayerReplyVideosRecord = snapshot.data!;
                        return FlutterFlowVideoPlayer(
                          path: videoPlayerReplyVideosRecord.video!,
                          videoType: VideoType.network,
                          width: 270.0,
                          height: 480.0,
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
        ),
      ],
    );
  }
}
