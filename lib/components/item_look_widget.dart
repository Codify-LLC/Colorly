import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemLookWidget extends StatefulWidget {
  const ItemLookWidget({
    Key? key,
    this.menuItem,
    this.inCartItem,
  }) : super(key: key);

  final MenuItemRecord? menuItem;
  final InCartItemRecord? inCartItem;

  @override
  _ItemLookWidgetState createState() => _ItemLookWidgetState();
}

class _ItemLookWidgetState extends State<ItemLookWidget> {
  Map<Option1Record, bool> checkboxListTileValueMap = {};
  List<Option1Record> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  TextEditingController? textController;

  InCartItemRecord? shoppingBagItem3;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryDark,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 0),
                                child: Text(
                                  widget.menuItem!.itemName!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 0),
                                child: Text(
                                  widget.menuItem!.itemDescription!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xD2EEEEEE),
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 0),
                                child: Text(
                                  formatNumber(
                                    widget.menuItem!.itemPrice!,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.periodDecimal,
                                    currency: '\$',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF59CD00),
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Builder(
                          builder: (context) {
                            final modifiers =
                                widget.menuItem!.modifier!.toList();
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(modifiers.length,
                                  (modifiersIndex) {
                                final modifiersItem = modifiers[modifiersIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: 2,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                              borderRadius:
                                                  BorderRadius.circular(99),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    StreamBuilder<MenuItemRecord>(
                                      stream: MenuItemRecord.getDocument(
                                          widget.menuItem!.reference),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: SpinKitThreeBounce(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 30,
                                              ),
                                            ),
                                          );
                                        }
                                        final rowMenuItemRecord =
                                            snapshot.data!;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 10, 0),
                                                child: Text(
                                                  modifiersItem,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: StreamBuilder<
                                              List<Option1Record>>(
                                            stream: queryOption1Record(
                                              queryBuilder: (option1Record) =>
                                                  option1Record
                                                      .where('menuItemRef',
                                                          isEqualTo: widget
                                                              .menuItem!
                                                              .reference)
                                                      .where('option1Title',
                                                          isEqualTo:
                                                              modifiersItem)
                                                      .orderBy('option1Price'),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: SpinKitThreeBounce(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 30,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<Option1Record>
                                                  listViewOption1RecordList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewOption1RecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewOption1Record =
                                                      listViewOption1RecordList[
                                                          listViewIndex];
                                                  return Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: Color(0xFFF5F5F5),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0),
                                                                child: Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(25),
                                                                      ),
                                                                    ),
                                                                    unselectedWidgetColor:
                                                                        Color(
                                                                            0xFF707070),
                                                                  ),
                                                                  child:
                                                                      CheckboxListTile(
                                                                    value: checkboxListTileValueMap[
                                                                            listViewOption1Record] ??=
                                                                        false,
                                                                    onChanged: (newValue) =>
                                                                        setState(() =>
                                                                            checkboxListTileValueMap[listViewOption1Record] =
                                                                                newValue!),
                                                                    title: Text(
                                                                      listViewOption1Record
                                                                          .option1Name!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .title3,
                                                                    ),
                                                                    subtitle:
                                                                        Text(
                                                                      formatNumber(
                                                                        listViewOption1Record
                                                                            .option1Price!,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.periodDecimal,
                                                                        currency:
                                                                            '\$',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                Color(0xFF43C643),
                                                                          ),
                                                                    ),
                                                                    tileColor:
                                                                        Color(
                                                                            0xFFF5F5F5),
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                    dense:
                                                                        false,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .trailing,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryDark,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: TextFormField(
                                    controller: textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'yhgbyt9c' /* Special Instructions */,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 20, 20, 0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                    maxLines: 4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'ITEM_LOOK_COMP_Container_3pc8326e_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_Backend-Call');

                                      final inCartItemCreateData = {
                                        ...createInCartItemRecordData(
                                          menuItem: widget.menuItem!.reference,
                                          user: currentUserReference,
                                          price: functions.cartItemPrice(
                                              widget.menuItem!.itemPrice,
                                              checkboxListTileCheckedItems
                                                  .map((e) => e.option1Price!)
                                                  .toList()),
                                          quantity: 1.0,
                                          timeAdded: getCurrentTimestamp,
                                          shoppingBag:
                                              currentUserDocument!.shoppingBag,
                                          specialNote: textController!.text,
                                        ),
                                        'option1': checkboxListTileCheckedItems
                                            .map((e) => e.reference)
                                            .toList(),
                                      };
                                      var inCartItemRecordReference =
                                          InCartItemRecord.collection.doc();
                                      await inCartItemRecordReference
                                          .set(inCartItemCreateData);
                                      shoppingBagItem3 =
                                          InCartItemRecord.getDocumentFromData(
                                              inCartItemCreateData,
                                              inCartItemRecordReference);
                                      logFirebaseEvent(
                                          'Container_Navigate-Back');
                                      context.pop();

                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        borderRadius: BorderRadius.circular(99),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ntmimgiy' /* Add */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Text(
                                              functions
                                                  .cartItemPrice(
                                                      widget
                                                          .menuItem!.itemPrice,
                                                      checkboxListTileCheckedItems
                                                          .map((e) =>
                                                              e.option1Price!)
                                                          .toList())
                                                  .toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
