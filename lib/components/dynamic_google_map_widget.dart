import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dynamic_google_map_model.dart';
export 'dynamic_google_map_model.dart';

class DynamicGoogleMapWidget extends StatefulWidget {
  const DynamicGoogleMapWidget({
    Key? key,
    this.restaurantDoc,
  }) : super(key: key);

  final RestaurantsRecord? restaurantDoc;

  @override
  _DynamicGoogleMapWidgetState createState() => _DynamicGoogleMapWidgetState();
}

class _DynamicGoogleMapWidgetState extends State<DynamicGoogleMapWidget> {
  late DynamicGoogleMapModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DynamicGoogleMapModel());

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

    return Builder(builder: (context) {
      final _googleMapMarker = widget.restaurantDoc;
      return FlutterFlowGoogleMap(
        controller: _model.googleMapsController,
        onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
        initialLocation: _model.googleMapsCenter ??=
            widget.restaurantDoc!.restLatLong!,
        markers: [
          if (_googleMapMarker != null)
            FlutterFlowMarker(
              _googleMapMarker.reference.path,
              _googleMapMarker.restLatLong!,
            ),
        ],
        markerColor: GoogleMarkerColor.orange,
        mapType: MapType.normal,
        style: GoogleMapStyle.dark,
        initialZoom: 16.0,
        allowInteraction: true,
        allowZoom: true,
        showZoomControls: true,
        showLocation: false,
        showCompass: false,
        showMapToolbar: false,
        showTraffic: true,
        centerMapOnMarkerTap: true,
      );
    });
  }
}
