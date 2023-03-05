import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pickup_delivery_model.dart';
export 'pickup_delivery_model.dart';

class PickupDeliveryWidget extends StatefulWidget {
  const PickupDeliveryWidget({
    Key? key,
    this.restaurant,
  }) : super(key: key);

  final RestaurantsRecord? restaurant;

  @override
  _PickupDeliveryWidgetState createState() => _PickupDeliveryWidgetState();
}

class _PickupDeliveryWidgetState extends State<PickupDeliveryWidget> {
  late PickupDeliveryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PickupDeliveryModel());

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
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Container(
                width: 196.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                  child: FlutterFlowChoiceChips(
                    options: [
                      ChipData(FFLocalizations.of(context).getText(
                        'ma38g1oe' /* Pickup */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        'wdwquanf' /* Delivery */,
                      ))
                    ],
                    onChanged: (val) =>
                        setState(() => _model.choiceChipsValue = val?.first),
                    selectedChipStyle: ChipStyle(
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                      iconColor: Colors.white,
                      iconSize: 18.0,
                      labelPadding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                      elevation: 4.0,
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor: Color(0xFFDBE2E7),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText2.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF262D34),
                                fontSize: 16.0,
                              ),
                      iconColor: Color(0xFF6B6B6B),
                      iconSize: 0.0,
                      labelPadding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                      elevation: 0.0,
                    ),
                    chipSpacing: 8.0,
                    multiselect: false,
                    alignment: WrapAlignment.start,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(40.0, 2.0, 40.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                valueOrDefault<String>(
                  '${valueOrDefault<String>(
                    widget.restaurant!.pickupTime?.toString(),
                    '20',
                  )} min.',
                  '20 min.',
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  '${valueOrDefault<String>(
                    widget.restaurant!.deliveryTime?.toString(),
                    '35',
                  )} min.',
                  '35 min.',
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
