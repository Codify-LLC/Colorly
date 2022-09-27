import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({
    Key? key,
    this.restaurant,
    this.restaurantRef,
  }) : super(key: key);

  final RestaurantsRecord? restaurant;
  final DocumentReference? restaurantRef;

  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'gallery'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryDark,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('GALLERY_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'svjs0en5' /* Gallery */,
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                  ),
            ),
            Text(
              widget.restaurant!.restaurantName!,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    fontSize: 18,
                  ),
            ),
          ],
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryDark,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    final gallery = widget.restaurant!.gallery!.toList();
                    return MasonryGridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      itemCount: gallery.length,
                      itemBuilder: (context, galleryIndex) {
                        final galleryItem = gallery[galleryIndex];
                        return Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: FlutterFlowMediaDisplay(
                            path: galleryItem,
                            imageBuilder: (path) => ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: path,
                                fit: BoxFit.cover,
                              ),
                            ),
                            videoPlayerBuilder: (path) =>
                                FlutterFlowVideoPlayer(
                              path: path,
                              autoPlay: false,
                              looping: true,
                              showControls: true,
                              allowFullScreen: true,
                              allowPlaybackSpeedMenu: false,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
