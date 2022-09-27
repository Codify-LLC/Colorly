import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/delivery_sheet_widget.dart';
import '../components/emptycart_widget.dart';
import '../components/item_look_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SingleItemWidget extends StatefulWidget {
  const SingleItemWidget({
    Key? key,
    this.menuItem,
    this.restaurant,
  }) : super(key: key);

  final MenuItemRecord? menuItem;
  final RestaurantsRecord? restaurant;

  @override
  _SingleItemWidgetState createState() => _SingleItemWidgetState();
}

class _SingleItemWidgetState extends State<SingleItemWidget> {
  PageController? pageViewController;
  String uploadedFileUrl = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'singleItem'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryDark,
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            logFirebaseEvent('SINGLE_ITEM_PAGE_Icon_cvws09sr_ON_TAP');
            logFirebaseEvent('Icon_Navigate-Back');
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).tertiaryColor,
            size: 24,
          ),
        ),
        title: Text(
          widget.restaurant!.restaurantName!,
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).tertiaryColor,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryDark,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional(0, -1),
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 425,
                        constraints: BoxConstraints(
                          maxHeight: 425,
                        ),
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final uploadedPhotos =
                                widget.menuItem!.uploadedPhotos!.toList();
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 1,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 50),
                                    child: PageView.builder(
                                      controller: pageViewController ??=
                                          PageController(
                                              initialPage: min(0,
                                                  uploadedPhotos.length - 1)),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: uploadedPhotos.length,
                                      itemBuilder:
                                          (context, uploadedPhotosIndex) {
                                        final uploadedPhotosItem =
                                            uploadedPhotos[uploadedPhotosIndex];
                                        return CachedNetworkImage(
                                          imageUrl: uploadedPhotosItem,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 425,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0.55),
                                    child: SmoothPageIndicator(
                                      controller: pageViewController ??=
                                          PageController(
                                              initialPage: min(0,
                                                  uploadedPhotos.length - 1)),
                                      count: uploadedPhotos.length,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) {
                                        pageViewController!.animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      effect: ExpandingDotsEffect(
                                        expansionFactor: 2,
                                        spacing: 8,
                                        radius: 16,
                                        dotWidth: 16,
                                        dotHeight: 16,
                                        dotColor: FlutterFlowTheme.of(context)
                                            .primaryDark,
                                        activeDotColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryColor,
                                        paintStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0.85),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 350, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryDark,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x770F0F0F),
                                  offset: Offset(0, -8),
                                  spreadRadius: 1,
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            alignment: AlignmentDirectional(0, 1),
                            child: Align(
                              alignment: AlignmentDirectional(0, -0.15),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              widget.menuItem!.itemName!,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title2
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w800,
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
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.9, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 40,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            icon: Icon(
                              Icons.add_box_outlined,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              size: 20,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SINGLE_ITEM_add_box_outlined_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_Upload-Photo-Video');
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                imageQuality: 100,
                                allowPhoto: true,
                                allowVideo: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                final downloadUrls = (await Future.wait(
                                        selectedMedia.map((m) async =>
                                            await uploadData(
                                                m.storagePath, m.bytes))))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                if (downloadUrls.length ==
                                    selectedMedia.length) {
                                  setState(() =>
                                      uploadedFileUrl = downloadUrls.first);
                                  showUploadMessage(
                                    context,
                                    'Success!',
                                  );
                                } else {
                                  showUploadMessage(
                                    context,
                                    'Failed to upload media',
                                  );
                                  return;
                                }
                              }

                              logFirebaseEvent('IconButton_Backend-Call');

                              final menuItemUpdateData = {
                                'uploadedPhotos':
                                    FieldValue.arrayUnion([uploadedFileUrl]),
                              };
                              await widget.menuItem!.reference
                                  .update(menuItemUpdateData);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      widget.menuItem!.itemDescription!,
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      formatNumber(
                        widget.menuItem!.itemPrice!,
                        formatType: FormatType.decimal,
                        decimalType: DecimalType.periodDecimal,
                        currency: '\$',
                      ),
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF59CD00),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            if (valueOrDefault<bool>(currentUserDocument?.isPremium, false) ==
                true)
              AuthUserStreamWidget(
                child: Stack(
                  children: [
                    if (widget.restaurant!.reference !=
                        currentUserDocument!.orderingRestaurant)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'SINGLE_ITEM_START_NEW_ORDER_BTN_ON_TAP');
                                if (currentUserDocument!.shoppingBag != null) {
                                  logFirebaseEvent('Button_Bottom-Sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: EmptycartWidget(
                                          restaurant: widget.restaurant,
                                          restaurantRef:
                                              widget.restaurant!.reference,
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                } else {
                                  logFirebaseEvent('Button_Bottom-Sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: Container(
                                          height: 400,
                                          child: DeliverySheetWidget(
                                            restaurant: widget.restaurant,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                }
                              },
                              text: FFLocalizations.of(context).getText(
                                'ofc0057p' /* Start New Order */,
                              ),
                              options: FFButtonOptions(
                                width: 150,
                                height: 54,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
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
                          ],
                        ),
                      ),
                    if (widget.restaurant!.reference ==
                        currentUserDocument!.orderingRestaurant)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SINGLE_ITEM_PAGE_ADD_BTN_ON_TAP');
                                  if (widget.restaurant!.reference ==
                                      currentUserDocument!.orderingRestaurant) {
                                    logFirebaseEvent('Button_Bottom-Sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: ItemLookWidget(
                                            menuItem: widget.menuItem,
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  } else {
                                    logFirebaseEvent('Button_Bottom-Sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: EmptycartWidget(
                                            user: currentUserReference,
                                            restaurant: widget.restaurant,
                                            restaurantRef:
                                                widget.restaurant!.reference,
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  '9q41l2h4' /* Add */,
                                ),
                                icon: Icon(
                                  Icons.shopping_bag_rounded,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 150,
                                  height: 54,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'zjedxchi' /* About Restaurant */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      widget.restaurant!.restDescription!,
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF8B97A2),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'nxu4f3ex' /* Other Items */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 20),
              child: StreamBuilder<List<MenuItemRecord>>(
                stream: queryMenuItemRecord(
                  queryBuilder: (menuItemRecord) => menuItemRecord
                      .where('restRef', isEqualTo: widget.restaurant!.reference)
                      .where('featuredItem', isEqualTo: true),
                ),
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
                  List<MenuItemRecord> eventsListMenuItemRecordList =
                      snapshot.data!;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(eventsListMenuItemRecordList.length,
                              (eventsListIndex) {
                        final eventsListMenuItemRecord =
                            eventsListMenuItemRecordList[eventsListIndex];
                        return Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 20, 0, 20),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'SINGLE_ITEM_Container_0ti8l0b7_ON_TAP');
                              logFirebaseEvent('Container_Navigate-To');

                              context.pushNamed(
                                'singleItem',
                                queryParams: {
                                  'menuItem': serializeParam(
                                      eventsListMenuItemRecord,
                                      ParamType.Document),
                                  'restaurant': serializeParam(
                                      widget.restaurant, ParamType.Document),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'menuItem': eventsListMenuItemRecord,
                                  'restaurant': widget.restaurant,
                                },
                              );
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                width: 250,
                                height: 210,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6, 6, 0, 0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      valueOrDefault<String>(
                                                    eventsListMenuItemRecord
                                                        .itemImage,
                                                    'https://cdn.vox-cdn.com/thumbor/9qN-DmdwZE__GqwuoJIinjUXzmk=/0x0:960x646/1200x900/filters:focal(404x247:556x399)/cdn.vox-cdn.com/uploads/chorus_image/image/63084260/foodlife_2.0.jpg',
                                                  ),
                                                  width: 238,
                                                  height: 125,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6, 6, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            eventsListMenuItemRecord.itemName!
                                                .maybeHandleOverflow(
                                              maxChars: 18,
                                              replacement: '…',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            eventsListMenuItemRecord
                                                .itemDescription!
                                                .maybeHandleOverflow(
                                              maxChars: 25,
                                              replacement: '…',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF414141),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            formatNumber(
                                              eventsListMenuItemRecord
                                                  .itemPrice!,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                              currency: '\$',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF43C643),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
