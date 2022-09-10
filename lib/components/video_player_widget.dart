import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    Key? key,
    this.url,
  }) : super(key: key);

  final String? url;

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return FlutterFlowVideoPlayer(
      path: valueOrDefault<String>(
        widget.url,
        'http://colorly.app/wp-content/uploads/2022/05/Orange-Minimalist-Tea-Mobile-Video.mp4',
      ),
      videoType: VideoType.network,
      autoPlay: true,
      looping: true,
      showControls: false,
      allowFullScreen: false,
      allowPlaybackSpeedMenu: false,
    );
  }
}
