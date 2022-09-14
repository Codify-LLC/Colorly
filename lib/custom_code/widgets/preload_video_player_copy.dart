// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:preload_page_view/preload_page_view.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import '/components/page_view_overlay_widget.dart';

class PreloadVideoPlayerCopy extends StatefulWidget {
  const PreloadVideoPlayerCopy({
    Key? key,
    this.width,
    this.height,
    required this.itemCount,
    this.preLoadPagesCount,
    required this.post,
    this.autoplay = false,
    this.looping = false,
    this.showControls = false,
    this.allowFullScreen = false,
    this.allowPlaybackSpeedMenu = false,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int itemCount;
  final int? preLoadPagesCount;
  final List<PostsRecord> post;
  final bool autoplay;
  final bool looping;
  final bool showControls;
  final bool allowFullScreen;
  final bool allowPlaybackSpeedMenu;

  @override
  _PreloadVideoPlayerCopyState createState() => _PreloadVideoPlayerCopyState();
}

class _PreloadVideoPlayerCopyState extends State<PreloadVideoPlayerCopy> {
  List<bool> foregroundFlagList = [];
  @override
  void initState() {
    super.initState();
    foregroundFlagList = List.filled(widget.itemCount, false, growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return PreloadPageView.builder(
      pageSnapping: true,
      itemCount: widget.itemCount,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int position) {
        return Stack(children: [
          FlutterFlowVideoPlayer(
            path: widget.post[position].videoUrl ??
                "http://colorly.app/wp-content/uploads/2022/05/Orange-Minimalist-Tea-Mobile-Video.mp4",
            videoType: VideoType.network,
            autoPlay: widget.autoplay,
            looping: widget.looping,
            showControls: widget.showControls,
            allowFullScreen: widget.allowFullScreen,
            allowPlaybackSpeedMenu: widget.allowPlaybackSpeedMenu,
            foreground: foregroundFlagList[position],
          ),
          PageViewOverlayWidget(posts: widget.post[position])
        ]);
      },
      onPageChanged: (int position) {
        setState(() {
          foregroundFlagList[position] = true;
        });
        print('page changed. current: $position');
      },
      preloadPagesCount: widget.preLoadPagesCount ?? 3,
    );
  }
}

const kDefaultAspectRatio = 16 / 9;

enum VideoType {
  asset,
  network,
}

class FlutterFlowVideoPlayer extends StatefulWidget {
  const FlutterFlowVideoPlayer({
    this.path =
        "http://colorly.app/wp-content/uploads/2022/05/Orange-Minimalist-Tea-Mobile-Video.mp4",
    this.videoType = VideoType.network,
    this.width,
    this.height,
    this.aspectRatio,
    this.autoPlay = false,
    this.looping = false,
    this.showControls = true,
    this.allowFullScreen = true,
    this.allowPlaybackSpeedMenu = false,
    this.foreground = false,
  });

  final String path;
  final VideoType videoType;
  final double? width;
  final double? height;
  final double? aspectRatio;
  final bool autoPlay;
  final bool looping;
  final bool showControls;
  final bool allowFullScreen;
  final bool allowPlaybackSpeedMenu;
  final bool foreground;

  @override
  State<StatefulWidget> createState() => _FlutterFlowVideoPlayerState();
}

class _FlutterFlowVideoPlayerState extends State<FlutterFlowVideoPlayer> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  double get width => widget.width == null || widget.width! >= double.infinity
      ? MediaQuery.of(context).size.width
      : widget.width!;

  double? get height =>
      widget.height == null || widget.height! >= double.infinity
          ? (width != null ? width / aspectRatio : null)
          : widget.height!;

  double get aspectRatio =>
      _chewieController?.videoPlayerController?.value?.aspectRatio ??
      kDefaultAspectRatio;

  Future initializePlayer() async {
    _videoPlayerController = widget.videoType == VideoType.network
        ? VideoPlayerController.network(widget.path)
        : VideoPlayerController.asset(widget.path);
    await _videoPlayerController?.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      aspectRatio: widget.aspectRatio,
      autoPlay: widget.autoPlay,
      looping: widget.looping,
      showControls: widget.showControls,
      allowFullScreen: widget.allowFullScreen,
      allowPlaybackSpeedChanging: widget.allowPlaybackSpeedMenu,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController != null &&
        _chewieController!.videoPlayerController.value.isInitialized) {
      widget.foreground
          ? _videoPlayerController!.play
          : _videoPlayerController!.pause;
    }
    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        height: height,
        width: width,
        child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController!)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Loading'),
                ],
              ),
      ),
    );
  }
}
