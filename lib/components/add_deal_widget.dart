import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDealWidget extends StatefulWidget {
  const AddDealWidget({
    Key? key,
    this.restaurant,
  }) : super(key: key);

  final RestaurantsRecord? restaurant;

  @override
  _AddDealWidgetState createState() => _AddDealWidgetState();
}

class _AddDealWidgetState extends State<AddDealWidget> {
  DateTime? datePicked;
  TextEditingController? textController1;
  bool? switchListTileValue1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  bool? switchListTileValue2;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: TextFormField(
                    controller: textController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'ugbjtheh' /* Deal Title */,
                      ),
                      hintText: FFLocalizations.of(context).getText(
                        'rnvmemyk' /* 10% off, FREE Taco etc,. */,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SwitchListTile(
                    value: switchListTileValue1 ??= true,
                    onChanged: (newValue) =>
                        setState(() => switchListTileValue1 = newValue),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'kf7a2pl2' /* Active */,
                      ),
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Lexend Deca',
                            fontSize: 16,
                          ),
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: TextFormField(
                    controller: textController2,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'mskjdhcc' /* Details */,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: TextFormField(
                    controller: textController3,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'fxuj86ic' /* Conditions */,
                      ),
                      hintText: FFLocalizations.of(context).getText(
                        'm6kwjtmp' /* 10% off, FREE Taco etc,. */,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: TextFormField(
                    controller: textController4,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'uq12whdb' /* Code */,
                      ),
                      hintText: FFLocalizations.of(context).getText(
                        'hfxia8o9' /* 10% off, FREE Taco etc,. */,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  logFirebaseEvent('ADD_DEAL_COMP_Container_5na4j7d8_ON_TAP');
                  logFirebaseEvent('Container_Date-Time-Picker');
                  await DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    onConfirm: (date) {
                      setState(() => datePicked = date);
                    },
                    currentTime: getCurrentTimestamp,
                    minTime: getCurrentTimestamp,
                    locale: LocaleType.values.firstWhere(
                      (l) => l.name == FFLocalizations.of(context).languageCode,
                      orElse: () => LocaleType.en,
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.44,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color(0xFFCFD4DB),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 5, 12, 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '1wbyz0ty' /* Expiry Date */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF57636C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        Icon(
                          Icons.date_range_outlined,
                          color: Color(0xFF57636C),
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SwitchListTile(
                      value: switchListTileValue2 ??= true,
                      onChanged: (newValue) =>
                          setState(() => switchListTileValue2 = newValue),
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'qvwabcz2' /* Needs Redeemed */,
                        ),
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 16,
                            ),
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      activeColor: FlutterFlowTheme.of(context).primaryColor,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ADD_DEAL_COMP_ADD_BTN_ON_TAP');
                    logFirebaseEvent('Button_Backend-Call');

                    final dealsCreateData = createDealsRecordData(
                      restRef: widget.restaurant!.reference,
                      expiry: datePicked,
                      active: switchListTileValue1,
                      location: widget.restaurant!.restLatLong,
                      details: textController2!.text,
                      code: textController4!.text,
                      title: textController1!.text,
                      conditions: textController3!.text,
                      dealClicks: 0,
                      needsRedeemed: switchListTileValue2,
                    );
                    await DealsRecord.collection.doc().set(dealsCreateData);
                    logFirebaseEvent('Button_Clear-Text-Fields');
                    setState(() {
                      textController1?.clear();
                      textController2?.clear();
                      textController3?.clear();
                      textController4?.clear();
                    });
                  },
                  text: FFLocalizations.of(context).getText(
                    'qceko6ml' /* Add */,
                  ),
                  icon: Icon(
                    Icons.add,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
