import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dynamic_page_view_model.dart';
export 'dynamic_page_view_model.dart';

class DynamicPageViewWidget extends StatefulWidget {
  const DynamicPageViewWidget({
    Key? key,
    this.restaurantDoc,
  }) : super(key: key);

  final RestaurantsRecord? restaurantDoc;

  @override
  _DynamicPageViewWidgetState createState() => _DynamicPageViewWidgetState();
}

class _DynamicPageViewWidgetState extends State<DynamicPageViewWidget> {
  late DynamicPageViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DynamicPageViewModel());

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

    return Builder(
      builder: (context) {
        final gallery = widget.restaurantDoc!.gallery!.toList();
        return Container(
          width: double.infinity,
          child: PageView.builder(
            controller: _model.pageViewController ??=
                PageController(initialPage: min(0, gallery.length - 1)),
            scrollDirection: Axis.horizontal,
            itemCount: gallery.length,
            itemBuilder: (context, galleryIndex) {
              final galleryItem = gallery[galleryIndex];
              return InkWell(
                onTap: () async {
                  logFirebaseEvent('DYNAMIC_VIEW_MediaDisplay_b4xb4ms9_ON_TA');
                  logFirebaseEvent('MediaDisplay_navigate_to');

                  context.pushNamed(
                    'gallery',
                    queryParams: {
                      'restaurant': serializeParam(
                        widget.restaurantDoc,
                        ParamType.Document,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'restaurant': widget.restaurantDoc,
                    },
                  );
                },
                child: FlutterFlowMediaDisplay(
                  path: galleryItem,
                  imageBuilder: (path) => ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: CachedNetworkImage(
                      imageUrl: path,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                    path: path,
                    width: 300.0,
                    autoPlay: true,
                    looping: true,
                    showControls: false,
                    allowFullScreen: false,
                    allowPlaybackSpeedMenu: false,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
